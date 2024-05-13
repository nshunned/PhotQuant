/**
 * $Id: $
 *
 * @brief Red Pitaya library SeqPID module interface
 *
 * @Author Alexei
 *
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "redpitaya/rpseq.h"
#include "common.h"
#include "seqpid.h"
#include "calib.h"

//Pointers for memory mapping
static volatile seqpid_control_t *seqpidA = NULL;
static volatile seqpid_control_t *seqpidB = NULL;
static volatile uint32_t *data_stepA = NULL;
static volatile uint32_t *data_stepB = NULL;
static volatile uint32_t *data_sliceA = NULL;
static volatile uint32_t *data_sliceB = NULL;

//Global variables:
bool inputRangeA;//low=2Vpp, high=40Vpp
bool inputRangeB;

// MEMORY MAPPING:
int seqpid_Init() {
    cmn_Map(SEQPID_BASE_SIZE, SEQPID_BASE_ADDR_A, (void **) &seqpidA);
    cmn_Map(SEQPID_BASE_SIZE, SEQPID_BASE_ADDR_B, (void **) &seqpidB);
    data_stepA = (uint32_t *) ((char *) seqpidA + (STEP_DATA_OFFSET));
    data_stepB = (uint32_t *) ((char *) seqpidB + (STEP_DATA_OFFSET));
    data_sliceA = (uint32_t *) ((char *) seqpidA + (SLICE_DATA_OFFSET));
    data_sliceB = (uint32_t *) ((char *) seqpidB + (SLICE_DATA_OFFSET));
    return RP_OK;
}

int seqpid_Release() {
    cmn_Unmap(SEQPID_BASE_SIZE, (void **) &seqpidA);
    cmn_Unmap(SEQPID_BASE_SIZE, (void **) &seqpidB);
    data_stepA = NULL;
    data_stepB = NULL;
    data_sliceA = NULL;
    data_sliceB = NULL;
    return RP_OK;
}

int getSeqPIDPropertiesAddress(volatile seqpid_control_t **seqpidCh, rp_channel_t channel) {
    CHANNEL_ACTION(channel,
            *seqpidCh = seqpidA,
            *seqpidCh = seqpidB)
    return RP_OK;
}

int getStepDataAddress(volatile uint32_t **seqpidStepAddr, rp_channel_t channel) {
    CHANNEL_ACTION(channel,
            *seqpidStepAddr = data_stepA,
            *seqpidStepAddr = data_stepB)
    return RP_OK;
}

int getSliceDataAddress(volatile uint32_t **seqpidSliceAddr, rp_channel_t channel) {
    CHANNEL_ACTION(channel,
            *seqpidSliceAddr = data_sliceA,
            *seqpidSliceAddr = data_sliceB)
    return RP_OK;
}

// RANGES AND RATES:
int seqpid_setInputRangeLow(rp_channel_t channel, bool value){
	CHANNEL_ACTION(channel,
			seqpidA->inputRangeLow = value,
			seqpidB->inputRangeLow = value)
    rp_calib_params_t calib = calib_GetParams();
	CHANNEL_ACTION(channel,
		seqpidA->offset_adc = value ? -calib.fe_ch1_lo_offs : -calib.fe_ch1_hi_offs,
		seqpidB->offset_adc = value ? -calib.fe_ch2_lo_offs : -calib.fe_ch2_hi_offs)
	CHANNEL_ACTION(channel,
		seqpidA->offset_dac = -calib.be_ch1_dc_offs,
		seqpidB->offset_dac = -calib.be_ch2_dc_offs)				
    return RP_OK;
}

int seqpid_getInputRangeLow(rp_channel_t channel, bool *value) {
	CHANNEL_ACTION(channel,
			*value = (bool)(seqpidA->inputRangeLow),
			*value = (bool)(seqpidB->inputRangeLow))
		return RP_OK;
}

int seqpid_getRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq) {
	int dc_offs;
	uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	CHANNEL_ACTION(channel,
		dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs,
		dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
	CHANNEL_ACTION(channel,
		amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
		amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)
	amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;
	*minIn = cmn_CnvCntToV(DAC_RESOLUTION, ((-1)<<(DAC_RESOLUTION-1)), amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);
	*maxIn = cmn_CnvCntToV(DAC_RESOLUTION, (1<<(DAC_RESOLUTION-1))-1, amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);

	CHANNEL_ACTION(channel,
		dc_offs = calib.be_ch1_dc_offs,
		dc_offs = calib.be_ch2_dc_offs)
	CHANNEL_ACTION(channel,
		amp_scale = calib.be_ch1_fs,
		amp_scale = calib.be_ch2_fs)
	calibFS_LO = false;
	amp_Volt=AMPLITUDE_MAX_OUT;
	*minOut = cmn_CnvCntToV(DAC_RESOLUTION, ((-1)<<(DAC_RESOLUTION-1)), amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);
	*maxOut = cmn_CnvCntToV(DAC_RESOLUTION, (1<<(DAC_RESOLUTION-1))-1, amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);

	*clkFreq = DAC_FREQUENCY;

    return RP_OK;
}

// COMMUNICATIONS WITH FPGA:


int seqpid_setPIDOn(rp_channel_t channel, bool enable) {
	CHANNEL_ACTION(channel,
			seqpidA->pid_off = !enable,
			seqpidB->pid_off = !enable)
    return RP_OK;
}

int seqpid_getPIDOn(rp_channel_t channel, bool *enabled) {
	CHANNEL_ACTION(channel,
			*enabled = !((bool)(seqpidA->pid_off)),
			*enabled = !((bool)(seqpidB->pid_off)))
		return RP_OK;
}

int seqpid_setTrigEnabled(rp_channel_t channel, bool enable) {
	CHANNEL_ACTION(channel,
			seqpidA->trig_enable = enable,
			seqpidB->trig_enable = enable)
    return RP_OK;
}

int seqpid_getTrigEnabled(rp_channel_t channel, bool *enabled) {
	CHANNEL_ACTION(channel,
			*enabled = (bool)(seqpidA->trig_enable),
			*enabled = (bool)(seqpidB->trig_enable))
		return RP_OK;
}
int seqpid_setPIDGainP(rp_channel_t channel, float gain) {
	int16_t pid_mult;
	uint8_t pid_exp;
	pidGainFloatToInt(gain, KP_MIN, KP_MAX, PSR_MAX, P_HARD_GAIN, &pid_mult, &pid_exp);
	CHANNEL_ACTION(channel,
			seqpidA->pid_kp = pid_mult,
			seqpidB->pid_kp = pid_mult)
	CHANNEL_ACTION(channel,
			seqpidA->pid_PSR = pid_exp,
			seqpidB->pid_PSR = pid_exp)
    return RP_OK;
}

int seqpid_getPIDGainP(rp_channel_t channel, float *gain) {
    CHANNEL_ACTION(channel,
            *gain = ( (float)intExpand(seqpidA->pid_kp,11) )/( (float)(1<<(4*(seqpidA->pid_PSR))) )*P_HARD_GAIN,
            *gain = ( (float)intExpand(seqpidB->pid_kp,11) )/( (float)(1<<(4*(seqpidB->pid_PSR))) )*P_HARD_GAIN)
    return RP_OK;
}

int seqpid_setPIDGainI(rp_channel_t channel, float gain) {
	int16_t pid_mult;
	uint8_t pid_exp;
	pidGainFloatToInt(gain/DAC_FREQUENCY, KI_MIN, KI_MAX, ISR_MAX, I_HARD_GAIN, &pid_mult, &pid_exp);
	CHANNEL_ACTION(channel,
			seqpidA->pid_ki = pid_mult,
			seqpidB->pid_ki = pid_mult)
	CHANNEL_ACTION(channel,
			seqpidA->pid_ISR = pid_exp,
			seqpidB->pid_ISR = pid_exp)
    return RP_OK;
}

int seqpid_getPIDGainI(rp_channel_t channel, float *gain) {
    CHANNEL_ACTION(channel,
            *gain = ( (float)intExpand(seqpidA->pid_ki,11) )/( (float)(1<<(4*(seqpidA->pid_ISR))) )*DAC_FREQUENCY*I_HARD_GAIN,
            *gain = ( (float)intExpand(seqpidB->pid_ki,11) )/( (float)(1<<(4*(seqpidB->pid_ISR))) )*DAC_FREQUENCY*I_HARD_GAIN)
    return RP_OK;
}


int seqpid_setPIDGainD(rp_channel_t channel, float gain) {
	int16_t pid_mult;
	uint8_t pid_exp;
	pidGainFloatToInt(gain*DAC_FREQUENCY, KD_MIN, KD_MAX, DSR_MAX, D_HARD_GAIN, &pid_mult, &pid_exp);
	CHANNEL_ACTION(channel,
			seqpidA->pid_kd = pid_mult,
			seqpidB->pid_kd = pid_mult)
	CHANNEL_ACTION(channel,
			seqpidA->pid_DSR = pid_exp,
			seqpidB->pid_DSR = pid_exp)
    return RP_OK;
}

int seqpid_getPIDGainD(rp_channel_t channel, float *gain) {
    CHANNEL_ACTION(channel,
            *gain = ( (float)intExpand(seqpidA->pid_kd,11) )/( (float)(1<<(4*(seqpidA->pid_DSR))) )/DAC_FREQUENCY*D_HARD_GAIN,
            *gain = ( (float)intExpand(seqpidB->pid_kd,11) )/( (float)(1<<(4*(seqpidB->pid_DSR))) )/DAC_FREQUENCY*D_HARD_GAIN)
    return RP_OK;
}
int seqpid_setPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value) {
	CHANNEL_ACTION(channel,
			seqpidA->pid_cd = (uint8_t)value,
			seqpidB->pid_cd = (uint8_t)value)
    return RP_OK;
}

int seqpid_getPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value) {
    CHANNEL_ACTION(channel,
            *value = (rp_seq_difffreqlim_t)(seqpidA->pid_cd),
            *value = (rp_seq_difffreqlim_t)(seqpidB->pid_cd))
    return RP_OK;
}

int seqpid_setPIDMin(rp_channel_t channel, float pidmin) {
    volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
	rp_calib_params_t calib = calib_GetParams();
	CHANNEL_ACTION(channel,
			dc_offs = calib.be_ch1_dc_offs,
			dc_offs = calib.be_ch2_dc_offs)
	CHANNEL_ACTION(channel,
			amp_scale = calib.be_ch1_fs,
			amp_scale = calib.be_ch2_fs)
	getSeqPIDPropertiesAddress(&seqpidCh, channel);
	seqpidCh->pid_min = cmn_CnvVToCnt(DAC_RESOLUTION, pidmin, AMPLITUDE_MAX_OUT, false, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_getPIDMin(rp_channel_t channel, float *pidmin) {
    volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
    
	rp_calib_params_t calib = calib_GetParams();
	CHANNEL_ACTION(channel,
			dc_offs = calib.be_ch1_dc_offs,
			dc_offs = calib.be_ch2_dc_offs)
	CHANNEL_ACTION(channel,
			amp_scale = calib.be_ch1_fs,
			amp_scale = calib.be_ch2_fs)

    getSeqPIDPropertiesAddress(&seqpidCh, channel);
    *pidmin = cmn_CnvCntToV(DAC_RESOLUTION, intExpand(seqpidCh->pid_min, DAC_RESOLUTION), AMPLITUDE_MAX_OUT, false, amp_scale, dc_offs, 0);
	
	return RP_OK;
}

int seqpid_setPIDMax(rp_channel_t channel, float pidmax) {
    volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
	rp_calib_params_t calib = calib_GetParams();
	CHANNEL_ACTION(channel,
			dc_offs = calib.be_ch1_dc_offs,
			dc_offs = calib.be_ch2_dc_offs)
	CHANNEL_ACTION(channel,
			amp_scale = calib.be_ch1_fs,
			amp_scale = calib.be_ch2_fs)
	getSeqPIDPropertiesAddress(&seqpidCh, channel);
	seqpidCh->pid_max = cmn_CnvVToCnt(DAC_RESOLUTION, pidmax, AMPLITUDE_MAX_OUT, false, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_getPIDMax(rp_channel_t channel, float *pidmax) {
    volatile seqpid_control_t *seqpidCh;
    int dc_offs;
    uint32_t amp_scale;

    rp_calib_params_t calib = calib_GetParams();
	CHANNEL_ACTION(channel,
			dc_offs = calib.be_ch1_dc_offs,
			dc_offs = calib.be_ch2_dc_offs)
	CHANNEL_ACTION(channel,
			amp_scale = calib.be_ch1_fs,
			amp_scale = calib.be_ch2_fs)

    getSeqPIDPropertiesAddress(&seqpidCh, channel);
    *pidmax = cmn_CnvCntToV(DAC_RESOLUTION, intExpand(seqpidCh->pid_max, DAC_RESOLUTION), AMPLITUDE_MAX_OUT, false, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_setCountStepLim(rp_channel_t channel, uint16_t value) {
    CHANNEL_ACTION(channel,
            seqpidA->seq_countStepLim = value,
            seqpidB->seq_countStepLim = value)
    return RP_OK;
}

int seqpid_getCountStepLim(rp_channel_t channel, uint16_t *value) {
    CHANNEL_ACTION(channel,
            *value = seqpidA->seq_countStepLim,
            *value = seqpidB->seq_countStepLim)
    return RP_OK;
}

int seqpid_setSyncDelay(rp_channel_t channel, double value) {
    CHANNEL_ACTION(channel,
            seqpidA->seq_syncDelay = (uint32_t)floor(value*DAC_FREQUENCY),
            seqpidB->seq_syncDelay = (uint32_t)floor(value*DAC_FREQUENCY))
    return RP_OK;
}

int seqpid_getSyncDelay(rp_channel_t channel, double *value) {
    CHANNEL_ACTION(channel,
            *value = ((double)(seqpidA->seq_syncDelay))/DAC_FREQUENCY,
            *value = ((double)(seqpidB->seq_syncDelay))/DAC_FREQUENCY)
    return RP_OK;
}

int seqpid_setEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode) {
    CHANNEL_ACTION(channel,
            seqpidA->seq_enforceMode = (uint8_t)enforceMode,
            seqpidB->seq_enforceMode = (uint8_t)enforceMode)
    return RP_OK;
}

int seqpid_getEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode) {
    CHANNEL_ACTION(channel,
            *enforceMode = (rp_seq_enforcemode_t)(seqpidA->seq_enforceMode),
            *enforceMode = (rp_seq_enforcemode_t)(seqpidB->seq_enforceMode))
    return RP_OK;
}

int seqpid_setGenOverwriteEnable(rp_channel_t channel, bool enable) {
    CHANNEL_ACTION(channel,
            seqpidA->seq_out_overwr = enable,
            seqpidB->seq_out_overwr = enable)
    return RP_OK;
}

int seqpid_getGenOverwriteEnable(rp_channel_t channel, bool *enabled) {
    CHANNEL_ACTION(channel,
            *enabled = (bool)(seqpidA->seq_out_overwr),
            *enabled = (bool)(seqpidB->seq_out_overwr))
    return RP_OK;
}

int seqpid_setGenOverwriteValue(rp_channel_t channel, float value, bool pid_on) {

	volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	calibFS_LO = calibFS_LO && pid_on;
	if(pid_on){
		CHANNEL_ACTION(channel,
				dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
				dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
				amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)	
		amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;
	}
	else{
		CHANNEL_ACTION(channel,
				dc_offs = calib.be_ch1_dc_offs ,
				dc_offs = calib.be_ch2_dc_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calib.be_ch1_fs,
				amp_scale = calib.be_ch2_fs)
		amp_Volt = AMPLITUDE_MAX_OUT;

	}

    getSeqPIDPropertiesAddress(&seqpidCh, channel);
    seqpidCh->seq_overwr_val = cmn_CnvVToCnt(DAC_RESOLUTION, value, amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_getGenOverwriteValue(rp_channel_t channel, float *value, bool pid_on) {
    volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	calibFS_LO = calibFS_LO && pid_on;
	if(pid_on){
		CHANNEL_ACTION(channel,
				dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
				dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
				amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)
		amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;

	}
	else{
		CHANNEL_ACTION(channel,
				dc_offs = calib.be_ch1_dc_offs ,
				dc_offs = calib.be_ch2_dc_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calib.be_ch1_fs,
				amp_scale = calib.be_ch2_fs)
		amp_Volt = AMPLITUDE_MAX_OUT;
	}

    getSeqPIDPropertiesAddress(&seqpidCh, channel);
    *value = cmn_CnvCntToV(DAC_RESOLUTION, intExpand(seqpidCh->seq_overwr_val,DAC_RESOLUTION), amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_getInputValue(rp_channel_t channel, float *value) {
    volatile seqpid_control_t *seqpidCh;
    int dc_offs;
    uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	CHANNEL_ACTION(channel,
			dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
			dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
	CHANNEL_ACTION(channel,
			amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
			amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)		
	amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;

    getSeqPIDPropertiesAddress(&seqpidCh, channel);
    *value = cmn_CnvCntToV(DAC_RESOLUTION, intExpand(seqpidCh->in_val,DAC_RESOLUTION), amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);
    return RP_OK;
}

int seqpid_getGenOutputValue(rp_channel_t channel, float *value, bool pid_on) {
    volatile seqpid_control_t *seqpidCh;
	int dc_offs;
	uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	calibFS_LO = calibFS_LO && pid_on;
	if(pid_on){
		CHANNEL_ACTION(channel,
				dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
				dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
				amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)		
		amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;
	}
	else{
		CHANNEL_ACTION(channel,
				dc_offs = calib.be_ch1_dc_offs ,
				dc_offs = calib.be_ch2_dc_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calib.be_ch1_fs,
				amp_scale = calib.be_ch2_fs)
		amp_Volt = AMPLITUDE_MAX_OUT;
	}

	getSeqPIDPropertiesAddress(&seqpidCh, channel);
    *value = cmn_CnvCntToV(DAC_RESOLUTION, intExpand(seqpidCh->seq_out_val,DAC_RESOLUTION), amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);

	return RP_OK;
}

int seqpid_getSeqRunning(rp_channel_t channel, bool *running) {
    CHANNEL_ACTION(channel,
            *running = (bool)(seqpidA->seq_running),
            *running = (bool)(seqpidB->seq_running))
    return RP_OK;
}
	

int seqpid_writeStepData(rp_channel_t channel, uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode) {
    volatile uint32_t *dataOut;
	
	if(length > STEP_MAX_NUM)
		return RP_MOF;
	
    CHANNEL_ACTION(channel,
            dataOut = data_stepA,
            dataOut = data_stepB)

    for(uint16_t i = 0; i < length; i++) {
        dataOut[2*i] = (countBurst[i] & MASK_COUNTBURST) << SHIFT_COUNTBURST;
        dataOut[2*i+1] = ((uint32_t)indexSlice0[i] & MASK_INDEXSLICE0) << SHIFT_INDEXSLICE0 | ((uint32_t)muteMode[i] & MASK_MUTEMODE) << SHIFT_MUTEMODE;
    }
    return RP_OK;
}

int seqpid_readStepData(rp_channel_t channel, uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode) {
    volatile uint32_t *stepData;

	if(length > STEP_MAX_NUM)
		return RP_MOF;

    getStepDataAddress(&stepData, channel);
    for(uint16_t i = 0; i < length; i++) {
	    countBurst[i] = (stepData[2*i] >> SHIFT_COUNTBURST) & MASK_COUNTBURST;
	    indexSlice0[i] = (uint16_t)((stepData[2*i+1] >> SHIFT_INDEXSLICE0) & MASK_INDEXSLICE0);
		muteMode[i] = (rp_seq_pidmutemode_t)((stepData[2*i+1] >> SHIFT_MUTEMODE) & MASK_MUTEMODE);
    }
    return RP_OK;
}

int seqpid_readLastSlice0(rp_channel_t channel, uint16_t *indexSlice0) {
    volatile uint32_t *stepData;
	uint16_t countStepLim;
	seqpid_getCountStepLim(channel, &countStepLim);
	
	if(countStepLim > STEP_MAX_NUM)
		return RP_MOF;
	
    getStepDataAddress(&stepData, channel);
	*indexSlice0 = (uint16_t)((stepData[2*countStepLim+1] >> SHIFT_INDEXSLICE0) & MASK_INDEXSLICE0);
    return RP_OK;
}

int seqpid_writeSliceData(rp_channel_t channel, rp_seq_enforcemode_t enforceMode, uint16_t indexSlice0, rp_seq_pidmutemode_t muteMode, uint16_t length,
						  float *Vstart, float *Vstop, double *duration, bool *pidfreeze) { 
//						  ,int16_t *dacStartQ, int16_t *dacStepQ, uint32_t *timeSliceQ, uint32_t *timeIncrQ, bool *pidfreezeQ) {
    volatile uint32_t *dataOut;
	int16_t dacStart;
	int16_t dacStep;
	uint32_t timeElem = 0;
	uint32_t timeSlice;
	uint32_t timeIncr;
	bool pidOn;
	
	seqpid_getPIDOn(channel, &pidOn);
	CHANNEL_ACTION(channel,
            dataOut = data_sliceA,
            dataOut = data_sliceB)
		
	for(int i = 0; i < length; i++) {
		if(indexSlice0+i > SLICE_MAX_NUM-1)
			return RP_MOF;
		switch(enforceMode){
			case RP_SEQ_ENFORCE_VT:
				seqSliceFloatToInt(channel, Vstart[i], Vstop[i], duration[i]-1/DAC_FREQUENCY, ((pidfreeze[i] && (muteMode == RP_SEQ_PIDMUTE_BYPASS))|| (!pidOn)), &dacStart, &dacStep, &timeSlice, &timeIncr);
				break;
			case RP_SEQ_ENFORCE_TS:
				seqSliceFloatToInt(channel, Vstart[i], Vstop[i], duration[i], ((pidfreeze[i] && (muteMode == RP_SEQ_PIDMUTE_BYPASS)) || (!pidOn)), &dacStart, &dacStep, &timeSlice, &timeIncr);
				--timeSlice;
				break;
			case RP_SEQ_ENFORCE_VS:
				seqSliceFloatToInt(channel, Vstart[i], Vstop[i], duration[i], ((pidfreeze[i] && (muteMode == RP_SEQ_PIDMUTE_BYPASS)) || (!pidOn)), &dacStart,  &dacStep, &timeSlice, &timeIncr);
				break;
		}
		if((i==length-1) && (timeElem + timeSlice < TICKSELEM_MIN)) //the total time in element should be at least TICKSELEM_MIN
		   timeSlice = TICKSELEM_MIN - timeElem;
		
		timeElem += timeSlice;
			

		dataOut[4*(indexSlice0+i)] 		= signedLeftShift((timeSlice & MASK_TIMESLICE_0), SHIFT_TIMESLICE_0)
											| signedLeftShift((timeIncr & MASK_TIMEINCR), SHIFT_TIMEINCR);
		dataOut[4*(indexSlice0+i)+1] 	= signedLeftShift((timeSlice & MASK_TIMESLICE_1), SHIFT_TIMESLICE_1);
		dataOut[4*(indexSlice0+i)+2] 	= signedLeftShift(((uint32_t)dacStep & MASK_DACSTEP_0), SHIFT_DACSTEP_0)
											| signedLeftShift((timeSlice & MASK_TIMESLICE_2), SHIFT_TIMESLICE_2);
		dataOut[4*(indexSlice0+i)+3] 	= signedLeftShift(((uint32_t)(i==(length-1)) & MASK_LASTSLICE), SHIFT_LASTSLICE)
											| signedLeftShift(((uint32_t)pidfreeze[i] & MASK_PIDFREEZE), SHIFT_PIDFREEZE)
											| signedLeftShift(((uint32_t)dacStart & MASK_DACSTART), SHIFT_DACSTART)
											| signedLeftShift(((uint32_t)dacStep & MASK_DACSTEP_1), SHIFT_DACSTEP_1);

	}

	return RP_OK;
}

int seqpid_readSliceData(rp_channel_t channel, rp_seq_enforcemode_t enforceMode, uint16_t indexSlice0, rp_seq_pidmutemode_t muteMode, uint16_t *length,
						 float *Vstart, float *Vstop, double *duration,  bool *pidfreeze){

	volatile uint32_t *sliceData;
	int32_t dacStart;
	int32_t dacStep;
	int32_t dacStop;
	uint32_t timeSlice;
	uint32_t timeIncr;
	bool pidOn;
	
	seqpid_getPIDOn(channel, &pidOn);

    getSliceDataAddress(&sliceData, channel);

	for(uint16_t i = 0; i < SLICE_MAX_NUM-indexSlice0; i++) {
		timeIncr	= (signedLeftShift(sliceData[4*(indexSlice0+i)],-SHIFT_TIMEINCR) & MASK_TIMEINCR)+1;
		timeSlice	= (signedLeftShift(sliceData[4*(indexSlice0+i)+2],-SHIFT_TIMESLICE_2) & MASK_TIMESLICE_2)
						| (signedLeftShift(sliceData[4*(indexSlice0+i)+1],-SHIFT_TIMESLICE_1) & MASK_TIMESLICE_1)
						| (signedLeftShift(sliceData[4*(indexSlice0+i)], -SHIFT_TIMESLICE_0) & MASK_TIMESLICE_0);
		dacStep		= (signedLeftShift(sliceData[4*(indexSlice0+i)+3], -SHIFT_DACSTEP_1) & MASK_DACSTEP_1)
						| (signedLeftShift(sliceData[4*(indexSlice0+i)+2], -SHIFT_DACSTEP_0) & MASK_DACSTEP_0);
		dacStart	= signedLeftShift(sliceData[4*(indexSlice0+i)+3], -SHIFT_DACSTART) & MASK_DACSTART;
		pidfreeze[i]=(bool)(signedLeftShift(sliceData[4*(indexSlice0+i)+3],-SHIFT_PIDFREEZE) & MASK_PIDFREEZE);

		dacStart = intExpand(dacStart, DAC_RESOLUTION);
		if(enforceMode == RP_SEQ_ENFORCE_TS)
			dacStop		= dacStart + intExpand(dacStep, DAC_RESOLUTION+1)*((int32_t)((timeSlice+1)/(timeIncr)));
		else
			dacStop		= dacStart + intExpand(dacStep, DAC_RESOLUTION+1)*((int32_t)(timeSlice/(timeIncr)));			

		int dc_offs;
		uint32_t amp_scale;
		bool calibFS_LO;
		float amp_Volt;
		
		rp_calib_params_t calib = calib_GetParams();
		if((pidfreeze[i] && (muteMode == RP_SEQ_PIDMUTE_BYPASS)) || (!pidOn)) //back-end (DAC) amplitude & offset calibration, used when PID off or (frozen and bypassed)
		{
			dc_offs = channel == RP_CH_1 ? calib.be_ch1_dc_offs: calib.be_ch2_dc_offs;
			amp_scale = channel == RP_CH_1 ? calib.be_ch1_fs: calib.be_ch2_fs;
			calibFS_LO = false;
			amp_Volt = AMPLITUDE_MAX_OUT;

		}
		else //front-end calibration with LV or HV settings, used whe PID enabled
		{
			seqpid_getInputRangeLow(channel, &calibFS_LO);
			CHANNEL_ACTION(channel,
					dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
					dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
			CHANNEL_ACTION(channel,
					amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
					amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)		
			amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;
		}
		
		Vstart[i]	= cmn_CnvCntToV(DAC_RESOLUTION, dacStart, amp_Volt, calibFS_LO, amp_scale,  dc_offs, 0);
		Vstop[i]	= cmn_CnvCntToV(DAC_RESOLUTION, dacStop, amp_Volt, calibFS_LO, amp_scale, dc_offs, 0);

		if(enforceMode == RP_SEQ_ENFORCE_VS)		
			duration[i]= ((double)timeSlice) / DAC_FREQUENCY;
		else
			duration[i]= ((double)(timeSlice+1)) / DAC_FREQUENCY;
		if(signedLeftShift(sliceData[4*(indexSlice0+i)+3],-SHIFT_LASTSLICE) & MASK_LASTSLICE){
			*length = i+1;
			return RP_OK;
		}
	}
//	return RP_EOOR;
	return RP_MOF;

}

int seqpid_readNbSlicesInElement(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length){

	volatile uint32_t *sliceData;
	
    getSliceDataAddress(&sliceData, channel);

	for(uint16_t i = 0; i < SLICE_MAX_NUM-indexSlice0; i++) {
		if(signedLeftShift(sliceData[4*(indexSlice0+i)+3],-SHIFT_LASTSLICE) & MASK_LASTSLICE){
			*length = i+1;
			return RP_OK;
		}
	}
	*length = SLICE_MAX_NUM-indexSlice0;
	return RP_MOF;

}

//PRIVATE DATA FORMATTING FUNCTIONS

/**
 * @brief P/I/D gain=mult*2^(-4*exp): maximize mult and exp for best performance (increased precision)
 */
int pidGainFloatToInt(float gain, int16_t mult_min, int16_t mult_max, uint8_t exp_max, float hard_gain, int16_t *pid_mult, uint8_t *pid_exp){
	uint8_t gain_exp = exp_max;
	gain *= (float) (1 << (4*exp_max))/hard_gain;
	for(uint8_t i = 0; i <= exp_max; i++) {
		if ((gain >= mult_min) && (gain <= mult_max)){
			break;
		}
		gain /= 16;
		gain_exp -= 1;
    }
	if(gain > mult_max)
		gain = mult_max;
	else if(gain < mult_min)
		gain = mult_min;
	*pid_mult = (int16_t) gain;
	*pid_exp = gain_exp;
    return RP_OK;
}


/**
* @brief Formats volts and seconds to integers in a slice of a sequence element
* In a "slice" of an "element" of the sequence, the voltage ramps from Vstart(V) to Vstop(V) in duration(s)
* This function converts volts and seconds to integers and determines best ramp parameters using continuous fraction convergents
 */
int seqSliceFloatToInt(rp_channel_t channel, float Vstart, float Vstop, double duration, bool useOutputCalib, int16_t *dacVstart, int16_t *dacVstep, uint32_t *timeSlice, uint32_t *timeIncr){

    int dc_offs;
	uint32_t amp_scale;
	bool calibFS_LO;
	float amp_Volt;
	
    rp_calib_params_t calib = calib_GetParams();
	seqpid_getInputRangeLow(channel, &calibFS_LO);
	calibFS_LO = calibFS_LO && !(useOutputCalib);
	if(useOutputCalib){
		CHANNEL_ACTION(channel,
				dc_offs = calib.be_ch1_dc_offs ,
				dc_offs = calib.be_ch2_dc_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calib.be_ch1_fs,
				amp_scale = calib.be_ch2_fs)
		amp_Volt = AMPLITUDE_MAX_OUT;
	}
	else{
		CHANNEL_ACTION(channel,
				dc_offs = calibFS_LO ? calib.fe_ch1_lo_offs : calib.fe_ch1_hi_offs ,
				dc_offs = calibFS_LO ? calib.fe_ch2_lo_offs : calib.fe_ch2_hi_offs)
		CHANNEL_ACTION(channel,
				amp_scale = calibFS_LO ? calib.fe_ch1_fs_g_lo : calib.fe_ch1_fs_g_hi,
				amp_scale = calibFS_LO ? calib.fe_ch2_fs_g_lo : calib.fe_ch2_fs_g_hi)		
		amp_Volt = calibFS_LO ? AMPLITUDE_MAX_IN_LO : AMPLITUDE_MAX_IN_HI;
	}
		
	
	int16_t startDACval = (int16_t)(convVToInt32(DAC_RESOLUTION, Vstart, amp_Volt, calibFS_LO, amp_scale, dc_offs, 0));//initial voltage in DAC bits
	int16_t stopDACval  = (int16_t)(convVToInt32(DAC_RESOLUTION, Vstop , amp_Volt, calibFS_LO, amp_scale, dc_offs, 0));//final voltage in DAC bits
	int16_t deltaDACval = stopDACval-startDACval;
	uint32_t durationTicks = (uint32_t)(round(duration * DAC_FREQUENCY));//slice duration in FPGA clock ticks, DAC_FREQUENCY in rp.h

	if(durationTicks<TICKSSLICE_MIN)
		durationTicks = TICKSSLICE_MIN;

	*dacVstart = startDACval;
	*timeSlice = durationTicks;
	int rampDown = 0;//true if negative ramp
	if(deltaDACval < 0){
		rampDown = 1;
		deltaDACval = -deltaDACval;//algorithm simpler for positive slope
	}
	float slope = ((float)(deltaDACval))/((float)(durationTicks));//ideal slope in dimensionless units
	double convNum[RAMP_CAND_MAX];//numerators of convergents, actually integers
	double convDenom[RAMP_CAND_MAX];//denominatirs of convergents, actually integers
	uint32_t timeIncrMax = ((durationTicks < (1 << TIMESTEP_BITS)-1) ? durationTicks : (1 << TIMESTEP_BITS)-1);//maximal time between two increments

	convNum[0]=0;
	convNum[1]=1;
	convDenom[0]=1;
	convDenom[1]=0;

	double r = slope;//internal variable for convergent calculation
	double c;//internal variable for convergent calculation
	int ind = 0;//index of convergent in list
	while((ind < RAMP_CAND_MAX-2 ) && (convNum[ind+1]<=deltaDACval) && (convDenom[ind+1]<=timeIncrMax) && ~isnan(r)) {
		c=floor(r);
		r=1/(r-c);
		convNum[ind+2]	 = c*convNum[ind+1] + convNum[ind];
		convDenom[ind+2] = c*convDenom[ind+1] + convDenom[ind];
		++ind;
	}
	convNum[1]=round(slope*(double)timeIncrMax);//replace 1/0=NaN with "poor man's guess" for slope
	convDenom[1]=round((double)timeIncrMax);

	double dist2 = 4*pow((double)timeIncrMax,2);// norm² between ideal slope and convNum[0]/convDenom[0]=0
	double dist2min = dist2;
	int dist2ind = 0;
	for(int i=1; i<=ind; i++){
		dist2=pow(convDenom[i],2)+pow(1-convNum[i]/(slope*convDenom[i]),2)*(4*pow((double)durationTicks,2)-pow(convDenom[i],2));
		if(dist2 < dist2min){
			dist2min = dist2;
			dist2ind = i;
		}
	}

	*dacVstep = (int16_t)(rampDown ? -convNum[dist2ind] : convNum[dist2ind]);
	*timeIncr = convDenom[dist2ind]-1;//
	
    return RP_OK;
}


/**
 * @brief copy of cmn_CnvVToCnt defined in common.c, which does not alter MSBs of negative numbers
 */
uint32_t convVToInt32(uint32_t field_len, float voltage, float dac_max_v, bool calibFS_LO, uint32_t calib_scale, int calib_dc_off, float user_dc_off)
{
    int dac_cnts = 0;

    if (calib_scale != 0)
        voltage /= (float) cmn_CalibFullScaleToVoltage(calib_scale) / (float)((!calibFS_LO) ? 1.f : (FULL_SCALE_NORM/dac_max_v));

    /* check and limit the specified voltage arguments towards  maximal voltages which can be supplied by DAC outputs */
    if(voltage > dac_max_v)
        voltage = dac_max_v;
    else if(voltage < -dac_max_v)
        voltage = -dac_max_v;

    /* adopt the specified voltage with user defined DC offset */
    voltage -= user_dc_off;

    /* map voltage units into FPGA dac counts */
    dac_cnts = (int)round(voltage * (float) (1 << field_len) / (2 * dac_max_v));

    /* adopt calculated DAC counts with calibration DC offset */
    dac_cnts += calib_dc_off;

    /* check and limit the specified cnt towards maximal cnt which can be supplied by DAC outputs */
    if(dac_cnts > (1 << (field_len - 1)) - 1)
        dac_cnts = (1 << (field_len - 1)) - 1;
    else if(dac_cnts < -(1 << (field_len - 1)))
        dac_cnts = -1 << (field_len - 1);

    return (uint32_t)dac_cnts;
}



/**
 * @brief Signed input "in" defined on "width" lowest bits: replaces others with 1 if negative
 */
int32_t intExpand(int32_t in, int width){
	return (in & (1<<(width-1))) ? (in | ((int32_t)(-1))<< width ) : in;
}

/**
 * @brief Left bit shift of "data" by a signed number of bits "shift"
 */
int32_t signedLeftShift(int32_t data, int shift){
	return (shift<0)? data >> (-shift) : data << shift;
}

