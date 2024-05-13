/**
 * $Id: $
 *
 * @brief Red Pitaya library API interface implementation
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
#include <stdint.h>

#include "redpitaya/version.h"
#include "common.h"
#include "calib.h"
//#include "housekeeping.h"
//#include "seqpid.h"
#include "seq_handler.h"

static char version[50];

/**
 * Global methods
 */

int rp_Init()
{
    cmn_Init();
    calib_Init();
    return seq_Init();
}

int rp_CalibInit()
{
    calib_Init();
    return RP_OK;
}

int rp_Release()
{
	seq_Release();
    calib_Release();
    cmn_Release();
    // TODO: Place other module releasing here (in reverse order)
    return RP_OK;
}

int rp_Reset()
{
	rp_seqReset(RP_CH_1);
	rp_seqReset(RP_CH_2);
    // TODO: Place other module resetting here
    return 0;
}

const char* rp_GetVersion()
{
    sprintf(version, "%s (%s)", VERSION_STR, REVISION_STR);
    return version;
}

const char* rp_GetError(int errorCode) {
    switch (errorCode) {
        case RP_OK:    return "OK";
        case RP_EOED:  return "Failed to Open EEPROM Device.";
        case RP_EOMD:  return "Failed to open memory device.";
        case RP_ECMD:  return "Failed to close memory device.";
        case RP_EMMD:  return "Failed to map memory device.";
        case RP_EUMD:  return "Failed to unmap memory device.";
        case RP_EOOR:  return "Value out of range.";
        case RP_ELID:  return "LED input direction is not valid.";
        case RP_EMRO:  return "Modifying read only filed is not allowed.";
        case RP_EWIP:  return "Writing to input pin is not valid.";
        case RP_EPN:   return "Invalid Pin number.";
        case RP_UIA:   return "Uninitialized Input Argument.";
        case RP_FCA:   return "Failed to Find Calibration Parameters.";
        case RP_RCA:   return "Failed to Read Calibration Parameters.";
        case RP_BTS:   return "Buffer too small";
        case RP_EIPV:  return "Invalid parameter value";
        case RP_EUF:   return "Unsupported Feature";
        case RP_ENN:   return "Data not normalized";
        case RP_EFOB:  return "Failed to open bus";
        case RP_EFCB:  return "Failed to close bus";
        case RP_EABA:  return "Failed to acquire bus access";
        case RP_EFRB:  return "Failed to read from the bus";
        case RP_EFWB:  return "Failed to write to the bus";
        case RP_MOF:   return "Memory overflow";
        case RP_MDM:   return "Memory data mismatch";
        default:       return "Unknown error";
    }
}

/**
 * Calibrate methods
 */

rp_calib_params_t rp_GetCalibrationSettings()
{
    return calib_GetParams();
}
/**
 * Identification
 */
/*
int rp_IdGetID(uint32_t *id) {
    *id = ioread32(&hk->id);
    return RP_OK;
}

int rp_IdGetDNA(uint64_t *dna) {
    *dna = ((uint64_t) ioread32(&hk->dna_hi) << 32)
         | ((uint64_t) ioread32(&hk->dna_lo) <<  0);
    return RP_OK;
}
*/

/**
* Sequence generator + PID methods
*/

int rp_seqReset(rp_channel_t channel){
    return seq_setDefaultValues(channel);
}
int rp_seqSetInputRangeLow(rp_channel_t channel, bool value){
	return seq_setInputRangeLow(channel, value);
}

int rp_seqGetInputRangeLow(rp_channel_t channel, bool *value){
	return seq_getInputRangeLow(channel, value);
}

//Instrument-level
int rp_seqSetAction(rp_seq_action_t action){
	return seq_setAction(action);
}
int rp_seqSetActionIdle(){
	return seq_setActionIdle();
}
int rp_seqSetActionInit(){
	return seq_setActionInit();
}
int rp_seqSetActionStop(){
	return seq_setActionStop();
}
int rp_seqSetActionRun(){
	return seq_setActionRun();
}
int rp_seqGetAction(rp_seq_action_t *action){
	return seq_getAction(action);
}
int rp_seqSetTrigOutEnab(bool enable){
    return seq_setTrigOutEnab(enable);
}
int rp_seqGetTrigOutEnab(bool *enabled){
    return seq_getTrigOutEnab(enabled);
}
int rp_seqSetClkOutEnab(bool enable){
    return seq_setClkOutEnab(enable);
}
int rp_seqGetClkOutEnab(bool *enabled){
    return seq_getClkOutEnab(enabled);
}

int rp_seqGetClkExtUse(bool *enabled){
    return seq_getClkExtUse(enabled);
}

//Channel-level

int rp_seqGetRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq){
	return seq_getRanges(channel, minIn, maxIn, minOut, maxOut, clkFreq);
}

int rp_seqSetPIDEnabled(rp_channel_t channel, bool enable){
    return seq_setPIDEnabled(channel, enable);
}
int rp_seqGetPIDEnabled(rp_channel_t channel, bool *enable){
    return seq_getPIDEnabled(channel, enable);
}
int rp_seqSetTrigEnabled(rp_channel_t channel, bool enable){
    return seq_setTrigEnabled(channel, enable);
}
int rp_seqGetTrigEnabled(rp_channel_t channel, bool *enabled){
    return seq_getTrigEnabled(channel, enabled);
}
int rp_seqSetPIDGainP(rp_channel_t channel, float gain){
	return seq_setPIDGainP(channel, gain);
}
int rp_seqGetPIDGainP(rp_channel_t channel, float *gain){
	return seq_getPIDGainP(channel, gain);
}
int rp_seqSetPIDGainI(rp_channel_t channel, float gain){
	return seq_setPIDGainI(channel, gain);
}
int rp_seqGetPIDGainI(rp_channel_t channel, float *gain){
	return seq_getPIDGainI(channel, gain);
}
int rp_seqSetPIDGainD(rp_channel_t channel, float gain){
	return seq_setPIDGainD(channel, gain);
}
int rp_seqGetPIDGainD(rp_channel_t channel, float *gain){
	return seq_getPIDGainD(channel, gain);
}
int rp_seqSetPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value){
	return seq_setPIDFreqLimD(channel, value);
}
int rp_seqGetPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value){
	return seq_getPIDFreqLimD(channel, value);
}
int rp_seqSetPIDMin(rp_channel_t channel, float pidmin){
	return seq_setPIDMin( channel, pidmin);
}
int rp_seqGetPIDMin(rp_channel_t channel, float *pidmin){
	return  seq_getPIDMin( channel, pidmin);
}
int rp_seqSetPIDMax(rp_channel_t channel, float pidmax){
	return seq_setPIDMax(channel, pidmax);
}
int rp_seqGetPIDMax(rp_channel_t channel, float *pidmax){
	return seq_getPIDMax(channel, pidmax);
}
int rp_seqSetSyncDelay(rp_channel_t channel, double value){
	return seq_setSyncDelay(channel, value);
}
int rp_seqGetSyncDelay(rp_channel_t channel, double *value){
	return seq_getSyncDelay(channel, value);
}
int rp_seqSetGenOverwriteValue(rp_channel_t channel, float value){
	return seq_setGenOverwriteValue(channel, value);
}
int rp_seqGetGenOverwriteValue(rp_channel_t channel, float *value){
	return seq_getGenOverwriteValue(channel, value);
}
int rp_seqGetInputValue(rp_channel_t channel, float *value){
	return seq_getInputValue(channel, value);
}
int rp_seqGetGenOutputValue(rp_channel_t channel, float *value){
	return seq_getGenOutputValue(channel, value);
}
int rp_seqGetRunning(rp_channel_t channel, bool *running){
    return seq_getSeqRunning(channel, running);
}
int rp_seqWriteStepsBySlice(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode){
	return seq_writeStepsBySlice(channel, length, countBurst, indexSlice0, muteMode);
}
int rp_seqReadStepsBySlice(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode){
	return seq_readStepsBySlice(channel, length, countBurst, indexSlice0, muteMode);
}
int rp_seqWriteStepsByIndex(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode){
	return seq_writeStepsByIndex(channel, length, countBurst, indexStep, muteMode);
}
int rp_seqReadStepsByIndex(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode){
	return seq_readStepsByIndex(channel, length, countBurst, indexStep, muteMode);
}
int rp_seqWriteElement(rp_channel_t channel, rp_seq_pidmutemode_t muteMode, uint16_t length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze){ 
//						  int16_t *dacStartQ, int16_t *dacStepQ, uint32_t *timeSliceQ, uint32_t *timeIncrQ, bool *pidfreezeQ){
	return seq_writeElement(channel, muteMode, length, Vstart, Vstop, duration, pidfreeze); 
//						  dacStartQ, dacStepQ, timeSliceQ, timeIncrQ, pidfreezeQ);
}
int rp_seqReadElementBySlice(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze){
	return seq_readElementBySlice(channel, indexSlice0, length, Vstart, Vstop, duration, pidfreeze);
}
int rp_seqReadElementByIndex(rp_channel_t channel, uint16_t indexElement, uint16_t *length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze){
	return seq_readElementByIndex(channel, indexElement, length, Vstart, Vstop, duration, pidfreeze);
}
int rp_seqInitElementsCounter(rp_channel_t channel){
	return seq_initElementsCounter(channel);
}

int rp_seqGetListSlice0(rp_channel_t channel, uint16_t *numElements, uint16_t *listSlice0){
	return seq_getListSlice0(channel, numElements, listSlice0);
}

int rp_seqSetEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode){
	return seq_setEnforceMode(channel, enforceMode);
}
int rp_seqGetEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode){
	return seq_getEnforceMode(channel, enforceMode);
}


/**
* Common methods
*/


float rp_CmnCnvCntToV(uint32_t field_len, uint32_t cnts, float adc_max_v, bool calibFS_LO, uint32_t calibScale, int calib_dc_off, float user_dc_off)
{
	return cmn_CnvCntToV(field_len, cnts, adc_max_v, calibFS_LO, calibScale, calib_dc_off, user_dc_off);
}


