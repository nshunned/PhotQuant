/**
 * $Id: main.h 881 2013-12-16 05:37:34Z rp_jmenart $
 *
 * @brief Red Pitaya Oscilloscope main module.
 *
 * @Author Jure Menart <juremenart@gmail.com>, rewritten by Alexei Ourjoumtsev
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#ifndef __MAIN_H
#define __MAIN_H

// #define DEBUG 1


#ifdef DEBUG
#  define TRACE(args...) fprintf(stderr, args)
#else
#  define TRACE(args...) {}
#endif

/* Parameters description structure - must be the same for all RP controllers */
typedef struct rp_app_params_s {
    char  *name;
    float  value;
    int    fpga_update;
    int    read_only;
    float  min_val;
    float  max_val;
} rp_app_params_t;

/* Signal measurement results structure - filled in worker and updated when
 * also measurement signal is stored from worker
 */
typedef struct rp_osc_meas_res_s {
    float min;
    float max;
    float amp;
    float avg;
    float std;
    float freq;
    float period;
} rp_osc_meas_res_t;

/* Parameters indexes - these defines should be in the same order as
 * rp_app_params_t structure defined in main.c */
//#define PARAMS_NUM        93
#define PARAMS_NUM        92
#define MIN_GUI_PARAM     0
#define MAX_GUI_PARAM     1
#define TRIG_MODE_PARAM   2
#define TRIG_SRC_PARAM    3
#define TRIG_EDGE_PARAM   4
#define TRIG_DLY_PARAM    5
#define TRIG_LEVEL_PARAM  6
#define SINGLE_BUT_PARAM  7
#define TIME_RANGE_PARAM  8
#define TIME_UNIT_PARAM   9
#define EN_AVG_AT_DEC     10
#define AUTO_FLAG_PARAM   11
#define MIN_Y_PARAM       12
#define MAX_Y_PARAM       13
#define FORCEX_FLAG_PARAM 14
#define MEAS_MIN_CH1      15
#define MEAS_MAX_CH1      16
#define MEAS_AMP_CH1      17
#define MEAS_AVG_CH1      18
#define MEAS_FREQ_CH1     19
#define MEAS_PER_CH1      20
#define MEAS_MIN_CH2      21
#define MEAS_MAX_CH2      22
#define MEAS_AMP_CH2      23
#define MEAS_AVG_CH2      24
#define MEAS_FREQ_CH2     25
#define MEAS_PER_CH2      26
#define PRB_ATT_CH1       27
#define GAIN_CH1          28
#define PRB_ATT_CH2       29
#define GAIN_CH2          30
#define GUI_RST_Y_RANGE   31
#define GEN_DC_OFFS_1     32
#define GEN_DC_OFFS_2     33
#define GUI_XMIN          34
#define GUI_XMAX          35
#define MIN_Y_NORM        36
#define MAX_Y_NORM        37
#define GEN_DC_NORM_1     38
#define GEN_DC_NORM_2     39
#define SCALE_CH1         40
#define SCALE_CH2         41
#define MEAS_STD_CH1      42
#define MEAS_STD_CH2      43

// [MAINDEFH DOCK]

#define LOCK_OSCA_SW                    44
#define LOCK_OSCB_SW                    45
#define LOCK_OSC1_FILT_OFF              46
#define LOCK_OSC2_FILT_OFF              47
#define LOCK_OSC_RAW_MODE               48
#define LOCK_OSC_LOCKIN_MODE            49
#define LOCK_TRIG_SW                    50
#define LOCK_MOD_PERIOD                 51
#define LOCK_LO_PHASE		            52
#define LOCK_DEMOD_LPF_TAU              53
#define LOCK_DEMOD_LPF_ORD              54
#define LOCK_DEMOD_GAIN                 55
#define LOCK_RAMP_B_FACTOR              56
#define LOCK_RAMP_FREQEXP		        57
#define LOCK_RAMP_ON 	                58
#define LOCK_ERROR_OFFSET               59
#define LOCK_OFFSET_OUT_B               60
#define LOCK_PID_KP                     61
#define LOCK_PID_PSR                    62
#define LOCK_PID_OFF                    63
#define LOCK_ERROR_SW                   64
#define LOCK_PID_KI                     65
#define LOCK_PID_ISR                    66
#define LOCK_PID_I_ON                   67
#define LOCK_PID_FREEZE                 68
#define LOCK_PID_KL                     69
#define LOCK_PID_LSR                    70
#define LOCK_PID_CL                     71
#define LOCK_PID_KF	                    72
#define LOCK_PID_FSR                    73
#define LOCK_PID_CF                     74
#define LOCK_PID_KD                     75
#define LOCK_PID_DSR                    76
#define LOCK_PID_CD                     77
#define LOCK_RL_ERROR_MAX_ENABLE        78
#define LOCK_RL_SIGNAL_MIN_ENABLE       79
#define LOCK_RL_SIGNAL_MAX_ENABLE       80
#define LOCK_RL_PID_SAT_ENABLE          81
#define LOCK_RL_UNLOCKED                82
#define LOCK_RL_ERROR_MAX	            83
#define LOCK_RL_SIGNAL_MIN		        84
#define LOCK_RL_SIGNAL_MAX              85
#define LOCK_ERROR_MEAN                 86
#define LOCK_ERROR_STD                  87
#define LOCK_RAMP_OFFSET                88
#define LOCK_RAMP_AMPL	                89
#define LOCK_RAMP_OFFSET_STEP           90
#define LOCK_RAMP_AMPL_STEP             91
//#define LOCK_I_OUT			            92

// [MAINDEFH DOCK END]



/* Defines from which parameters on are LOCK parameters (used in set_param() to
 * trigger update only on needed part - either Oscilloscope, AWG or PID */
#define PARAMS_LOCK_PARAMS 44



/* Output signals */
#define SIGNAL_LENGTH (1024) /* Must be 2^n! */
#define SIGNALS_NUM   3


/* module entry points */
int rp_app_init(void);
int rp_app_exit(void);
int rp_set_params(rp_app_params_t *p, int len);
int rp_get_params(rp_app_params_t **p);
int rp_get_signals(float ***s, int *sig_num, int *sig_len);

/* Internal helper functions */
int  rp_create_signals(float ***a_signals);
void rp_cleanup_signals(float ***a_signals);

/* copies parameters from src to dst - if dst does not exists, it creates it */
int rp_copy_params(rp_app_params_t *src, rp_app_params_t **dst);

/* cleans up memory of parameters structure */
int rp_clean_params(rp_app_params_t *params);

/* Updates all parameters (structure must be aligned with main parameter
 * structure - this includes also ready-only parameters. After the
* parameters are updated it also changed the worker state machine.
 */
int rp_update_main_params(rp_app_params_t *params);
void get_scales(rp_app_params_t *p, float *scale1, float *scale2, float *maxv);
void transform_to_iface_units(rp_app_params_t *p);
void transform_from_iface_units(rp_app_params_t *p);

/* sets the measurement data to output parameters structure - these parameters
 * are read-only for the client and there is no need to update them internally
 * in the application
 */
int rp_update_meas_data(rp_osc_meas_res_t ch1_meas, rp_osc_meas_res_t ch2_meas);


#endif /*  __MAIN_H */
