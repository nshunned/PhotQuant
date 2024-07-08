/**
 * $Id: $
 *
 * @brief Red Pitaya Scpi server SCPI commands implementation
 *
 * @Author Red Pitaya
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "common.h"
#include "led.h"
#include "scpi/parser.h"
#include "rp_hw.h"

const scpi_choice_def_t scpi_LED_state[] = {
    {"OFF", 0},
    {"ON", 1},
    SCPI_CHOICE_LIST_END
};

scpi_result_t RP_LED_MMC(scpi_t *context) {
    int32_t value;

    if (!SCPI_ParamChoice(context, scpi_LED_state, &value, true)) {
        SCPI_LOG_ERR(SCPI_ERROR_MISSING_PARAMETER,"Missing first parameter.");
        return SCPI_RES_ERR;
    }

    auto result = rp_SetLEDMMCState((bool)value);
    if (RP_HW_OK != result) {
        RP_LOG_ERR("Failed to set MMC led: %s", rp_HwGetError(result));
        return SCPI_RES_ERR;
    }
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}

scpi_result_t RP_LED_MMCQ(scpi_t *context) {
    const char *_name;

    bool value;
    auto result = rp_GetLEDMMCState(&value);

    if (RP_OK != result) {
        RP_LOG_ERR("Failed get LED state: %d", result);
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_LED_state, (int32_t)value, &_name)){
        SCPI_LOG_ERR(SCPI_ERROR_EXECUTION_ERROR,"Failed to parse LED state.")
        return SCPI_RES_ERR;
    }

    // Return back result
    SCPI_ResultMnemonic(context, _name);
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}

scpi_result_t RP_LED_HB(scpi_t *context) {
    int32_t value;

    if (!SCPI_ParamChoice(context, scpi_LED_state, &value, true)) {
        SCPI_LOG_ERR(SCPI_ERROR_MISSING_PARAMETER,"Missing first parameter.");
        return SCPI_RES_ERR;
    }

    auto result = rp_SetLEDHeartBeatState((bool)value);
    if (RP_HW_OK != result) {
        RP_LOG_ERR("Failed to set HB led: %s", rp_HwGetError(result));
        return SCPI_RES_ERR;
    }
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}

scpi_result_t RP_LED_HBQ(scpi_t *context) {
    const char *_name;

    bool value;
    auto result = rp_GetLEDHeartBeatState(&value);

    if (RP_OK != result) {
        RP_LOG_ERR("Failed get LED state: %s", rp_HwGetError(result));
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_LED_state, (int32_t)value, &_name)){
        SCPI_LOG_ERR(SCPI_ERROR_EXECUTION_ERROR,"Failed to parse LED state.")
        return SCPI_RES_ERR;
    }

    // Return back result
    SCPI_ResultMnemonic(context, _name);
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}

scpi_result_t RP_LED_ETH(scpi_t *context) {
    int32_t value;

    if (!SCPI_ParamChoice(context, scpi_LED_state, &value, true)) {
        SCPI_LOG_ERR(SCPI_ERROR_MISSING_PARAMETER,"Missing first parameter.");
        return SCPI_RES_ERR;
    }

    auto result = rp_SetLEDEthState((bool)value);
    if (RP_HW_OK != result) {
        RP_LOG_ERR("Failed to set ETH led: %s", rp_HwGetError(result));
        return SCPI_RES_ERR;
    }
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}

scpi_result_t RP_LED_ETHQ(scpi_t *context) {
    const char *_name;

    bool value;
    auto result = rp_GetLEDEthState(&value);

    if (RP_OK != result) {
        RP_LOG_ERR("Failed get LED state: %s", rp_HwGetError(result));
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_LED_state, (int32_t)value, &_name)){
        SCPI_LOG_ERR(SCPI_ERROR_EXECUTION_ERROR,"Failed to parse LED state.")
        return SCPI_RES_ERR;
    }

    // Return back result
    SCPI_ResultMnemonic(context, _name);
    RP_LOG_INFO("%s",rp_HwGetError(result))
    return SCPI_RES_OK;
}
