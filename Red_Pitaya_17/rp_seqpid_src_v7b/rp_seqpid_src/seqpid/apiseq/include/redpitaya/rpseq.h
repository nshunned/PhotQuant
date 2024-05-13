/**
 * $Id: $
 *
 * @file rp.h
 * @brief Red Pitaya library API interface
 *
 * @Author Red Pitaya
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#ifndef __RP_H
#define __RP_H

#ifdef __cplusplus
extern "C" {
#endif


#include <stdint.h>
#include <stdbool.h>

#ifdef Z20_250_12
#define RP_MODEL "Z20_250_12"
#define ADC_SAMPLE_RATE 250e6
#define ADC_BITS 14
#define ADC_BITS_MASK 0x3FFF
#define DAC_FREQUENCY 250e6
#endif

#ifdef Z10
#define RP_MODEL "Z10"
#define ADC_SAMPLE_RATE 125e6
#define ADC_BITS 14
#define ADC_BITS_MASK 0x3FFF
#define DAC_FREQUENCY 125e6
#endif

#ifdef Z20
#define RP_MODEL "Z20"
#define ADC_SAMPLE_RATE 122.880e6
#define ADC_BITS 16
#define ADC_BITS_MASK 0x3FFF
#define DAC_FREQUENCY 122.880e6
#endif

#define ADC_BUFFER_SIZE             (16*1024)

/** @name Error codes
 *  Various error codes returned by the API.
 */
///@{

/** Success */
#define RP_OK     0
/** Failed to Open EEPROM Device */
#define RP_EOED   1
/** Failed to Open Memory Device */
#define RP_EOMD   2
/** Failed to Close Memory Device*/
#define RP_ECMD   3
/** Failed to Map Memory Device */
#define RP_EMMD   4
/** Failed to Unmap Memory Device */
#define RP_EUMD   5
/** Value Out Of Range */
#define RP_EOOR   6
/** LED Input Direction is not valid */
#define RP_ELID   7
/** Modifying Read Only field */
#define RP_EMRO   8
/** Writing to Input Pin is not valid */
#define RP_EWIP   9
/** Invalid Pin number */
#define RP_EPN    10
/** Uninitialized Input Argument */
#define RP_UIA    11
/** Failed to Find Calibration Parameters */
#define RP_FCA    12
/** Failed to Read Calibration Parameters */
#define RP_RCA    13
/** Buffer too small */
#define RP_BTS    14
/** Invalid parameter value */
#define RP_EIPV   15
/** Unsupported Feature */
#define RP_EUF    16
/** Data not normalized */
#define RP_ENN    17
/** Failed to open bus */
#define RP_EFOB   18
/** Failed to close bus */
#define RP_EFCB   19
/** Failed to acquire bus access */
#define RP_EABA   20
/** Failed to read from the bus */
#define RP_EFRB   21
/** Failed to write to the bus */
#define RP_EFWB   22
/** Extension module not connected */
#define RP_EMNC   23
/** Command not supported */
#define RP_NOTS   24
/** Memory overflow (SeqPID) */
#define RP_MOF   25
/** Memory data mismatch (SeqPID) */
#define RP_MDM    26
/** Generator busy (SeqPID) */
#define RP_GEB    27
	
#define SPECTR_OUT_SIG_LEN (2*1024)

///@}


/**
 * Type representing Input/Output channels.
 */
typedef enum {
    RP_CH_1, //!< Channel A
    RP_CH_2  //!< Channel B
} rp_channel_t;


/**
 * Calibration parameters, stored in the EEPROM device
 */
typedef struct {
    uint32_t fe_ch1_fs_g_hi; //!< High gain front end full scale voltage, channel A
    uint32_t fe_ch2_fs_g_hi; //!< High gain front end full scale voltage, channel B
    uint32_t fe_ch1_fs_g_lo; //!< Low gain front end full scale voltage, channel A
    uint32_t fe_ch2_fs_g_lo; //!< Low gain front end full scale voltage, channel B
    int32_t  fe_ch1_lo_offs; //!< Front end DC offset, channel A
    int32_t  fe_ch2_lo_offs; //!< Front end DC offset, channel B
    uint32_t be_ch1_fs;      //!< Back end full scale voltage, channel A
    uint32_t be_ch2_fs;      //!< Back end full scale voltage, channel B
    int32_t  be_ch1_dc_offs; //!< Back end DC offset, channel A
    int32_t  be_ch2_dc_offs; //!< Back end DC offset, on channel B
	uint32_t magic;			 //!
    int32_t  fe_ch1_hi_offs; //!< Front end DC offset, channel A
    int32_t  fe_ch2_hi_offs; //!< Front end DC offset, channel B
} rp_calib_params_t;

	
/**
 * Type representing SeqPID sequence generator actions
 */
typedef enum {
    RP_SEQ_IDLE, //!< Sequence idle
    RP_SEQ_INIT,  //!< Initialize sequence
    RP_SEQ_STOP,  //!< Interrupt sequence
    RP_SEQ_RUN  //!< Start sequence
} rp_seq_action_t;
	
/**
 * SeqPID differentiator gain cutoff frequency
 */
typedef enum {
    RP_SEQ_DFLIM_5M,
    RP_SEQ_DFLIM_2M5,
    RP_SEQ_DFLIM_1M2,
    RP_SEQ_DFLIM_620k,
    RP_SEQ_DFLIM_310k,
    RP_SEQ_DFLIM_160k,
    RP_SEQ_DFLIM_78k,
    RP_SEQ_DFLIM_39k
} rp_seq_difffreqlim_t;
	
/**
 * SeqPID generator parameter enforce mode
 */
typedef enum {
    RP_SEQ_ENFORCE_VT,//enforce voltage and duration
    RP_SEQ_ENFORCE_TS,//enforce duration and slope
    RP_SEQ_ENFORCE_VS//enforce voltage and slope
} rp_seq_enforcemode_t;
	
/**
 * SeqPID PID mute mode (selects output voltage when PID frozen)
 */
typedef enum {
    RP_SEQ_PIDMUTE_FREEZE,//output from frozen PID output
    RP_SEQ_PIDMUTE_BYPASS,//output from generator
    RP_SEQ_PIDMUTE_SCALE//output from scaler (generator*(frozen PID)/(generator when PID froze))
} rp_seq_pidmutemode_t;	
	
/** @name General
 */
///@{


/**
 * Initializes the library. It must be called first, before any other library method.
 * @return If the function is successful, the return value is RP_OK.
 * If the function is unsuccessful, the return value is any of RP_E* values that indicate an error.
 */
int rp_Init();

int rp_CalibInit();

/**
 * Releases the library resources. It must be called last, after library is not used anymore. Typically before
 * application exits.
 * @return If the function is successful, the return value is RP_OK.
 * If the function is unsuccessful, the return value is any of RP_E* values that indicate an error.
 */
int rp_Release();

/**
* Resets all modules. Typically calles after rp_Init()
* application exits.
* @return If the function is successful, the return value is RP_OK.
* If the function is unsuccessful, the return value is any of RP_E* values that indicate an error.
*/
int rp_Reset();

/**
 * Retrieves the library version number
 * @return Library version
 */
const char* rp_GetVersion();

/**
 * Returns textual representation of error code.
 * @param errorCode Error code returned from API.
 * @return Textual representation of error given error code.
 */
const char* rp_GetError(int errorCode);


///@}
/** @name Calibrate
*/
///@{

/**
* Returns calibration settings.
* These calibration settings are populated only once from EEPROM at rp_Init().
* Each rp_GetCalibrationSettings call returns the same cached setting values.
* @return Calibration settings
*/
rp_calib_params_t rp_GetCalibrationSettings();


/** @name Identification
 */
///@{

/**
* Gets FPGA Synthesized ID
*/
//int rp_IdGetID(uint32_t *id);

/**
* Gets FPGA Unique DNA
*/
//int rp_IdGetDNA(uint64_t *dna);

///@}



///@}
/** @name Sequence+PID
*/
///@{
	
/**
* Sets generate to default values.
* @param channel Channel A or B
*/
int rp_seqReset(rp_channel_t channel);

/**
* Sets sequence generator action
* @param value Action {Idle,Initialize,Interrupt,Run}
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetAction(rp_seq_action_t action);
	
/**
* Sets sequence generator action to idle
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetActionIdle();

/**
* Triggers an initialization of the sequence
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetActionInit();

/**
* Makes the sequence stop and return to idle
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetActionStop();

/**
* Triggers the start of the sequence
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetActionRun();

/**
* Returns sequence generator action
* @param value Action {Idle,Initialize,Interrupt,Run}
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetAction(rp_seq_action_t *action);

/**
* Enable output of sequence trigger on BNC
* @param enable if true, trigger is sent to BNC
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetTrigOutEnab(bool enable);

/**
* Checks if sequence trigger is sent to BNC output
* @param enabled true if output is active
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetTrigOutEnab(bool *enabled);

/**
* Enable output of 40MHz clock BNC
* @param enable if true, clock is sent to BNC
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetClkOutEnab(bool enable);

/**
* Checks if 40MHz clock is sent to BNC output
* @param enabled true if output is active
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetClkOutEnab(bool *enabled);
	
/**
* Checks if an external clock is present and locked
* @param enabled true if external clock is present and locked
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetClkExtUse(bool *enabled);

	
/**
* Returns hard-coded ranges and rates from api and EEPROM
* @param channel Channel A or B
* @param minIn minimal voltage at ADC input (V)
* @param maxIn maximal voltage at ADC input (V)
* @param minOut minimal voltage at DAC output (V)
* @param maxOut maximal voltage at DAC output (V)
* @param clkFreq FPGA clock frequency (Hz)
* @return If the function is successful, the return value is RP_OK.
*/	
int rp_seqGetRanges(rp_channel_t channel, float *minIn, float *maxIn,  float *minOut, float *maxOut, float *clkFreq);

/**
* Sets input range to low or high (must match jumpers on board!)
* @param channel Channel A or B
* @param value low (2Vpp) if true, high (40Vpp) if false
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetInputRangeLow(rp_channel_t channel, bool value);

/**
* Returns input range, low or high (must match jumpers on board!)
* @param channel Channel A or B
* @param value low (2Vpp) if true, high (40Vpp) if false
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetInputRangeLow(rp_channel_t channel, bool *value);

/**
* Enables PID (sequence generator output = PID setpoint) or bypasses it (sequence generator output = channel output)
* @param channel Channel A or B
* @param enable PID enabled if true, bypassed if false
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDEnabled(rp_channel_t channel, bool enable);
	
/**
* Returns PID state : enabled (sequence generator output = PID setpoint) or bypassed (sequence generator output = channel output)
* @param channel Channel A or B
* @param enabled  PID enabled if true, bypassed if false
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDEnabled(rp_channel_t channel, bool *enable);

/**
* Enables sequence generator (when disabled, triggers to this channel are ignored)
* @param channel Channel A or B
* @param enable Sequence trigger enabled if true
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetTrigEnabled(rp_channel_t channel, bool enable);
	
/**
* Returns PID state : enabled (sequence generator output = PID setpoint) or bypassed (sequence generator output = channel output)
* @param channel Channel A or B
* @param enabled  PID enabled if true, bypassed if false
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetTrigEnabled(rp_channel_t channel, bool *enable);

/**
* Sets PID Proportional gain
* @param channel Channel A or B
* @param gain Proportional gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDGainP(rp_channel_t channel, float gain);

/**
* Returns PID Proportional gain
* @param channel Channel A or B
* @param gain Proportional gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDGainP(rp_channel_t channel, float *gain);

/**
* Sets PID Integrator gain
* @param channel Channel A or B
* @param gain Integrator gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDGainI(rp_channel_t channel, float gain);

/**
* Returns PID Integrator gain
* @param channel Channel A or B
* @param gain Integrator gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDGainI(rp_channel_t channel, float *gain);

/**
* Sets PID Differentiator gain
* @param channel Channel A or B
* @param gain Differentiator gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDGainD(rp_channel_t channel, float gain);

/**
* Returns PID Differentiator gain
* @param channel Channel A or B
* @param gain Differentiator gain
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDGainD(rp_channel_t channel, float *gain);

/**
* Sets PID Differentiator frequency cutoff
* @param channel Channel A or B
* @param value Differentiator frequency cutoff (value in [0:15], cutoff in 125MHz/2^(value+3)=[16MHz:0.5kHz])
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t value);

/**
* Returns PID Differentiator frequency cutoff
* @param channel Channel A or B
* @param value Differentiator frequency cutoff (value in [0:15], cutoff in 125MHz/2^(value+3)=[16MHz:0.5kHz])
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDFreqLimD(rp_channel_t channel, rp_seq_difffreqlim_t *value);

/**
* Sets PID output minimum voltage
* @param channel Channel A or B
* @param pidmin PID output minimum voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDMin(rp_channel_t channel, float pidmin);

/**
* Returns PID output minimum voltage
* @param channel Channel A or B
* @param pidmin PID output minimum voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDMin(rp_channel_t channel, float *pidmin);

/**
* Sets PID output maximum voltage
* @param channel Channel A or B
* @param pidmin PID output maximum voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetPIDMax(rp_channel_t channel, float pidmax);

/**
* Returns PID output maximum voltage
* @param channel Channel A or B
* @param pidmin PID output maximum voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetPIDMax(rp_channel_t channel, float *pidmax);


/**
* Sets sequence generator initial delay for synchronization with other hardware, in seconds
* @param channel Channel A or B
* @param value Delay (in seconds, >=0)
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetSyncDelay(rp_channel_t channel, double value);

/**
* Returns sequence generator initial delay for synchronization with other hardware, in seconds
* @param channel Channel A or B
* @param value Delay (in seconds, >=0)
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetSyncDelay(rp_channel_t channel, double *value);

/**
* Overwrites sequence generator output voltage if sequence is not running
* @param channel Channel A or B
* @param value Output voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetGenOverwriteValue(rp_channel_t channel, float value);
	
/**
* Reads current value of sequence generator output
* @param channel Channel A or B
* @param value Output voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetGenOverwriteValue(rp_channel_t channel, float *value);


/**
* Reads current value of sequence generator output
* @param channel Channel A or B
* @param value Output voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetInputValue(rp_channel_t channel, float *value);
	
/**
* Reads current value of sequence generator output
* @param channel Channel A or B
* @param value Output voltage
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetGenOutputValue(rp_channel_t channel, float *value);

	
/**
* Checks if sequence is running on given channel
* @param channel Channel A or B
* @param running true if sequence running
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetRunning(rp_channel_t channel, bool *running);

/**
* The following functions handle the data used by the sequence generator.
*
* The sequence generator is given a list of pulse shapes (Elements) that it can execute in bursts, in random order.
* These Elements are made of Slices where the output evolves linearly with time.
* Data describing all Elements is concatenated in elementRAM.
* The beginning of an Element is identified by the index (elementRAM address) of its first slice, indexSlice0
* The end of an Element is identified by an "end of element" flag on its last slice, inserted by the api.
* Data describng the order in which these elements should be executed and the number of times
*	each one should be repeated in a burst is saved in stepRAM as a list of {indexSlice0,countBurst}
*
* The user describes an element as a list of slices {Vstart,Vstop,duration,pidfreeze},
* but the transition from one slice to the next one takes 1 (not 0) clock cycle.
* enforceMode is here to specify 2 out of 3 parameters (final voltage, slope, duration) that need to be enforced
*/

/**
* Write a list of {indexSlice0,countBurst} to stepRAM
* @param channel Channel A or B
* @param length total number of steps
* @param countBurst [length] number of repetitions (>=0) of an element in a burst
* @param indexSlice0 [length] index of the first slice of the Element in an ordered concatenated list of slices for all elements
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqWriteStepsBySlice(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);

/**
* Read a list of {indexSlice0,countBurst} from stepRAM
* @param channel Channel A or B
* @param length total number of steps
* @param countBurst [length] number of repetitions (>=0) of an element in a burst
* @param indexSlice0 [length] index of the first slice of the Element in an ordered concatenated list of slices for all elements
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqReadStepsBySlice(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexSlice0, rp_seq_pidmutemode_t *muteMode);

/**
* Write a list of {indexSlice0,countBurst} to stepRAM, where indexSlice0 is determined from indexStep
* Use this function only after all the Elements have been written
* @param channel Channel A or B
* @param length total number of steps
* @param countBurst [length] number of repetitions (>=0) of an element in a burst
* @param indexStep [length] index of the Element to be executed
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqWriteStepsByIndex(rp_channel_t channel,  uint16_t length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode);

/**
* Read a list of {indexSlice0,countBurst} from stepRAM, convert indexSlice0 to indexStep
* Use this function only after all the Elements have been written
* @param channel Channel A or B
* @param length total number of steps
* @param countBurst [length] number of repetitions (>=0) of an element in a burst
* @param indexStep [length] index of the Element to be executed
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqReadStepsByIndex(rp_channel_t channel, uint16_t *length, uint32_t *countBurst, uint16_t *indexStep, rp_seq_pidmutemode_t *muteMode);

/**
* Write a list of slices corresponding to the next element to elementRAM
* Use this function only after Element counters have been initialized
* @param channel Channel A or B
* @param muteMode when PID frozen, selects whether the signal to DAC shoud be the output of the frozen PID, that of the generator, or that of the scaler (generator*(frozen PID)/(generator when PID froze))
* @param length total number of slices
* @param Vstart [length] initial voltage in the slice, in volts
* @param Vstop [length] final voltage in the slice, in volts
* @param duration [length] duration of the slice, in seconds
* @param pidfreeze [length] if true, PID frozen and bypassed during the slice, sequence generator sent to DAC output directly
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqWriteElement(rp_channel_t channel, rp_seq_pidmutemode_t muteMode, uint16_t length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze); 
//						  int16_t *dacStartQ, int16_t *dacStepQ, uint32_t *timeSliceQ, uint32_t *timeIncrQ, bool *pidfreezeQ);

/**
* Read a list of slices corresponding to the next element from elementRAM
* @param channel Channel A or B
* @param indexSlice0 index (address) of the first slice of the element in a ordered concatenated list of slices for all elements
* @param length total number of slices in this element
* @param Vstart [length] initial voltage in the slice, in volts
* @param Vstop [length] final voltage in the slice, in volts
* @param duration [length] duration of the slice, in seconds
* @param pidfreeze [length] if true, PID frozen and bypassed during the slice, sequence generator sent to DAC output directly
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqReadElementBySlice(rp_channel_t channel, uint16_t indexSlice0, uint16_t *length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze);

/**
* Read a list of slices corresponding to the next element from elementRAM
* @param channel Channel A or B
* @param indexElement index if the Element, will be converted to indexSlice0 by the api
* @param length total number of slices in this element
* @param Vstart [length] initial voltage in the slice, in volts
* @param Vstop [length] final voltage in the slice, in volts
* @param duration [length] duration of the slice, in seconds
* @param pidfreeze [length] if true, PID frozen and bypassed during the slice, sequence generator sent to DAC output directly
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqReadElementByIndex(rp_channel_t channel, uint16_t indexElement, uint16_t *length, float *Vstart, float *Vstop, double *duration, bool *pidfreeze);

/**
* Initialize Element counters and lists of {indexSlice0}
* @param channel Channel A or B
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqInitElementsCounter(rp_channel_t channel);

/**
* Return Element counter and list of {indexSlice0}
* @param channel Channel A or B
* @param numElements number of different elements defined
* @param listSlice0 list of the indexes of their first slices, concatenated in elementRAM
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetListSlice0(rp_channel_t channel, uint16_t *numElements, uint16_t *listSlice0);

/**
* Sets the enforced parameters for the waveform generation
* @param channel Channel A or B
* @param enforceMode Enforced parameters {Final voltage & Slope, final voltage & duration, Duration & Slope}
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqSetEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t enforceMode);

/**
* Returns the enforced parameters for the waveform generation
* @param channel Channel A or B
* @param enforceMode Enforced parameters {Final voltage & Slope, final voltage & duration, Duration & Slope}
* @return If the function is successful, the return value is RP_OK.
*/
int rp_seqGetEnforceMode(rp_channel_t channel, rp_seq_enforcemode_t *enforceMode);

	
///@}
/** @name Common
*/
///@{

float rp_CmnCnvCntToV(uint32_t field_len, uint32_t cnts, float adc_max_v, bool calibFS_LO, uint32_t calibScale, int calib_dc_off, float user_dc_off);

#ifdef __cplusplus
}
#endif

#endif //__RP_H
