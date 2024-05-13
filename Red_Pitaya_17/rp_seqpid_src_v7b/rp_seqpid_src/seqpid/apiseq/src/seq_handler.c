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

#include <float.h>
#include "math.h"
#include "common.h"
#include "seqpid.h"
#include "seqpidinstr.h"
#include "seq_handler.h"

// global variables
uint16_t numElementsA = 0;//number of different elements (pulse shapes) used in the sequence
uint16_t numElementsB = 0;
/*Elements are made of slices where the signal is linear with time. These slices are concatenated in sliceRAM.
listSlice0X stores the indices (=internal BRAM port addresses) of the first slices of the elements 
*/
uint16_t listSlice0A[STEP_MAX_NUM];
uint16_t listSlice0B[STEP_MAX_NUM];


// Init/Exit/Reset
int seq_Init(){
	seqpidinstr_Init();
	seqpid_Init();
	seq_rebuildListSlice0(RP_CH_1);
	seq_rebuildListSlice0(RP_CH_2);
	return RP_OK;
}

int seq_Release(){
	seqpidinstr_Release();
	seqpid_Release();
	return RP_OK;
}
int seq_setInputRangeLow(rp_channel_t channel, bool value){
	    return seqpid_setInputRangeLow(channel, value);
}
int seq_getInputRangeLow(rp_channel_t channel, bool *value){
	    return seqpid_getInputRangeLow(channel, value);
}


int seq_setDefaultValues(rp_channel_t channel){
	float defFlt[1]={0};
	bool defBool[1]={false};
	double defT[1]={TICKSELEM_MIN/DAC_FREQUENCY};
	rp_seq_pidmutemode_t defMuteMode[1]={RP_SEQ_PIDMUTE_FREEZE};
	uint16_t defU16[1]={0};
	uint32_t defU32[1]={0};
	seq_setActionIdle();
	seq_setPIDEnabled(channel, false); 
	seq_setPIDGainP(channel, 0);
	seq_setPIDGainI(channel, 0);
	seq_setPIDGainD(channel, 0);
	seq_setPIDFreqLimD(channel, RP_SEQ_DFLIM_2M5);
	seq_setPIDMin(channel, -AMPLITUDE_MAX_OUT);
	seq_setPIDMax(channel, AMPLITUDE_MAX_OUT);
	seq_setSyncDelay(channel, 0);
	seq_setGenOverwriteValue(channel, 0);
	seq_setEnforceMode(channel, RP_SEQ_ENFORCE_VT);
	seq_initElementsCounter(channel);
	seq_writeElement(channel, RP_SEQ_PIDMUTE_FREEZE, 1, defFlt, defFlt, defT, defBool);
	seq_writeStepsByIndex(channel, 1, defU32, defU16, defMuteMode);
	return RP_OK;
}

//Instrument-level commands
int seq_setAction(rp_seq_action_t action) {
    return seqpidinstr_setAction(action);
}
int seq_setActionIdle() {
    return seqpidinstr_setAction(RP_SEQ_IDLE);
}
int seq_setActionInit() {
    seqpidinstr_setAction(RP_SEQ_IDLE);
    seqpidinstr_setAction(RP_SEQ_INIT);
    return seqpidinstr_setAction(RP_SEQ_IDLE);
}
int seq_setActionStop() {
    seqpidinstr_setAction(RP_SEQ_STOP);
    return seqpidinstr_setAction(RP_SEQ_IDLE);
}
int seq_setActionRun() {
    seqpidinstr_setAction(RP_SEQ_IDLE);
    seqpidinstr_setAction(RP_SEQ_RUN);
    return seqpidinstr_setAction(RP_SEQ_IDLE);
}

int seq_getAction(rp_seq_action_t *action) {
    return seqpidinstr_getAction(action);
}

int seq_setTrigOutEnab(bool enable) {
    return seqpidinstr_setTrigOutEnab(enable);
}

int seq_getTrigOutEnab(bool *enabled) {
    return seqpidinstr_getTrigOutEnab(enabled);
}

int seq_setClkOutEnab(bool enable) {
    return seqpidinstr_setClkOutEnab(enable);
}

int seq_getClkOutEnab(bool *enabled) {
    return seqpidinstr_getClkOutEnab(enabled);
}

int seq_getClkExtUse(bool *enabled){
    return seqpidinstr_getClkExtUse(enabled);
}

//Channel-level commands

int seq_getRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq){
	return seqpid_getRanges(channel, minIn, maxIn,  minOut, maxOut, clkFreq);
}

int seq_setPIDEnabled(rp_channel_t channel, bool enable) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDOn(channel, enable);//TODO: send error message if sequence running, and handle it properly on the user side
}

int seq_getPIDEnabled(rp_channel_t channel, bool *enabled) {
    return seqpid_getPIDOn(channel, enabled);
}

int seq_setTrigEnabled(rp_channel_t channel, bool enable) {
    return seqpid_setTrigEnabled(channel, enable);
}

int seq_getTrigEnabled(rp_channel_t channel, bool *enabled) {
    return seqpid_getTrigEnabled(channel, enabled);
}

int seq_setPIDGainP(rp_channel_t channel, float gain) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDGainP(channel, gain);
}

int seq_getPIDGainP(rp_channel_t channel, float *gain) {
    return seqpid_getPIDGainP(channel, gain);
}

int seq_setPIDGainI(rp_channel_t channel, float gain) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDGainI(channel, gain);
}

int seq_getPIDGainI(rp_channel_t channel, float *gain) {
    return seqpid_getPIDGainI(channel, gain);
}

int seq_setPIDGainD(rp_channel_t channel, float gain) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDGainD(channel, gain);
}

int seq_getPIDGainD(rp_channel_t channel, float *gain) {
    return seqpid_getPIDGainD(channel, gain);
}

int seq_setPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDFreqLimD(channel, value);
}

int seq_getPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value) {
    return seqpid_getPIDFreqLimD(channel, value);
}

int seq_setPIDMin(rp_channel_t channel, float pidmin) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDMin(channel, pidmin);
}

int seq_getPIDMin(rp_channel_t channel, float *pidmin) {
    return seqpid_getPIDMin(channel, pidmin);
}

int seq_setPIDMax(rp_channel_t channel, float pidmax) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setPIDMax(channel, pidmax);
}

int seq_getPIDMax(rp_channel_t channel, float *pidmax) {
    return seqpid_getPIDMax(channel, pidmax);
}

int seq_setSyncDelay(rp_channel_t channel, double value) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	    return seqRunning ? RP_OK : seqpid_setSyncDelay(channel, value);
}

int seq_getSyncDelay(rp_channel_t channel, double *value) {
    return seqpid_getSyncDelay(channel, value);
}


int seq_setGenOverwriteValue(rp_channel_t channel, float value) {
	bool pid_on;
	seqpid_getPIDOn(channel, &pid_on);
	seqpid_setGenOverwriteValue(channel, value, pid_on);
	seqpid_setGenOverwriteEnable(channel, false);
	seqpid_setGenOverwriteEnable(channel, true);//output overwritten by provided value at rising edge, if sequence not running (condition handled by FPGA)
	return seqpid_setGenOverwriteEnable(channel, false);
}

int seq_getGenOverwriteValue(rp_channel_t channel, float *value) {
	bool pid_on;
	seqpid_getPIDOn(channel, &pid_on);
    return seqpid_getGenOverwriteValue(channel, value, pid_on);
}

int seq_getInputValue(rp_channel_t channel, float *value) {
    return seqpid_getInputValue(channel, value);
}

int seq_getGenOutputValue(rp_channel_t channel, float *value) {
	bool pid_on;
	seqpid_getPIDOn(channel, &pid_on);
    return seqpid_getGenOutputValue(channel, value, pid_on);
}

int seq_getSeqRunning(rp_channel_t channel, bool *running) {
    return seqpid_getSeqRunning(channel, running);
}

/*
*@brief Write into stepRAM a list of {indexSlice0,countBurst}
*/
int seq_writeStepsBySlice(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode) {
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	if(seqRunning)
		return RP_OK;
	else{
		seqpid_setCountStepLim(channel, length-1);
	    return seqpid_writeStepData(channel, length, countBurst, indexSlice0, muteMode);
	}
}

/*
*@brief Read from stepRAM a list of {indexSlice0,countBurst}, and its length (= total number of step elements in a flattened sequence)
*/
int seq_readStepsBySlice(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode) {
	uint16_t countStepLim;
	seqpid_getCountStepLim(channel, &countStepLim);
	*length = countStepLim+1;
    return seqpid_readStepData(channel, countStepLim+1, countBurst, indexSlice0, muteMode);
}

/*
*@brief Write into stepRAM a list of {indexSlice0,countBurst} where indexSlice0 is determined from listSlice0 using indexStep
* For listSlice0 to be up to date, this function should not be called before sliceRAM is filled with data for all elements
*/
int seq_writeStepsByIndex(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode) {
	uint16_t indexSlice0[length];
	uint16_t numElements;
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	if(seqRunning)
		return RP_OK;
	else{
		CHANNEL_ACTION(channel,
			numElements = numElementsA,
			numElements = numElementsB)

		for (uint16_t i=0; i<length; i++){
			if(indexStep[i] >= numElements)//the list of defined elements is too short
				return RP_MDM;
			CHANNEL_ACTION(channel,
				indexSlice0[i] = listSlice0A[indexStep[i]],
				indexSlice0[i] = listSlice0B[indexStep[i]])
		}
		seqpid_setCountStepLim(channel, length-1);
		return seq_writeStepsBySlice(channel, length, countBurst, indexSlice0, muteMode);
	}
}

/*
*@brief Read from stepRAM a list of {indexSlice0,countBurst}, use listSlice0 to determine indexStep from indexSlice0
* For listSlice0 to be up to date, this function should not be called before sliceRAM is filled with data for all elements
*/
int seq_readStepsByIndex(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode) {
	uint16_t countStepLim;
	seqpid_getCountStepLim(channel, &countStepLim);
	*length = countStepLim+1;
	
	uint16_t indexSlice0[countStepLim+1];//list of addresses of first slices, as executed in a flattened sequence
    int error = seqpid_readStepData(channel, countStepLim+1, countBurst, indexSlice0, muteMode);
	if(error)
		return error;
	
	uint16_t numElements;//number of different elements (pulse shapes) used in the sequence
	CHANNEL_ACTION(channel,
		numElements = numElementsA,
		numElements = numElementsB)
	
	uint16_t listSlice0[numElements];//lists addresses of first slices, in order, unique
	for(int i=0; i<numElements; i++){
		CHANNEL_ACTION(channel,
			listSlice0[i] = listSlice0A[i],
			listSlice0[i] = listSlice0B[i])
	}
	for(uint16_t i = 0; i <=countStepLim; i++){
		if(findUint16InSortedList(listSlice0, numElements, indexSlice0[i], &indexStep[i]))
			return RP_MDM;
	}
	return RP_OK;
}

//write data for next element (Vstart[length], Vstop[length], duration[length], freezePID[length], length = nb of slices)
int seq_writeElement(rp_channel_t channel, rp_seq_pidmutemode_t muteMode, uint16_t length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze) { 
	rp_seq_enforcemode_t enforceMode;
	uint16_t indexSlice0;
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	if(seqRunning)
		return RP_OK;
	else{
		seqpid_getEnforceMode(channel, &enforceMode);
		CHANNEL_ACTION(channel,
			indexSlice0 = listSlice0A[numElementsA++],
			indexSlice0 = listSlice0B[numElementsB++])
		if(indexSlice0+length > SLICE_MAX_NUM)
				return RP_MOF;//the slice RAM is full

		CHANNEL_ACTION(channel,
			listSlice0A[numElementsA] = indexSlice0 + length,
			listSlice0B[numElementsB] = indexSlice0 + length)		
		return seqpid_writeSliceData(channel, enforceMode, indexSlice0, muteMode, length, Vstart, Vstop, duration, pidfreeze);
	}
}

//read data for element starting at slice indexSlice0 (Vstart[length], Vstop[length], duration[length], freezePID, length = nb of slices)
int seq_readElementBySlice(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length,
						   float *Vstart, float *Vstop, double *duration, bool *pidfreeze) {
	if (indexSlice0 >= SLICE_MAX_NUM)
		return RP_EOOR;

	uint16_t countStepLim;
	seqpid_getCountStepLim(channel, &countStepLim);

	uint32_t countBurstList[countStepLim+1];//list of burst counts, as executed in a flattened sequence
	uint16_t indexSlice0List[countStepLim+1];//list of addresses of first slices, as executed in a flattened sequence
	rp_seq_pidmutemode_t muteModeList[countStepLim+1];//list of mute modes, as executed in a flattened sequence
    seqpid_readStepData(channel, countStepLim+1, countBurstList, indexSlice0List, muteModeList);
	
	uint16_t index;
	findUint16InSortedList(indexSlice0List, countStepLim+1, indexSlice0, &index);
		
	rp_seq_enforcemode_t enforceMode;
	seqpid_getEnforceMode(channel, &enforceMode);

	return seqpid_readSliceData(channel, enforceMode, indexSlice0, muteModeList[index], length, Vstart, Vstop, duration, pidfreeze);
}

//read data for element number indexElement (Vstart[length], Vstop[length], duration[length], freezePID, length = nb of slices)
int seq_readElementByIndex(rp_channel_t channel, uint16_t indexElement, uint16_t *length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze) {

	rp_seq_enforcemode_t enforceMode;
	seqpid_getEnforceMode(channel, &enforceMode);
	
	uint16_t indexSlice0;
	CHANNEL_ACTION(channel,
		indexSlice0 = listSlice0A[indexElement],
		indexSlice0 = listSlice0B[indexElement])
		
	uint16_t countStepLim;
	seqpid_getCountStepLim(channel, &countStepLim);

	uint32_t countBurstList[countStepLim+1];//list of burst counts, as executed in a flattened sequence
	uint16_t indexSlice0List[countStepLim+1];//list of addresses of first slices, as executed in a flattened sequence
	rp_seq_pidmutemode_t muteModeList[countStepLim+1];//list of mute modes, as executed in a flattened sequence
    seqpid_readStepData(channel, countStepLim+1, countBurstList, indexSlice0List, muteModeList);
	
	uint16_t index;
	findUint16InSortedList(indexSlice0List, countStepLim+1, indexSlice0, &index);
		
	return seqpid_readSliceData(channel, enforceMode, indexSlice0, muteModeList[index], length, Vstart, Vstop, duration, pidfreeze);
}


int seq_initElementsCounter(rp_channel_t channel){
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	if(seqRunning)
		return RP_OK;
	else{
		CHANNEL_ACTION(channel,
			numElementsA = 0,
			numElementsB = 0)
		CHANNEL_ACTION(channel,
			listSlice0A[0] = 0,
			listSlice0B[0] = 0)
			return RP_OK;
	}
}

int seq_getListSlice0(rp_channel_t channel, uint16_t *numElements, uint16_t *listSlice0){
	uint16_t numel;
	CHANNEL_ACTION(channel,
		numel = numElementsA,
		numel = numElementsB)
	*numElements = numel;
	for(uint16_t i=0; i<numel; i++){		
		CHANNEL_ACTION(channel,
			listSlice0[i] = listSlice0A[i],
			listSlice0[i] = listSlice0B[i])
	}
	return RP_OK;
}

//rebuilds numElements and listSlice0 from data in FPGA RAMS
int seq_rebuildListSlice0(rp_channel_t channel){

	uint16_t indexSlice0 = 0;
	uint16_t length;

	CHANNEL_ACTION(channel,
	numElementsA = 0,
	numElementsB = 0)

	for(uint16_t i = 0; i < SLICE_MAX_NUM; i++) {
		if(!(seqpid_readNbSlicesInElement(channel, indexSlice0, &length))){			
			CHANNEL_ACTION(channel,
				listSlice0A[i] = indexSlice0,
				listSlice0B[i] = indexSlice0)
			CHANNEL_ACTION(channel,
				++numElementsA,
				++numElementsB)
		}
		else{
			return RP_OK;
		}
		indexSlice0 += length;
	}
	return RP_OK;
}

int seq_setEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode){
	bool seqRunning;
	seqpid_getSeqRunning(channel, &seqRunning);
	return 	seqRunning? RP_OK : seqpid_setEnforceMode(channel, enforceMode);
}

int seq_getEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode){
	return 	seqpid_getEnforceMode(channel, enforceMode);
}


//Private functions

int findUint16InSortedList(uint16_t *list, uint16_t length, uint16_t element, uint16_t *indexElement){
	uint8_t listbitlength = 0;
	while(length>>listbitlength){
		++listbitlength;
	}
	uint16_t step = 1 << (listbitlength -1);
	uint16_t index = 1 << (listbitlength -1);
	while(step){
		if(index >= length)
			index -= step;
		else if(list[index] == element)
			break;
		else if(list[index] > element)
			index -= step;
		else
			index += step;
		step = step >> 1;
	}
	*indexElement = index;
	return (list[index] == element) ? 0 : 1;
}
