//Header files - Start//
#include "AZ3166WiFi.h"
#include "AzureIotHub.h"
#include "DevKitMQTTClient.h"
#include "config.h"
#include "utility.h"
#include "SystemTickCounter.h"
#include "RingBuffer.h"
#include "parson.h"
#include "EEPROMInterface.h"
#include "http_client.h"
#include <Arduino.h>
#include <stdio.h>
#include <math.h>
#include "OledDisplay.h"
#include "AudioClassV2.h"
#include "stm32412g_discovery_audio.h"
#include "RGB_LED.h"
#include <stdint.h>

#define MFCC_WRAPPER_DEFINED
#include "featurizer.h"
//Header files - End//
//*********************************************************************************************************************************//

// Arduino build can't seem to handle lots of source files so they are all included here to make one big file.
// Even then you will probably get build errors every second build, in which case you need to delete the temporary build folder.

//Constants and variables- Start//
enum AppState
{
  APPSTATE_Init,
  APPSTATE_Error,
  APPSTATE_Recording
};

static AppState appstate;
// These numbers need to match the compiled ELL models.
const int SAMPLE_RATE = 16000;
const int SAMPLE_BIT_DEPTH = 16;
const int FEATURIZER_INPUT_SIZE = 512;
const int FRAME_RATE = 33; // assumes a "shift" of 512 and 512/16000 = 0.032ms per frame.
const int FEATURIZER_OUTPUT_SIZE = 80;
const int CLASSIFIER_OUTPUT_SIZE = 31;
const float THRESHOLD = 0.9;
static int scaled_input_buffer_pos = 0;
static float scaled_input_buffer[FEATURIZER_INPUT_SIZE]; // raw audio converted to float
const int MAX_FEATURE_BUFFERS = 10;                                                // set to buffer up to 1 second of audio in circular buffer
static float featurizer_input_buffers[MAX_FEATURE_BUFFERS][FEATURIZER_INPUT_SIZE]; // input to featurizer
static int featurizer_input_buffer_read = -1;                                      // next read pos
static int featurizer_input_buffer_write = 0;                                      // next write pos
static int dropped_frames = 0;
static float featurizer_output_buffer[FEATURIZER_OUTPUT_SIZE]; // 40 channels
static float classifier_output_buffer[CLASSIFIER_OUTPUT_SIZE]; // 31 classes
static int raw_audio_count = 0;
static char raw_audio_buffer[AUDIO_CHUNK_SIZE];
static int prediction_count = 0;
static int last_prediction = 0;
static int last_confidence = 0; // as a percentage between 0 and 100.
static uint8_t maxGain = 0;
static uint8_t minGain = 0;
int decibels = 0;
float min_level = 100;
float max_level = 0;
RGB_LED rgbLed;
static bool hasWifi = false;
static bool messageSending = true;
static uint64_t send_interval_ms;
int messageCount = 0;       // holds ID
bool messageReceived = false;
char device_id[6];
AudioClass &Audio = AudioClass::getInstance();
//Constants and variables- End//
//***********************************************************************************************************************************//

//Configuration functions - Start//
static void initWifi()
{
  Screen.print(2, "Connecting...");

  if (WiFi.begin() == WL_CONNECTED)
  {
    IPAddress ip = WiFi.localIP();
    Screen.print(1, ip.get_address());
    hasWifi = true;
    Screen.print(2, "Running... \r\n");
  }
  else
  {
    hasWifi = false;
    Screen.print(1, "No Wi-Fi\r\n ");
  }
}

static void sendConfirmationCallback(IOTHUB_CLIENT_CONFIRMATION_RESULT result)
{
  if (result == IOTHUB_CLIENT_CONFIRMATION_OK)
  {
    blinkSendConfirmation();
  }
}

static void messageCallback(const char *payLoad, int size)
{
  blinkLED();
  Screen.print(1, payLoad, true);
}

static void deviceTwinCallback(DEVICE_TWIN_UPDATE_STATE updateState, const unsigned char *payLoad, int size)
{
  char *temp = (char *)malloc(size + 1);
  if (temp == NULL)
  {
    return;
  }

  memcpy(temp, payLoad, size);
  temp[size] = '\0';
  parseTwinMessage(updateState, temp);
  free(temp);
}

static int deviceMethodCallback(const char *methodName, const unsigned char *payload, int size, unsigned char **response, int *response_size)
{
  LogInfo("Try to invoke method %s", methodName);
  const char *responseMessage = "\"Successfully invoke device method\"";
  int result = 200;

  if (strcmp(methodName, DIRECT_METHOD_NAME) == 0)
  {
    messageReceived = true;

    char *temp = (char *)malloc(size + 1);
    memcpy(temp, payload, size);
    temp[size] = '\0';

    if (temp != NULL)
    {
      Screen.init();
      Screen.print(0, "NEW MESSAGE!");
      Screen.print(2, temp);
    }

    free(temp);
  }
  else
  {
    LogInfo("No method %s found", methodName);
    responseMessage = "\"No method found\"";
    result = 404;
  }

  *response_size = strlen(responseMessage);
  *response = (unsigned char *)malloc(*response_size);
  strncpy((char *)(*response), responseMessage, *response_size);

  return result;
}
//Configuration functions - End//
//**************************************************************************************************************************************//

//Main Functions - Start//
void setup()
{
  Screen.init();
  Screen.print(0, "IoT Device Demo");
  Screen.print(2, "Initializing...");

  Screen.print(3, " > Serial");
  Serial.begin(115200);

  // Initialize the WiFi module
  Screen.print(3, " > WiFi");
  hasWifi = false;
  initWifi();
  if (!hasWifi)
  {
    return;
  }

  Screen.print(3, " > Sensors");
  sensorInit();

  Screen.print(3, " > IoT Hub");
  DevKitMQTTClient_Init(true);
  DevKitMQTTClient_SetOption(OPTION_MINI_SOLUTION_NAME, "mlIoTPlatformDevice");
  DevKitMQTTClient_SetSendConfirmationCallback(sendConfirmationCallback);
  DevKitMQTTClient_SetMessageCallback(messageCallback);
  DevKitMQTTClient_SetDeviceTwinCallback(deviceTwinCallback);
  DevKitMQTTClient_SetDeviceMethodCallback(deviceMethodCallback);

  appstate = APPSTATE_Init;

  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);

  int filter_size = mfcc_GetInputSize(0);
  if (filter_size != FEATURIZER_INPUT_SIZE)
  {
    Serial.printf("Featurizer input size %d is not equal to %d\n", filter_size, FEATURIZER_INPUT_SIZE);
    show_error("Featurizer Error");
  }

  if (appstate != APPSTATE_Error)
  {
    ::memset(featurizer_input_buffers[0], 0, FEATURIZER_INPUT_SIZE);

    // give it a whirl !!
    mfcc_Filter(nullptr, featurizer_input_buffers[0], featurizer_output_buffer);

    // check audio gain and print the result.
    uint32_t id = Audio.readRegister(nau88c10_CHIPID_ADDR);
    if (id == NAU88C10_ID)
    {
      Serial.printf("Found audio device: NAU88C10\r\n");
    }
    else
    {
      Serial.printf("Found audio device: 0x%x\r\n", id);
    }

    // a default gain level of 4 seems to work pretty well.
    start_recording();

    Screen.clean();

    Screen.print(0, "Listening...");
    Screen.print(1, "A = min gain");
    Screen.print(2, "B = max gain");

    minGain = 0;
    maxGain = 7;

    set_gain();
    display_gain();
  }

  send_interval_ms = SystemTickCounterRead();
}

void loop()
{
  if (hasWifi)
  {
    if (messageSending && (int)(SystemTickCounterRead() - send_interval_ms) >= getInterval())
    {
      if (appstate != APPSTATE_Error)
      {
        if (dropped_frames > 0)
        {
          Serial.printf("%d dropped frames\n", dropped_frames);
          dropped_frames = 0;
        }
        // process all the buffered input frames
        featurizer_input_buffer_read = next(featurizer_input_buffer_read);
        decibels = get_prediction(featurizer_input_buffers[featurizer_input_buffer_read]);
      }

      // Send data
      char messagePayload[MESSAGE_MAX_LEN];
      float *newValues;

      newValues = setMessage(messageCount++, messagePayload, decibels);

      if (!messageReceived)
      {
        // Update display
        char buff[128];
        sprintf(buff, "ID: %s \r\n Temp:%s°C    \r\n Humidity:%s%% \r\n Pres:%smb         \r\n", device_id, f2s(*(newValues), 1), f2s(*(newValues + 1), 1), f2s(*(newValues + 2), 1));
        Screen.print(buff);
      }

      EVENT_INSTANCE *message = DevKitMQTTClient_Event_Generate(messagePayload, MESSAGE);
      DevKitMQTTClient_SendEventInstance(message);
      send_interval_ms = SystemTickCounterRead();
    }
    else
    {
      DevKitMQTTClient_Check();
    }
  }

  delay(10);
}
//Main functions - End//
//***********************************************************************************************************************************//

//Decibels/microphone reading functions - Start//

int next(int pos)
{
  pos++;
  if (pos == MAX_FEATURE_BUFFERS)
  {
    pos = 0;
  }
  return pos;
}
void display_gain()
{
  char buffer[20];
  Screen.clean();
  if (maxGain == 0)
  {
    Screen.print(2, "Gain = off");
  }
  else
  {
    sprintf(buffer, "Min Gain=%d", (int)minGain);
    Screen.print(2, buffer);
    sprintf(buffer, "Max Gain=%d", (int)maxGain);
    Screen.print(3, buffer);
  }
}

void set_gain()
{
  if (maxGain < minGain)
  {
    maxGain = minGain;
  }

  if (maxGain == 0)
  {
    Audio.disableLevelControl();
  }
  else
  {
    Serial.printf("Enabling ALC max gain %d and min gain %d\r\n", maxGain, minGain);
    Audio.enableLevelControl(maxGain, minGain);
    delay(100);
    int value = Audio.readRegister(0x20);
    Serial.printf("Register %x = %x\r\n", 0x20, value);
  }
}

void show_error(const char *msg)
{
  Screen.clean();
  Screen.print(0, msg);
  appstate = APPSTATE_Error;
}

int get_prediction(float *featurizer_input_buffer)
{
  // mfcc transform
  mfcc_Filter(nullptr, featurizer_input_buffer, featurizer_output_buffer);

  // calculate a sort of energy level from the mfcc output
  float level = 0;
  for (int i = 0; i < FEATURIZER_OUTPUT_SIZE; i++)
  {
    float x = featurizer_output_buffer[i];
    level += (x * x);
  }

  if (level > max_level)
  {
    max_level = level;
  }

  if (level > 10)
  {
    rgbLed.setColor(255, 0, 0);
  }
  else
  {
    rgbLed.setColor(0, 255, 0);
  }

  char buffer[20];
  Screen.print(0, "Current Level:");
  sprintf(buffer, "%d (Max: %d)", (int)level, (int)max_level);
  Screen.print(1, buffer);

  return (int)level;
}

void audio_callback()
{
  // this is called when Audio class has a buffer full of audio, the buffer is size AUDIO_CHUNK_SIZE (512)
  Audio.readFromRecordBuffer(raw_audio_buffer, AUDIO_CHUNK_SIZE);
  raw_audio_count++;

  char *curReader = &raw_audio_buffer[0];
  char *endReader = &raw_audio_buffer[AUDIO_CHUNK_SIZE];
  while (curReader < endReader)
  {
    if (SAMPLE_BIT_DEPTH == 16)
    {
      // We are getting 512 samples, but with dual channel 16 bit audio this means we are
      // getting 512/4=128 readings after converting to mono channel floating point values.
      // Our featurizer expects 256 readings, so it will take 2 callbacks to fill the featurizer
      // input buffer.
      int bytesPerSample = 2;

      // convert to mono
      int16_t sample = *((int16_t *)curReader);
      curReader += bytesPerSample * 2; // skip right channel (not the best but it works for now)

      scaled_input_buffer[scaled_input_buffer_pos] = (float)sample / 32768.0f;
      scaled_input_buffer_pos++;

      if (scaled_input_buffer_pos == FEATURIZER_INPUT_SIZE)
      {
        scaled_input_buffer_pos = 0;
        if (next(featurizer_input_buffer_write) == featurizer_input_buffer_read)
        {
          dropped_frames++; // dropping frame on the floor since classifier is still processing this buffer
        }
        else
        {
          memcpy(featurizer_input_buffers[featurizer_input_buffer_write], scaled_input_buffer, FEATURIZER_INPUT_SIZE * sizeof(float));
          featurizer_input_buffer_write = next(featurizer_input_buffer_write);
        }
      }
    }
  }
}

void start_recording()
{
  appstate = APPSTATE_Recording;

  // Re-config the audio data format
  Audio.format(SAMPLE_RATE, SAMPLE_BIT_DEPTH);
  delay(100);

  Serial.println("listening...");

  // Start to record audio data
  Audio.startRecord(audio_callback);
}
//Decibels/microphone reading functions - End//
//*********************************************************************************************************************************//