// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. 

#include "AzureIotHub.h"

#ifndef UTILITY_H
#define UTILITY_H

void parseTwinMessage(DEVICE_TWIN_UPDATE_STATE, const char *);
float * setMessage(int, char *, int);
void sensorInit(void);
void blinkLED(void);
void blinkSendConfirmation(void);
int getInterval(void);

#endif /* UTILITY_H */