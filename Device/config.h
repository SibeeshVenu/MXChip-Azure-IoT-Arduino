// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. 

// Interval time(ms) for sending message to IoT Hub
#define INTERVAL 5000

#define MESSAGE_MAX_LEN 256

#define TEMPERATURE_ALERT 30

#define DIRECT_METHOD_NAME "message"

// How many messages get sent to the hub before user has to press A to continue
#define MESSAGE_SEND_COUNT_LIMIT 350