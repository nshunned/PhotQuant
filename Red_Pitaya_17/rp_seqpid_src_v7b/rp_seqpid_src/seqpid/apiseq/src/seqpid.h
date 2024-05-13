/**
 * $Id: $
 *
 * @brief Red Pitaya library SeqPID module interface
 *
 * @Author Alexei
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */
#ifndef __SEQPID_H
#define __SEQPID_H

#include "redpitaya/rpseq.h"

#define AMPLITUDE_MAX_OUT		 1.0 // V
#define AMPLITUDE_MAX_IN_LO		 1.0 // V
#define AMPLITUDE_MAX_IN_HI 	20.0 // V

#define DAC_RESOLUTION   	    14
#define KP_MAX		 		    1023
#define KI_MAX		 		    1023
#define KD_MAX		 		    1023
#define KP_MIN		 		    -1023 //not -1024, to save 1 bit in the product with the error signal
#define KI_MIN		 		    -1023
#define KD_MIN		 		    -1023
#define PSR_MAX		 	        7
#define ISR_MAX		 	        7
#define DSR_MAX		 	        7
#define P_HARD_GAIN	 	        1
#define I_HARD_GAIN	 	        1
#define D_HARD_GAIN	 	        128


#define STEP_MAX_NUM			2048 	//0x00000800
#define PARAM_PER_STEP			3		//{indexSlice0,countBurst,muteMode}
#define SLICE_MAX_NUM			12288	//0x00030000
#define PARAM_PER_SLICE			4		//{Vstart,Vstop,duration, freezePID}
#define RAMP_CAND_MAX			100
#define TIMESTEP_BITS			18
#define TICKSSLICE_MIN			1 //minimal setting for slice time, in clock ticks
#define TICKSELEM_MIN			5 //minimal setting for element time, in clock ticks

// Base Generate addresses
#define SEQPID_BASE_ADDR_A     	0x00200000
#define SEQPID_BASE_ADDR_B     	0x00300000
#define SEQPID_BASE_SIZE	   	0x000B0000 //SLICE_DATA_OFFSET + SLICE_MAX_NUM

#define STEP_DATA_OFFSET		0x00040000
#define SLICE_DATA_OFFSET		0x00080000

//Masks for step data (18-bit-wide BRAM port with PS, 36-bit-wide port with FPGA logic, 2 MSBs free)
//Addr[2*i+0]:
#define MASK_COUNTBURST			0x0003FFFF //18 bits
#define SHIFT_COUNTBURST		0
//Addr[2*i+1]:
#define MASK_INDEXSLICE0		0x00003FFF //14 bits
#define SHIFT_INDEXSLICE0		0
#define MASK_MUTEMODE			0x00000003 //2 bits
#define SHIFT_MUTEMODE			14

//Masks for slice data (20-bit-wide BRAM port with PS, 80-bit-wide port with FPGA logic)
//Addr[4*i+0]:
#define MASK_TIMEINCR			0x0003FFFF //18 bits
#define SHIFT_TIMEINCR			0 //write to dataSlice[17:0] 
#define MASK_TIMESLICE_0		0x00000003 //select timeSlice[1:0]
#define SHIFT_TIMESLICE_0		18 //write to dataSlice[19:18]
//Addr[4*i+1]:
#define MASK_TIMESLICE_1		0x003FFFFC //select timeSlice[21:2]
#define SHIFT_TIMESLICE_1		-2 //write to dataSlice[19:0] 
//Addr[4*i+2]:
#define MASK_TIMESLICE_2		0x7FC00000 //select timeSlice[30:22]
#define SHIFT_TIMESLICE_2		-22 //write to dataSlice[8:0]
#define MASK_DACSTEP_0			0x000007FF //select outStep[10:0]
#define SHIFT_DACSTEP_0			9 //write to dataSlice[19:9]
//Addr[4*i+3]:
#define MASK_DACSTEP_1			0x00007800 //select outStep[14:11]
#define SHIFT_DACSTEP_1			-11 //write to dataSlice[3:0] 
#define MASK_DACSTART			0x00003FFF //14 bits
#define SHIFT_DACSTART			4 //write to dataSlice[17:4]
#define MASK_PIDFREEZE			0x00000001
#define SHIFT_PIDFREEZE			18
#define MASK_LASTSLICE			0x00000001
#define	SHIFT_LASTSLICE			19


typedef struct seqpid_control_s {
//FPGA addr 0x00000
    uint32_t	 offset_adc   		:14;
    uint32_t	 					:2;
    uint32_t	 offset_dac   		:15;
    uint32_t	 					:1;
//FPGA addr 0x00004
    uint32_t	 pid_kp    			:11;
    uint32_t	 pid_PSR       		:3;
    uint32_t	 				  	:2;
    uint32_t	 pid_ki  		 	:11;
    uint32_t	 pid_ISR       		:3;
    uint32_t	 				  	:2;
//FPGA addr 0x00008
    uint32_t	 pid_kd   		 	:11;
    uint32_t	 pid_DSR       		:3;
    uint32_t						:2;
    uint32_t	 pid_cd  	     	:3;
    uint32_t	 pid_off   			:1; 
    uint32_t	 					:4;
//FPGA addr 0x0000C
    uint32_t	 pid_min     		:14;
    uint32_t	 					:2;
    uint32_t	 pid_max     		:14;
    uint32_t	 					:2;
//FPGA addr 0x00010
    uint32_t	 seq_countStepLim	:11;
    uint32_t	 seq_syncDelay		:21;
//FPGA addr 0x00014
    uint32_t	 seq_enforceMode	:2;
    uint32_t	 inputRangeLow		:1;
    uint32_t	 					:13;
    uint32_t	 seq_overwr_val     :14;
    uint32_t	 seq_out_overwr     :1;
    uint32_t	 trig_enable   		:1;
//FPGA addr 0x00018
    uint32_t	 in_val				:14;
    uint32_t	 			     	:2;
    uint32_t	 seq_out_val		:14;
    uint32_t	 seq_running		:1;
    uint32_t	 					:1;
} seqpid_control_t;

int seqpid_Init();
int seqpid_Release();

int seqpid_setInputRangeLow(rp_channel_t channel, bool value);
int seqpid_getInputRangeLow(rp_channel_t channel, bool *value);
int seqpid_getRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq);

int seqpid_setPIDOn(rp_channel_t channel, bool enable);
int seqpid_getPIDOn(rp_channel_t channel, bool *enabled);
int seqpid_setTrigEnabled(rp_channel_t channel, bool enable);
int seqpid_getTrigEnabled(rp_channel_t channel, bool *enabled);
int seqpid_setPIDGainP(rp_channel_t channel, float gain);
int seqpid_getPIDGainP(rp_channel_t channel, float *gain);
int seqpid_setPIDGainI(rp_channel_t channel, float gain);
int seqpid_getPIDGainI(rp_channel_t channel, float *gain);
int seqpid_setPIDGainD(rp_channel_t channel, float gain);
int seqpid_getPIDGainD(rp_channel_t channel, float *gain);
int seqpid_setPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value);
int seqpid_getPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value);
int seqpid_setPIDMin(rp_channel_t channel, float pidmin);
int seqpid_getPIDMin(rp_channel_t channel, float *pidmin);
int seqpid_setPIDMax(rp_channel_t channel, float pidmax);
int seqpid_getPIDMax(rp_channel_t channel, float *pidmax);
int seqpid_setCountStepLim(rp_channel_t channel, uint16_t value);
int seqpid_getCountStepLim(rp_channel_t channel, uint16_t *value);
int seqpid_setSyncDelay(rp_channel_t channel, double value);
int seqpid_getSyncDelay(rp_channel_t channel, double *value);
int seqpid_setEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode);
int seqpid_getEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode);
int seqpid_setGenOverwriteEnable(rp_channel_t channel, bool enable);
int seqpid_getGenOverwriteEnable(rp_channel_t channel, bool *enabled);
int seqpid_setGenOverwriteValue(rp_channel_t channel, float value, bool pid_on);
int seqpid_getGenOverwriteValue(rp_channel_t channel, float *value, bool pid_on);
int seqpid_getInputValue(rp_channel_t channel, float *value);
int seqpid_getGenOutputValue(rp_channel_t channel, float *value, bool pid_on);
int seqpid_getSeqRunning(rp_channel_t channel, bool *running);
int seqpid_writeStepData(rp_channel_t channel, uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);
int seqpid_readStepData(rp_channel_t channel, uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);
int seqpid_readLastSlice0(rp_channel_t channel, uint16_t *indexSlice0);
int seqpid_writeSliceData(rp_channel_t channel, rp_seq_enforcemode_t enforceMode, uint16_t indexSlice0, rp_seq_pidmutemode_t muteMode, uint16_t length,
						  float *Vstart, float *Vstop, double *duration, bool *pidfreeze); 
//						  int16_t *dacStartQ, int16_t *dacStepQ, uint32_t *timeSliceQ, uint32_t *timeIncrQ, bool *pidfreezeQ);
int seqpid_readSliceData(rp_channel_t channel, rp_seq_enforcemode_t enforceMode, uint16_t indexSlice0, rp_seq_pidmutemode_t muteMode, uint16_t *length,
						 float *Vstart, float *Vstop, double *duration, bool *pidfreeze);
int seqpid_readNbSlicesInElement(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length);

int pidGainFloatToInt(float gain, int16_t mult_min, int16_t mult_max, uint8_t exp_max, float hard_gain, int16_t *pid_mult, uint8_t *pid_exp);
int seqSliceFloatToInt(rp_channel_t channel, float Vstart, float Vstop, double duration, bool useOutputCalib, 
					   int16_t *dacVstart, int16_t *dacVstep, uint32_t *timeSlice, uint32_t *timeIncr);
uint32_t convVToInt32(uint32_t field_len, float voltage, float dac_max_v, bool calibFS_LO, uint32_t calib_scale, int calib_dc_off, float user_dc_off);
int32_t intExpand(int32_t in, int width);
int32_t signedLeftShift(int32_t data, int shift);

#endif //__SEQPID_H
