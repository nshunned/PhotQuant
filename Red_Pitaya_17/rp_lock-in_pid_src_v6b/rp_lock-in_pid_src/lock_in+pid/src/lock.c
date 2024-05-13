/**
 * @brief Red Pitaya LOCK Controller
 *
 * @Author Marcelo Luda <marceluda@gmail.com>
 *
 *
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "lock.h"
#include "fpga_lock.h"


#ifndef min
    #define min(a,b) ((a) < (b) ? (a) : (b))
#endif

#ifndef max
    #define max(a,b) ((a) > (b) ? (a) : (b))
#endif


int   save_read_ctrl = -1 ;

/**
 * GENERAL DESCRIPTION:
 *
 * TODO
 *
 */


/*----------------------------------------------------------------------------------*/
/** @brief Initialize LOCK Controller module
 *
 * A function is intended to be called within application initialization. It's purpose
 * is to initialize LOCK Controller module.
 *
 * @retval     -1 failure, error message is reported on standard error
 * @retval      0 successful initialization
 */

int lock_init(void)
{
    if(fpga_lock_init() < 0) {
        return -1;
    }

    return 0;
}


/*----------------------------------------------------------------------------------*/
/** @brief Cleanup LOCK Controller module
 *
 * A function is intended to be called on application's termination. The main purpose
 * of this function is to release allocated resources...
 *
 * @retval      0 success, never fails.
 */
int lock_exit(void)
{
    fpga_lock_exit();

    return 0;
}


/*----------------------------------------------------------------------------------*/
/**
 * @brief Update LOCK Controller module towards actual settings.
 *
 * A function is intended to be called whenever one of the settings is modified
 *
 * @param[in] params  Pointer to overall configuration parameters
 * @retval -1 failure, error message is repoted on standard error device
 * @retval  0 succesful update
 */
int lock_update(rp_app_params_t *params)
{

  // [FPGAUPDATE DOCK]
    g_lock_reg->oscA_sw                   = (int)params[LOCK_OSCA_SW                  ].value;
    g_lock_reg->oscB_sw                   = (int)params[LOCK_OSCB_SW                  ].value;
    g_lock_reg->osc_ctrl                  = (((int)params[LOCK_OSC2_FILT_OFF].value)<<1) + ((int)params[LOCK_OSC1_FILT_OFF].value);
    g_lock_reg->trig_sw                   = (int)params[LOCK_TRIG_SW                  ].value;
    g_lock_reg->mod_period                = (int)params[LOCK_MOD_PERIOD              ].value;
    g_lock_reg->loc_osc_phase             = (int)params[LOCK_LO_PHASE         ].value;
    g_lock_reg->demod_lpf                 = (((int)params[LOCK_DEMOD_LPF_ORD].value)<<3) + ((int)params[LOCK_DEMOD_LPF_TAU].value);
    g_lock_reg->demod_gain                = (int)params[LOCK_DEMOD_GAIN                ].value;
    g_lock_reg->ramp_B_factor             = (int)params[LOCK_RAMP_B_FACTOR            ].value;
    g_lock_reg->ramp_freqexp           	  = (int)params[LOCK_RAMP_FREQEXP             ].value;
    g_lock_reg->error_offset              = (int)params[LOCK_ERROR_OFFSET             ].value;
    g_lock_reg->offset_out_B              = (int)params[LOCK_OFFSET_OUT_B             ].value;
    g_lock_reg->pid_kp                    = (int)params[LOCK_PID_KP                   ].value;
    g_lock_reg->pid_PSR                   = (int)params[LOCK_PID_PSR                  ].value;
    g_lock_reg->pid_off                   = (int)params[LOCK_PID_OFF                  ].value;
    g_lock_reg->error_sw                  = (int)params[LOCK_ERROR_SW                 ].value;
    g_lock_reg->pid_ki                    = (int)params[LOCK_PID_KI                   ].value;
    g_lock_reg->pid_ISR                   = (int)params[LOCK_PID_ISR                  ].value;
    g_lock_reg->pid_kl                    = (int)params[LOCK_PID_KL                   ].value;
    g_lock_reg->pid_LSR                   = (int)params[LOCK_PID_LSR                  ].value;
    g_lock_reg->pid_cl                    = (int)params[LOCK_PID_CL                   ].value;
    g_lock_reg->pid_kf                    = (int)params[LOCK_PID_KF                   ].value;
    g_lock_reg->pid_FSR                   = (int)params[LOCK_PID_FSR                  ].value;
    g_lock_reg->pid_cf                    = (int)params[LOCK_PID_CF                   ].value;
    g_lock_reg->pid_kd                    = (int)params[LOCK_PID_KD                   ].value;
    g_lock_reg->pid_DSR                   = (int)params[LOCK_PID_DSR                  ].value;
    g_lock_reg->pid_cd                    = (int)params[LOCK_PID_CD                   ].value;	
    g_lock_reg->rl_config                 = (((int)params[LOCK_RL_PID_SAT_ENABLE].value) << 3 )+(((int)params[LOCK_RL_SIGNAL_MAX_ENABLE].value) << 2 ) + (((int)params[LOCK_RL_SIGNAL_MIN_ENABLE].value) << 1 ) + ((int)params[LOCK_RL_ERROR_MAX_ENABLE].value);
	g_lock_reg->rl_error_max	          = (int)params[LOCK_RL_ERROR_MAX             ].value;
    g_lock_reg->rl_signal_min	          = (int)params[LOCK_RL_SIGNAL_MIN		      ].value;
    g_lock_reg->rl_signal_max             = (int)params[LOCK_RL_SIGNAL_MAX            ].value;
  // [FPGAUPDATE DOCK END]

    return 0;
}

/**
 * @brief Update LOCK Controller module towards actual settings FROM THE FPGA REGs
 *
 * @param[in] params  Pointer to overall configuration parameters
 * @retval -1 failure, error message is repoted on standard error device
 * @retval  0 succesful update
 */
int lock_update_main(rp_app_params_t *params)
{
    // [PARAMSUPDATE DOCK]
    params[ LOCK_OSCA_SW				].value = (float)g_lock_reg->oscA_sw               ; // lock_oscA_sw
    params[ LOCK_OSCB_SW				].value = (float)g_lock_reg->oscB_sw               ; // lock_oscB_sw
    params[ LOCK_OSC1_FILT_OFF			].value = (float) ((g_lock_reg->osc_ctrl      )& 0x01) ; // lock_osc1_filt_off
    params[ LOCK_OSC2_FILT_OFF			].value = (float) ((g_lock_reg->osc_ctrl >> 1 )& 0x01) ; // lock_osc2_filt_off
    params[ LOCK_TRIG_SW				].value = (float)g_lock_reg->trig_sw               ; // lock_trig_sw
    params[LOCK_MOD_PERIOD				].value = (float)g_lock_reg->mod_period           ; // lock_mod_period
    params[LOCK_LO_PHASE				].value = (float)g_lock_reg->loc_osc_phase      ; // lock_lo_phase
    params[LOCK_DEMOD_LPF_TAU			].value = (float) ((g_lock_reg->demod_lpf      )& 0x07) ; // lock_demod_lpf_tau
    params[LOCK_DEMOD_LPF_ORD			].value = (float) ((g_lock_reg->demod_lpf >> 3 )& 0x03) ; // lock_demod_lpf_ord
    params[LOCK_DEMOD_GAIN				].value = (float)g_lock_reg->demod_gain             ; // lock_demod_gain
    params[LOCK_RAMP_B_FACTOR			].value = (float)g_lock_reg->ramp_B_factor         ; // lock_ramp_B_factor
    params[LOCK_RAMP_FREQEXP			].value = (float)g_lock_reg->ramp_freqexp       ; // lock_freqexp
    params[LOCK_RAMP_ON					].value = (float)g_lock_reg->ramp_on	             ; // lock_ramp_on
    params[LOCK_ERROR_OFFSET			].value = (float)g_lock_reg->error_offset          ; // lock_error_offset
    params[LOCK_OFFSET_OUT_B			].value = (float)g_lock_reg->offset_out_B          ; // lock_offset_out_B
    params[LOCK_PID_KP					].value = (float)g_lock_reg->pid_kp               ; // lock_pid_kp
    params[LOCK_PID_PSR					].value = (float)g_lock_reg->pid_PSR              ; // lock_pid_PSR
    params[LOCK_PID_OFF					].value = (float)g_lock_reg->pid_off               ; // lock_pid_off
    params[LOCK_ERROR_SW				].value = (float)g_lock_reg->error_sw              ; // lock_error_sw
    params[LOCK_PID_KI					].value = (float)g_lock_reg->pid_ki               ; // lock_pid_ki
    params[LOCK_PID_ISR					].value = (float)g_lock_reg->pid_ISR              ; // lock_pid_SAT
    params[LOCK_PID_I_ON				].value = (float)g_lock_reg->pid_i_on              ; // lock_pid_i_on
    params[LOCK_PID_FREEZE				].value = (float)g_lock_reg->pid_freeze           ; // lock_pid_freeze
    params[LOCK_PID_KL					].value = (float)g_lock_reg->pid_kl               ; // lock_pid_kl
    params[LOCK_PID_LSR					].value = (float)g_lock_reg->pid_LSR              ; // lock_pid_ISR
    params[LOCK_PID_CL					].value = (float)g_lock_reg->pid_cl               ; // lock_pid_cl
    params[LOCK_PID_KF					].value = (float)g_lock_reg->pid_kf                ; // lock_pid_kf
    params[LOCK_PID_FSR					].value = (float)g_lock_reg->pid_FSR               ; // lock_pid_FSR
    params[LOCK_PID_CF					].value = (float)g_lock_reg->pid_cf               ; // lock_pid_cf
    params[LOCK_PID_KD					].value = (float)g_lock_reg->pid_kd               ; // lock_pid_kd
    params[LOCK_PID_DSR					].value = (float)g_lock_reg->pid_DSR              ; // lock_pid_DSR
    params[LOCK_PID_CD					].value = (float)g_lock_reg->pid_cd               ; // lock_pid_cd
    params[LOCK_RL_ERROR_MAX_ENABLE		].value = (float) ((g_lock_reg->rl_config      )& 0x01) ; // lock_rl_error_max_enable
    params[LOCK_RL_SIGNAL_MIN_ENABLE	].value = (float) ((g_lock_reg->rl_config >> 1 )& 0x01) ; // lock_rl_signal_min_enable
    params[LOCK_RL_SIGNAL_MAX_ENABLE	].value = (float) ((g_lock_reg->rl_config >> 2 )& 0x01) ; // lock_rl_signal_max_enable
    params[LOCK_RL_PID_SAT_ENABLE		].value = (float) ((g_lock_reg->rl_config >> 3 )& 0x01) ; // lock_rl_pid_sat_enable (was "lock_sf_start")
    params[LOCK_RL_UNLOCKED				].value = (float)g_lock_reg->rl_unlocked           ; // lock_rl_unlocked
	params[ LOCK_RL_ERROR_MAX			].value = (float)g_lock_reg->rl_error_max    		 ; // lock_rl_error_max
    params[LOCK_RL_SIGNAL_MIN			].value = (float)g_lock_reg->rl_signal_min   		 ; // lock_rl_signal_min
    params[LOCK_RL_SIGNAL_MAX			].value = (float)g_lock_reg->rl_signal_max         ; // lock_rl_signal_max
    params[LOCK_ERROR_MEAN				].value = (float)g_lock_reg->error_mean			 ; // lock_error_mean
    params[LOCK_ERROR_STD				].value = ((float)g_lock_reg->error_var <0 ? -1 : sqrt((float)g_lock_reg->error_var)) ; // lock_error_std
    params[LOCK_RAMP_OFFSET				].value = (float)g_lock_reg->ramp_offset          ; // lock_ramp_offset
    params[LOCK_RAMP_AMPL				].value = (float)g_lock_reg->ramp_ampl	          ; // lock_ramp_ampl
    params[LOCK_RAMP_OFFSET_STEP		].value = (float)g_lock_reg->ramp_offs_step        ; // lock_ramp_offset_step
    params[LOCK_RAMP_AMPL_STEP			].value = (float)g_lock_reg->ramp_ampl_step        ; // lock_ramp_ampl_step
//    params[LOCK_I_OUT					].value = (float)g_lock_reg->i_out			        ; // lock_i_out
    // [PARAMSUPDATE DOCK END]

    return 0;
}
