/**
 * $Id: $
 *
 * @brief Red Pitaya library SeqPID handler interface
 *
 * @Author Alexei
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#ifndef SEQ_HANDLER_H_
#define SEQ_HANDLER_H_

#include "redpitaya/rpseq.h"

int seq_Init();
int seq_Release();
int seq_setInputRangeLow(rp_channel_t channel, bool value);
int seq_getInputRangeLow(rp_channel_t channel, bool *value);
int seq_setDefaultValues(rp_channel_t channel);

int seq_setAction(rp_seq_action_t action);
int seq_setActionIdle();
int seq_setActionInit();
int seq_setActionStop();
int seq_setActionRun();
int seq_getAction(rp_seq_action_t *action);
int seq_setTrigOutEnab(bool enable);
int seq_getTrigOutEnab(bool *enabled);
int seq_setClkOutEnab(bool enable);
int seq_getClkOutEnab(bool *enabled);
int seq_getClkExtUse(bool *clkExtUse);

int seq_getRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq);
int seq_setPIDEnabled(rp_channel_t channel, bool enable); 
int seq_getPIDEnabled(rp_channel_t channel, bool *enabled);
int seq_setTrigEnabled(rp_channel_t channel, bool enable);
int seq_getTrigEnabled(rp_channel_t channel, bool *enabled);
int seq_setPIDGainP(rp_channel_t channel, float gain);
int seq_getPIDGainP(rp_channel_t channel, float *gain);
int seq_setPIDGainI(rp_channel_t channel, float gain);
int seq_getPIDGainI(rp_channel_t channel, float *gain);
int seq_setPIDGainD(rp_channel_t channel, float gain);
int seq_getPIDGainD(rp_channel_t channel, float *gain);
int seq_setPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value);
int seq_getPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value);
int seq_setPIDMin(rp_channel_t channel, float pidmin);
int seq_getPIDMin(rp_channel_t channel, float *pidmin);
int seq_setPIDMax(rp_channel_t channel, float pidmax);
int seq_getPIDMax(rp_channel_t channel, float *pidmax);
int seq_setSyncDelay(rp_channel_t channel, double value);
int seq_getSyncDelay(rp_channel_t channel, double *value);
int seq_setGenOverwriteValue(rp_channel_t channel, float value);
int seq_getGenOverwriteValue(rp_channel_t channel, float *value);
int seq_getInputValue(rp_channel_t channel, float *value);
int seq_getGenOutputValue(rp_channel_t channel, float *value);
int seq_getSeqRunning(rp_channel_t channel, bool *running);

int seq_writeStepsBySlice(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);
int seq_readStepsBySlice(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);
int seq_writeStepsByIndex(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode);
int seq_readStepsByIndex(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode);
int seq_writeElement(rp_channel_t channel, rp_seq_pidmutemode_t muteMode, uint16_t length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze); 
//						  int16_t *dacStartQ, int16_t *dacStepQ, uint32_t *timeSliceQ, uint32_t *timeIncrQ, bool *pidfreezeQ);
int seq_readElementBySlice(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length,
						   float *Vstart, float *Vstop, double *duration, bool *pidfreeze);
int seq_readElementByIndex(rp_channel_t channel, uint16_t indexElement, uint16_t *length,
						   float *Vstart, float *Vstop, double *duration, bool *pidfreeze);
int seq_initElementsCounter(rp_channel_t channel);
int seq_getListSlice0(rp_channel_t channel, uint16_t *numElements, uint16_t *listSlice0);
int seq_rebuildListSlice0(rp_channel_t channel);
int seq_setEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode);
int seq_getEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode);

int findUint16InSortedList(uint16_t *list, uint16_t length, uint16_t element, uint16_t *indexElement);
#endif