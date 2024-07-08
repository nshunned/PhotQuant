/**
 * $Id: $
 *
 * @brief Red Pitaya Applications library common module interface
 *
 * @Author Red Pitaya
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#ifndef COMMON_APP_H_
#define COMMON_APP_H_

/* @brief ADC buffer size is 16 k samples. */
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string>
#include <cstring>

#include "rpApp.h"
#include "rp_hw-calib.h"

#define MILLI_TO_NANO               1000000.0

#define MAX_ADC_CHANNELS 4
#define MAX_DAC_CHANNELS 2

#define __SHORT_FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)

#define FATAL(X)  {fprintf(stderr, "Error at line %d, file %s errno %d [%s] %s\n", __LINE__, __SHORT_FILENAME__, errno, strerror(errno),X); exit(1);}
#define WARNING(...) { char error_msg[512]; snprintf(error_msg,512,__VA_ARGS__);fprintf(stderr,"[W] %s:%d %s\n",__SHORT_FILENAME__,__LINE__,error_msg);}

#ifdef TRACE_ENABLE
#define TRACE(...) { char error_msg[512]; snprintf(error_msg,512,__VA_ARGS__);fprintf(stderr,"[T] %s:%d %s\n",__SHORT_FILENAME__,__LINE__,error_msg);}
#define TRACE_SHORT(...) { char error_msg[512]; snprintf(error_msg,512,__VA_ARGS__);fprintf(stderr,"[T] %s\n",error_msg);}
#else
#define TRACE(...)
#define TRACE_SHORT(...)
#endif

#define ECHECK_APP(x) { \
    int retval = (x); \
    if (retval != RP_OK) { \
        WARNING("Runtime error: %s returned \"%s\"", #x, rpApp_GetError(retval)); \
        return retval; \
    } \
}


#define ECHECK_APP_NO_RET(x) { \
    int retval = (x); \
    if (retval != RP_OK) { \
        WARNING("Runtime error: %s returned \"%s\"", #x, rpApp_GetError(retval)); \
    } \
}

#define CHANNEL_ACTION(CHANNEL, CHANNEL_1_ACTION, CHANNEL_2_ACTION) \
if ((CHANNEL) == RP_CH_1) { \
    CHANNEL_1_ACTION; \
} \
else if ((CHANNEL) == RP_CH_2) { \
    CHANNEL_2_ACTION; \
} \
else { \
    return RP_EPN; \
}

#define CHANNEL_ACTION_4CH(CHANNEL, CHANNEL_1_ACTION, CHANNEL_2_ACTION, CHANNEL_3_ACTION, CHANNEL_4_ACTION) \
if ((CHANNEL) == RP_CH_1) { \
    CHANNEL_1_ACTION; \
} \
else if ((CHANNEL) == RP_CH_2) { \
    CHANNEL_2_ACTION; \
} \
else if ((CHANNEL) == RP_CH_3) { \
    CHANNEL_3_ACTION; \
} \
else if ((CHANNEL) == RP_CH_4) { \
    CHANNEL_4_ACTION; \
} \
else { \
    return RP_EPN; \
}

#define SOURCE_ACTION(SOURCE, SOURCE_1_ACTION, SOURCE_2_ACTION, SOURCE_3_ACTION) \
switch ((SOURCE)) { \
    case RPAPP_OSC_SOUR_CH1: \
        (SOURCE_1_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_CH2: \
        (SOURCE_2_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_MATH: \
        (SOURCE_3_ACTION); \
        break; \
    default: \
        return RP_EPN; \
        break; \
}

#define SOURCE_ACTION_4CH(SOURCE, SOURCE_1_ACTION, SOURCE_2_ACTION, SOURCE_3_ACTION,SOURCE_4_ACTION,SOURCE_5_ACTION) \
switch ((SOURCE)) { \
    case RPAPP_OSC_SOUR_CH1: \
        (SOURCE_1_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_CH2: \
        (SOURCE_2_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_CH3: \
        (SOURCE_3_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_CH4: \
        (SOURCE_4_ACTION); \
        break; \
    case RPAPP_OSC_SOUR_MATH: \
        (SOURCE_5_ACTION); \
        break; \
    default: \
        return RP_EPN; \
        break; \
}


#define CHECK_CHANNEL() \
    uint8_t channels_rp_HPGetFastADCChannelsCount = 0; \
    if (rp_HPGetFastADCChannelsCount(&channels_rp_HPGetFastADCChannelsCount) != RP_HP_OK){ \
        WARNING("Can't get fast ADC channels count"); \
        return RP_NOTS; \
    } \
    if (channel >= channels_rp_HPGetFastADCChannelsCount){ \
        WARNING("Channel is larger than allowed"); \
        return RP_NOTS; \
    }

#define EXECUTE_ATOMICALLY(MUTEX, ACTION) \
    (MUTEX).lock();\
    (ACTION); \
    (MUTEX).unlock();

#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))

int cmn_Init();
int cmn_Release();

int intCmp(const void *a, const void *b);

auto indexToTime(int64_t index) -> float;

auto timeToIndexD(float time) -> double;
auto timeToIndexI(float time) -> int64_t;

auto osc_adc_sign(uint32_t cnts, uint8_t bits) -> int32_t;

auto getADCChannels() -> uint8_t;
auto getDACChannels() -> uint8_t;
auto getDACRate() -> uint32_t;
auto getADCRate() -> uint32_t;
auto getModel() -> rp_HPeModels_t;
auto getDACDevider() -> double;
auto getModelName() -> std::string;

auto convertToVoltSigned(uint32_t cnts, uint8_t bits, float fullScale, uint32_t gain, uint32_t base, int32_t offset) -> float;
auto calibCntsSigned(uint32_t cnts, uint8_t bits, uint32_t gain, uint32_t base, int32_t offset) -> int32_t;
auto getADCSamplePeriod(double *value) -> int;

auto convertCh(rp_channel_t ch) -> rp_channel_calib_t;
auto convertChFromIndex(uint8_t index) -> rp_channel_t;
auto convertPower(rp_acq_ac_dc_mode_t ch) -> rp_acq_ac_dc_mode_calib_t;
auto convertCh(rpApp_osc_trig_source_t ts) -> int;

#endif /* COMMON_APP_H_ */
