/**
 * $Id: $
 *
 * @brief Red Pitaya Scpi server SeqPID SCPI commands implementation
 *
 * @Author Alexei
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "seqpid.h"
#include "../../apiseq/src/seqpid.h"

#include "common.h"
#include "scpi/parser.h"
#include "scpi/units.h"

////////////////////////////////////////////////////////////////////////////////:

/* These structures are a direct API mirror 
and should not be altered! */
const scpi_choice_def_t scpi_RpSeqFreqLimD[] = {
    {"LIM5M",		0},
    {"LIM2M5",		1},
    {"LIM1M2",		2},
    {"LIM620k",		3},
    {"LIM310k",		4},
    {"LIM160k",		5},
    {"LIM78k",		6},
    {"LIM39k",		7},
    SCPI_CHOICE_LIST_END
};

const scpi_choice_def_t scpi_RpSeqAction[] = {
    {"IDLE",	0},
    {"INIT",    1},
    {"STOP",	2},
    {"RUN",		3},
    SCPI_CHOICE_LIST_END
};

const scpi_choice_def_t scpi_RpSeqEnforceMode[] = {
    {"VoltTime",    0},
    {"TimeSlope",	1},
    {"VoltSlope",	2},
    SCPI_CHOICE_LIST_END
};


scpi_result_t RP_SeqReset(scpi_t *context) {
	
	rp_channel_t channel;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqReset(channel);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:RST Failed to reset Red "
            "Pitaya SeqPID: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:RST Successfully reset Red "
        "Pitaya SeqPID channel.\n");
    return SCPI_RES_OK;
}

//Instrument-level commands

scpi_result_t RP_SeqAction(scpi_t *context) {
        
    int32_t actionChoice;
    int result;


    if(!SCPI_ParamChoice(context, scpi_RpSeqAction, &actionChoice, true)){
        RP_LOG(LOG_ERR, "*SEQ:GEN:ACTION Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetAction((rp_seq_action_t)actionChoice);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:GEN:ACTION Failed to set generator action: %s\n", rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:GEN:ACTION Successfully set generator action.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqActionQ(scpi_t *context) {
    
    const char *actionChoice;

    rp_seq_action_t action;
    if (rp_seqGetAction(&action) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_RpSeqAction, (int32_t)action, &actionChoice)){
        RP_LOG(LOG_ERR, "*SEQ:GEN:ACTION? Failed to parse action.\n");
        return SCPI_RES_ERR;
    }

    SCPI_ResultMnemonic(context, actionChoice);

    RP_LOG(LOG_INFO, "*SEQ:GEN:ACTION? Successfully returned generator"
    " action to client.\n");

    return SCPI_RES_OK;
}


scpi_result_t RP_SeqActionIdle(scpi_t *context) {
    
    int result;

    result = rp_seqSetActionIdle();
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:GEN:IDLE Failed to idle generator"
            "to idle: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:GEN:IDLE Successfully set generator action to idle.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqActionInit(scpi_t *context) {
    
    int result;

    result = rp_seqSetActionInit();
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:GEN:INIT Failed to trigger sequence "
            "initialization: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:GEN:INIT Successfully triggered sequence initialization.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqActionStop(scpi_t *context) {
    
    int result;

    result = rp_seqSetActionStop();
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:GEN:STOP Failed to interrupt sequence: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:GEN:STOP Successfully interrupted sequence.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqActionRun(scpi_t *context) {
    
    int result;

    result = rp_seqSetActionRun();
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:GEN:RUN Failed to trigger sequence "
            "start: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:GEN:RUN Successfully triggered sequence start.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqTrigOutEnab(scpi_t *context) {
    
    int result;
    bool enabled;

    /* Parse first, STATE argument */
    if(!SCPI_ParamBool(context, &enabled, true)){
        RP_LOG(LOG_ERR, "*SEQ:TRIGOUT:ENABLE Missing first parameter.\n");
        return SCPI_RES_ERR;
    }
	result = rp_seqSetTrigOutEnab(enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:TRIGOUT:ENABLE Failed to enable/disable trigger output: %s\n", 
            rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:TRIGOUT:ENABLE Successfully enabled/disabled trigger output.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqTrigOutEnabQ(scpi_t *context){

    bool enabled;
    int result;

    result = rp_seqGetTrigOutEnab(&enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:TRIGOUT:ENABLE? Failed to get output trigger state"
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, enabled);

    RP_LOG(LOG_INFO, "*SEQ:TRIGOUT:ENABLE? Successfully returned output trigger state.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqClkOutEnab(scpi_t *context) {
    
    int result;
    bool enabled;

    /* Parse first, STATE argument */
    if(!SCPI_ParamBool(context, &enabled, true)){
        RP_LOG(LOG_ERR, "*SEQ:CLKOUT:ENABLE Missing first parameter.\n");
        return SCPI_RES_ERR;
    }
	result = rp_seqSetClkOutEnab(enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:CLKOUT:ENABLE Failed to enable/disable clock output: %s\n", 
            rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ:CLKOUT:ENABLE Successfully enabled/disabled clock output.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqClkOutEnabQ(scpi_t *context){

    bool enabled;
    int result;

    result = rp_seqGetClkOutEnab(&enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:CLKOUT:ENABLE? Failed to get output clock state"
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, enabled);

    RP_LOG(LOG_INFO, "*SEQ:CLKOUT:ENABLE? Successfully returned output clock state.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqClkExtUseQ(scpi_t *context){

    bool clkExtUse;
    int result;

    result = rp_seqGetClkExtUse(&clkExtUse);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ:EXTCLK? Failed to get external clock state "
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, clkExtUse);

    RP_LOG(LOG_INFO, "*SEQ:EXTCLK? Successfully returned external clock state.\n");
    return SCPI_RES_OK;
}


//Channel-level commands

scpi_result_t RP_SeqRangesQ(scpi_t *context){

    rp_channel_t channel;
    float minIn, maxIn, minOut, maxOut, clkFreq;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetRanges(channel, &minIn, &maxIn, &minOut, &maxOut, &clkFreq);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:RANGES? Failed to get ranges: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    float buffer[5]={minIn, maxIn, minOut, maxOut, clkFreq};
    SCPI_ResultBufferFloat(context, buffer, 5);

    RP_LOG(LOG_INFO, "*SEQ#:RANGES? Successfully returned ranges to client.\n");
    return SCPI_RES_OK;
}


scpi_result_t RP_SeqInRangeLow(scpi_t *context) {
    
    int result;
    bool value;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    /* Parse first, STATE argument */
    if(!SCPI_ParamBool(context, &value, true)){
        RP_LOG(LOG_ERR, "*SEQ#:IN:RANGELOW Missing first parameter.\n");
        return SCPI_RES_ERR;
    }
	result = rp_seqSetInputRangeLow(channel,value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:IN:RANGELOW Failed to set input range to low/high: %s\n", 
            rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:IN:RANGELOW Successfully set input range.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqInRangeLowQ(scpi_t *context){

    bool value;
    int result;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetInputRangeLow(channel, &value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:IN:RANGELOW? Failed to get input low/high range"
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, value);

    RP_LOG(LOG_INFO, "*SEQ#:IN:RANGELOW? Successfully input low/high range.\n");
    return SCPI_RES_OK;
}

///////////

scpi_result_t RP_SeqPIDEnable(scpi_t *context) {
    
    int result;
    bool enabled;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    /* Parse first, STATE argument */
    if(!SCPI_ParamBool(context, &enabled, true)){
        RP_LOG(LOG_ERR, "*SEQ#:PID:ENABLE Missing first parameter.\n");
        return SCPI_RES_ERR;
    }
	result = rp_seqSetPIDEnabled(channel,enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:ENABLE Failed to enable/disable PID: %s\n", 
            rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:ENABLE Successfully enabled/disabled PID.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDEnableQ(scpi_t *context){

    bool enabled;
    int result;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDEnabled(channel, &enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:ENABLE? Failed to get PID on/off "
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, enabled);

    RP_LOG(LOG_INFO, "*SEQ#:PID:ENABLE? Successfully returned PID on/off state.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqTrigEnable(scpi_t *context) {
    
    int result;
    bool enabled;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    /* Parse first, STATE argument */
    if(!SCPI_ParamBool(context, &enabled, true)){
        RP_LOG(LOG_ERR, "*SEQ#:TRIG:ENABLE Missing first parameter.\n");
        return SCPI_RES_ERR;
    }
	result = rp_seqSetTrigEnabled(channel, enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:TRIG:ENABLE Failed to enable/disable sequence generator trigger: %s\n", 
            rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:TRIG:ENABLE Successfully enabled/disabled sequence generator trigger.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqTrigEnableQ(scpi_t *context){

    bool enabled;
    int result;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetTrigEnabled(channel, &enabled);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:TRIG:ENABLE? Failed to get sequence generator trigger enabled state"
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, enabled);

    RP_LOG(LOG_INFO, "*SEQ#:TRIG:ENABLE? Successfully returned sequence generator trigger enabled state.\n");
    return SCPI_RES_OK;
}


scpi_result_t RP_SeqPIDGainP(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &gain, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINP Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDGainP(channel, gain.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINP Failed to set gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAINP Successfully set gain.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDGainPQ(scpi_t *context) {
   
    rp_channel_t channel;
    float gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDGainP(channel, &gain);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINP? Failed to get gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, gain);

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAINP? Successfully returned gain value to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDGainI(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &gain, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINI Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDGainI(channel, gain.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINI Failed to set gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAINI Successfully set gain.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDGainIQ(scpi_t *context) {
   
    rp_channel_t channel;
    float gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDGainI(channel, &gain);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINI? Failed to get gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, gain);

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAINI? Successfully returned gain value to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDGainD(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &gain, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAINP Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDGainD(channel, gain.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAIND Failed to set gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAIND Successfully set gain.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDGainDQ(scpi_t *context) {
   
    rp_channel_t channel;
    float gain;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDGainD(channel, &gain);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:GAIND? Failed to get gain: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, gain);

    RP_LOG(LOG_INFO, "*SEQ#:PID:GAIND? Successfully returned gain value to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDFreqD(scpi_t *context) {
        
    rp_channel_t channel;
    int32_t freqLimChoice;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ParamChoice(context, scpi_RpSeqFreqLimD, &freqLimChoice, true)){
        RP_LOG(LOG_ERR, "*SEQ#:PID:FREQD Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDFreqLimD(channel, (rp_seq_difffreqlim_t)freqLimChoice);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:FREQD Failed to set differentiator"
        " frequency cutoff: %s\n", rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:FREQD Successfully set differentiator frequency cutoff.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDFreqDQ(scpi_t *context) {
    
    rp_channel_t channel;
    const char *freqLimChoice;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    rp_seq_difffreqlim_t freqLim;
    if (rp_seqGetPIDFreqLimD(channel, &freqLim) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_RpSeqFreqLimD, (int32_t)freqLim, &freqLimChoice)){
        RP_LOG(LOG_ERR, "*SEQ#:PID:FREQD? Failed to parse differentiator frequency cutoff.\n");
        return SCPI_RES_ERR;
    }

    SCPI_ResultMnemonic(context, freqLimChoice);

    RP_LOG(LOG_INFO, "*SEQ#:PID:FREQD? Successfully returned"
    " differentiator frequency cutoff to client.\n");

    return SCPI_RES_OK;
}


scpi_result_t RP_SeqPIDMin(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t pidlim;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &pidlim, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:PID:MIN Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDMin(channel, pidlim.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:MIN Failed to set PID output min: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:MIN Successfully set PID output min.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDMinQ(scpi_t *context) {
   
    rp_channel_t channel;
    float pidlim;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDMin(channel, &pidlim);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:MIN? Failed to get PID output min: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, pidlim);

    RP_LOG(LOG_INFO, "*SEQ#:PID:MIN? Successfully returned PID output min to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDMax(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t pidlim;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &pidlim, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:PID:MAX Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetPIDMax(channel, pidlim.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:MAX Failed to set PID output max: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:PID:MAX Successfully set PID output max.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqPIDMaxQ(scpi_t *context) {
   
    rp_channel_t channel;
    float pidlim;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetPIDMax(channel, &pidlim);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:PID:MAX? Failed to get PID output max: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, pidlim);

    RP_LOG(LOG_INFO, "*SEQ#:PID:MAX? Successfully returned PID output max to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqSyncDelay(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t delay;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &delay, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:GEN:DELAY Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetSyncDelay(channel, delay.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:DELAY Failed to set sync delay: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:DELAY Successfully set sync delay.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqSyncDelayQ(scpi_t *context) {
   
    rp_channel_t channel;
    double delay;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetSyncDelay(channel, &delay);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:DELAY? Failed to get sync delay: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, delay);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:DELAY? Successfully returned sync delay to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqGenOverwriteValue(scpi_t *context) {
    
    rp_channel_t channel;
    scpi_number_t genVolt;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if (!SCPI_ParamNumber(context, scpi_special_numbers_def, &genVolt, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:GEN:OVRWR Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetGenOverwriteValue(channel, genVolt.value);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:OVRWR Failed to set generator overwrite voltage: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:OVRWR Successfully set generator overwrite voltage.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqGenOverwriteValueQ(scpi_t *context) {
   
    rp_channel_t channel;
    float genVolt;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetGenOverwriteValue(channel, &genVolt);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:OVRWR? Failed to get generator overwrite voltage: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, genVolt);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:OVRWR? Successfully returned generator overwrite voltage client.\n");
    return SCPI_RES_OK;
}
scpi_result_t RP_SeqInputValueQ(scpi_t *context) {
   
    rp_channel_t channel;
    float genVolt;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetInputValue(channel, &genVolt);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:IN:VOLT? Failed to get input voltage: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, genVolt);

    RP_LOG(LOG_INFO, "*SEQ#:IN:VOLT? Successfully returned input voltage client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqGenOutputValueQ(scpi_t *context) {
   
    rp_channel_t channel;
    float genVolt;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetGenOutputValue(channel, &genVolt);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:VOLT? Failed to get generator output voltage: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultDouble(context, genVolt);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:VOLT? Successfully returned generator output voltage client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqGenRunningQ(scpi_t *context){

    bool running;
    int result;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqGetRunning(channel, &running);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:RUNNING? Failed to get generator running state "
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBool(context, running);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:RUNNING? Successfully returned generator running state.\n");
    return SCPI_RES_OK;
}
scpi_result_t RP_SeqGenRunGuessQ(scpi_t *context){

    bool running;
    int result;
    rp_channel_t channel;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

//    result = rp_seqGetRunning(channel, &running);
    result = rp_seqGetPIDEnabled(channel, &running);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:RUNGUESS? Failed to get generator running state "
            "state: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:RUNGUESS? Successfully returned generator running state.\n");
    return running ? SCPI_RES_ERR : SCPI_RES_OK;
}

scpi_result_t RP_SeqStepsBySlice(scpi_t *context) {
    
    rp_channel_t channel;
    uint32_t buffer[STEP_MAX_NUM*PARAM_PER_STEP];
    uint32_t size;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ParamBufferSignUInt32(context, buffer, &size, PARAM_PER_STEP, false)){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYSLICE Failed to parse data.\n");
        return SCPI_RES_ERR;
    }
	
	uint32_t numSteps = size / PARAM_PER_STEP;
	uint16_t indexSlice0[numSteps];
	uint32_t countBurst[numSteps];
	rp_seq_pidmutemode_t muteMode[numSteps];
	for(uint32_t i=0; i<numSteps; i++){
		indexSlice0[i]	= (uint16_t)buffer[i*PARAM_PER_STEP];
		countBurst[i]	= buffer[i*PARAM_PER_STEP +1];
		muteMode[i]		= (rp_seq_pidmutemode_t)buffer[i*PARAM_PER_STEP +2];
	}
	
	result = rp_seqWriteStepsBySlice(channel, numSteps, countBurst, indexSlice0, muteMode);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYSLICE Failed to write data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:STEP:BYSLICE Successfully wrote step data.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqStepsBySliceQ(scpi_t *context) {
    
    rp_channel_t channel;

	uint16_t indexSlice0[STEP_MAX_NUM];
	uint32_t countBurst[STEP_MAX_NUM];
	rp_seq_pidmutemode_t muteMode[STEP_MAX_NUM];
    uint16_t numSteps;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqReadStepsBySlice(channel, &numSteps, countBurst, indexSlice0, muteMode);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYSLICE? Failed to "
            "get step data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }
	
    uint32_t buffer[numSteps*PARAM_PER_STEP];
	for(uint16_t i=0; i<numSteps; i++){
		buffer[i*PARAM_PER_STEP] = indexSlice0[i];
		buffer[i*PARAM_PER_STEP +1] = (uint32_t)countBurst[i];
		buffer[i*PARAM_PER_STEP +2] = (uint32_t)muteMode[i];
	}
	
    SCPI_ResultBufferUInt32(context, buffer, numSteps*PARAM_PER_STEP);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:STEP:BYSLICE? Successfully "
        "returned step data to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqStepsByIndex(scpi_t *context) {
    
    rp_channel_t channel;
    uint32_t buffer[STEP_MAX_NUM*PARAM_PER_STEP];
    uint32_t size;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ParamBufferSignUInt32(context, buffer, &size, PARAM_PER_STEP, false)){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYINDEX Failed to parse data.\n");
        return SCPI_RES_ERR;
    }
	
	uint32_t numSteps = size / PARAM_PER_STEP;
	uint16_t indexStep[numSteps];
	uint32_t countBurst[numSteps];
	rp_seq_pidmutemode_t muteMode[numSteps];
	for(uint32_t i=0; i<numSteps; i++){
		indexStep[i]	= buffer[i*PARAM_PER_STEP];
		countBurst[i]	= (uint16_t)buffer[i*PARAM_PER_STEP +1];
		muteMode[i]		= (rp_seq_pidmutemode_t)buffer[i*PARAM_PER_STEP +2];
	}
	
	result = rp_seqWriteStepsByIndex(channel, numSteps, countBurst, indexStep, muteMode);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYINDEX Failed to write data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:STEP:BYINDEX Successfully wrote step data.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqStepsByIndexQ(scpi_t *context) {
    
    rp_channel_t channel;

	uint16_t indexStep[STEP_MAX_NUM];
	uint32_t countBurst[STEP_MAX_NUM];
	rp_seq_pidmutemode_t muteMode[STEP_MAX_NUM];
    uint16_t numSteps;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqReadStepsByIndex(channel, &numSteps, countBurst, indexStep, muteMode);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:STEP:BYINDEX? Failed to "
            "get step data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }
	
    uint32_t buffer[numSteps*PARAM_PER_STEP];
	for(uint16_t i=0; i<numSteps; i++){
		buffer[i*PARAM_PER_STEP] = (uint32_t)indexStep[i];
		buffer[i*PARAM_PER_STEP +1] = countBurst[i];
		buffer[i*PARAM_PER_STEP +2] = (uint32_t)muteMode[i];
	}
	
    SCPI_ResultBufferUInt32(context, buffer, numSteps*PARAM_PER_STEP);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:STEP:BYINDEX? Successfully "
        "returned step data to client.\n");
    return SCPI_RES_OK;
}


scpi_result_t RP_SeqElements(scpi_t *context) {
    
    rp_channel_t channel;
    double buffer[1+SLICE_MAX_NUM*PARAM_PER_SLICE]; //first element is muteMode, common to all slices
    uint32_t size;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ParamBufferDouble(context, buffer, &size, PARAM_PER_SLICE)){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM Failed to parse data.\n");
        return SCPI_RES_ERR;
    }
	
	uint16_t numSlices = size / PARAM_PER_SLICE;
	float Vstart[numSlices];
	float Vstop[numSlices];
	double duration[numSlices];
	bool pidfreeze[numSlices];
	rp_seq_pidmutemode_t muteMode = (rp_seq_pidmutemode_t)buffer[0];
	for(uint32_t i=0; i<numSlices; i++){
		Vstart[i] = (float)buffer[i*PARAM_PER_SLICE+1];
		Vstop[i] = (float)buffer[i*PARAM_PER_SLICE +2];
		duration[i] = buffer[i*PARAM_PER_SLICE +3];
		pidfreeze[i] = (bool)buffer[i*PARAM_PER_SLICE +4];
	}
	result = rp_seqWriteElement(channel, muteMode, numSlices, Vstart, Vstop, duration, pidfreeze);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM Failed to write data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:ELEM Successfully wrote element data.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqElementsBySliceQ(scpi_t *context) {
    
    rp_channel_t channel;

	uint32_t indexSlice0;
	float Vstart[SLICE_MAX_NUM];
	float Vstop[SLICE_MAX_NUM];
	double duration[SLICE_MAX_NUM];
	bool pidfreeze[SLICE_MAX_NUM];
    uint16_t numSlices;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }
		
	if (!SCPI_ParamUInt32(context, &indexSlice0, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM:BYSLICE? Failed to parse index of desired element's first slice.\n");
        return SCPI_RES_ERR;
    }
	
    result = rp_seqReadElementBySlice(channel, (uint16_t)indexSlice0, &numSlices, Vstart, Vstop, duration, pidfreeze);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM:BYSLICE? Failed to "
            "get element data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }
	
    double buffer[numSlices*PARAM_PER_SLICE];
	for(uint16_t i=0; i<numSlices; i++){
		buffer[i*PARAM_PER_SLICE] = (double)Vstart[i];
		buffer[i*PARAM_PER_SLICE +1] = (double)Vstop[i];
		buffer[i*PARAM_PER_SLICE +2] = duration[i];
		buffer[i*PARAM_PER_SLICE +3] = (double)pidfreeze[i];
	}
	
    SCPI_ResultBufferDouble(context, buffer, numSlices*PARAM_PER_SLICE);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:ELEM:BYSLICE? Successfully "
        "returned element data to client.\n");
    return SCPI_RES_OK;
}


scpi_result_t RP_SeqElementsByIndexQ(scpi_t *context) {
    
    rp_channel_t channel;

	uint32_t indexElement;
	float Vstart[SLICE_MAX_NUM];
	float Vstop[SLICE_MAX_NUM];
	double duration[SLICE_MAX_NUM];
	bool pidfreeze[SLICE_MAX_NUM];
    uint16_t numSlices;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }
		
	if (!SCPI_ParamUInt32(context, &indexElement, true)) {
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM:BYINDEX? Failed to parse index of desired element.\n");
        return SCPI_RES_ERR;
    }
	
    result = rp_seqReadElementByIndex(channel, (uint16_t)indexElement, &numSlices, Vstart, Vstop, duration, pidfreeze);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ELEM:BYINDEX? Failed to "
            "get element data: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }
	
    double buffer[numSlices*PARAM_PER_SLICE];
	for(uint16_t i=0; i<numSlices; i++){
		buffer[i*PARAM_PER_SLICE] = (double)Vstart[i];
		buffer[i*PARAM_PER_SLICE +1] = (double)Vstop[i];
		buffer[i*PARAM_PER_SLICE +2] = duration[i];
		buffer[i*PARAM_PER_SLICE +3] = (double)pidfreeze[i];
	}
	
    SCPI_ResultBufferDouble(context, buffer, numSlices*PARAM_PER_SLICE);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:ELEM:BYINDEX? Successfully "
        "returned element data to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqInitElements(scpi_t *context) {
    
    rp_channel_t channel;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    result = rp_seqInitElementsCounter(channel);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:DATA:INIT Failed to initialize "
            "data counters: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:DATA:INIT Successfully initialized elements counter.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqListSlice0Q(scpi_t *context) {
    
    rp_channel_t channel;

	uint16_t numElements;
	uint16_t listSlice0[STEP_MAX_NUM];
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }
		
	result = rp_seqGetListSlice0(channel, &numElements, listSlice0);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:LISTSLICE0? Failed to "
            "get list of first slices of elements: %s\n", rp_GetError(result));
        return SCPI_RES_ERR;
    }

    SCPI_ResultBufferUInt16(context, listSlice0, numElements);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:LISTSLICE0? Successfully "
        "returned list of first slices of elements to client.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqEnforceMode(scpi_t *context) {
        
    rp_channel_t channel;
    int32_t enforceModeChoice;
    int result;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ParamChoice(context, scpi_RpSeqEnforceMode, &enforceModeChoice, true)){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ENFORCE Failed to parse first parameter.\n");
        return SCPI_RES_ERR;
    }

    result = rp_seqSetEnforceMode(channel, (rp_seq_enforcemode_t)enforceModeChoice);
    if(result != RP_OK){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ENFORCE Failed to set sequence parameter"
        " enforce mode: %s\n", rp_GetError(result));

        return SCPI_RES_ERR;
    }

    RP_LOG(LOG_INFO, "*SEQ#:GEN:ENFORCE Successfully set sequence parameter enforce mode.\n");
    return SCPI_RES_OK;
}

scpi_result_t RP_SeqEnforceModeQ(scpi_t *context) {
    
    rp_channel_t channel;
    const char *enforceModeChoice;

    if (RP_ParseChArgv(context, &channel) != RP_OK){
        return SCPI_RES_ERR;
    }

    rp_seq_enforcemode_t enforceMode;
    if (rp_seqGetEnforceMode(channel, &enforceMode) != RP_OK){
        return SCPI_RES_ERR;
    }

    if(!SCPI_ChoiceToName(scpi_RpSeqEnforceMode, (int32_t)enforceMode, &enforceModeChoice)){
        RP_LOG(LOG_ERR, "*SEQ#:GEN:ENFORCE? Failed to parse sequence parameter enforce mode.\n");
        return SCPI_RES_ERR;
    }

    SCPI_ResultMnemonic(context, enforceModeChoice);

    RP_LOG(LOG_INFO, "*SEQ#:GEN:ENFORCE? Successfully returned"
    " sequence parameter enforce mode to client.\n");

    return SCPI_RES_OK;
}
