/**
 * @brief Red Pitaya LOCK FPGA controller.
 *
 * @Author Marcelo Luda <marceluda@gmail.com>
 *
 *
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#ifndef _FPGA_LOCK_H_
#define _FPGA_LOCK_H_

#include <stdint.h>

/** @defgroup fpga_lock_h LOCK Controller
 * @{
 */

/** Base LOCK FPGA address */
#define LOCK_BASE_ADDR 0x40200000
/** Base LOCK FPGA core size */
#define LOCK_BASE_SIZE 0x000000A4

/** @brief LOCK FPGA registry structure.
 *
 * This structure is direct image of physical FPGA memory. When accessing it all
 * reads/writes are performed directly from/to FPGA LOCK registers.
 */
// [FPGAREG DOCK]
typedef struct lock_reg_t {

    /** @brief Offset 20'h00000 - oscA_sw
      *  switch for signal to scope channel 1
      *
      *  bits [31: 2] - Reserved
      *  bits [ 1: 0] - Data
      */
    uint32_t oscA_sw;
    
    /** @brief Offset 20'h00004 - oscB_sw
      *  switch for signal to scope channel 2
      *
      *  bits [31: 2] - Reserved
      *  bits [ 1: 0] - Data
      */
    uint32_t oscB_sw;
    
    /** @brief Offset 20'h00008 - osc_ctrl
      *  oscilloscope filter control
      *  [osc2_filt_off,osc1_filt_off]
      *
      *  bits [31: 2] - Reserved
      *  bits [ 1: 0] - Data
      */
    uint32_t osc_ctrl;
    
    /** @brief Offset 20'h0000C - trig_sw
      *  Select the trigger signal (1=demodulator, 0=ramp)
      *
      *  bits [31: 1] - Reserved
      *  bit [0] - Data
      */
    uint32_t trig_sw;
    
    /** @brief Offset 20'h00010 - mod_period
      *  square modulation half-period
      *
      *  bits [31: 7] - Reserved
      *  bits [ 6: 0] - Data
      */
    uint32_t mod_period;
    
    /** @brief Offset 20'h00014 - loc_osc_phase
      *  local oscillator phase relative to square modulation
      *
      *  bits [31: 8] - Reserved
      *  bits [ 7: 0] - Data
      */
    uint32_t loc_osc_phase;
    
    /** @brief Offset 20'h00018 - demod_lpf
      *  demodulator low-pass filter
      *
      *  bits [31: 5] - Reserved
      *  bit  [    4] - filter 2 on
      *  bit  [    3] - filter 1 on
      *  bits [ 2: 0] - time constant
      */
    uint32_t demod_lpf;
    
    /** @brief Offset 20'h0001C - demod_gain
      *  demodulation gain = 2^(9-demod_gain)
      *
      *  bits [31: 4] - Reserved
      *  bits [ 3: 0] - Data
      */
    uint32_t demod_gain;
    
    /** @brief Offset 20'h00020 - ramp_B_factor
      *  ramp_B=ramp_A*ramp_B_factor/4096
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    int32_t ramp_B_factor;
    
    /** @brief Offset 20'h00024 - ramp_freqexp
      *  ramp frequency exponent
      *
      *  bits [31: 4] - Reserved
      *  bits [ 3: 0] - Data
      */
    uint32_t ramp_freqexp;
    
    /** @brief Offset 20'h00028 - ramp_on
      *  Ramp on (controlled by hardware switch)
      *
      *  bits [31: 1] - Reserved
      *  bits [	   0] - Data
      */
    uint32_t ramp_on;
    
    /** @brief Offset 20'h0002C - error_offset
      *  error signal offset
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    int32_t error_offset;
    
    /** @brief Offset 20'h00030 - offset_out_B
      *  output offset for fast PID branch
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    int32_t  offset_out_B;
    
    /** @brief Offset 20'h00034 - pid_kp
      *  PID proportional gain factor
      *
      *  bits [31:11] - Reserved
      *  bits [10: 0] - Data
      */
    int32_t pid_kp;
    
    /** @brief Offset 20'h00038 - pid_PSR
      *  PID proportional gain exponent
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_PSR;
    
    /** @brief Offset 20'h0003C - pid_off
      *  PID off  (software)
      *
      *  bits [31: 1] - Reserved
      *  bits [	   0] - Data
      */
    uint32_t pid_off;
    
    /** @brief Offset 20'h00040 - error_sw
      *  Error signal selector (1-demodulator, 0-in1)
      *
      *  bits [31: 1] - Reserved
      *  bits [    0] - Data
      */
    uint32_t error_sw;
    
    /** @brief Offset 20'h00044 - pid_ki
      *  PID unlimited integrator gain factor
      *
      *  bits [31:11] - Reserved
      *  bits [10: 0] - Data
      */
    int32_t  pid_ki;
    
    /** @brief Offset 20'h00048 - pid_ISR
      *  PID unlimited integrator gain exponent. 
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_ISR;
    
    /** @brief Offset 20'h0004C - pid_i_on
      *  PID unlimited integrator on (controlled by hardware switch)
      *
      *  bits [31: 1] - Reserved
      *  bits [    0] - Data
      */
    uint32_t pid_i_on;
    
    /** @brief Offset 20'h00050 - pid_freeze
      *  PID is frozen (controlled by external signal via BNC->GPIO)
      *
      *  bits [31: 1] - Reserved
      *  bits [    0] - Data
      */
    uint32_t  pid_freeze;
    
    /** @brief Offset 20'h00054 - pid_kl
      *  PID slow limited integrator gain factor
      *
      *  bits [31:11] - Reserved
      *  bits [10: 0] - Data
      */
    int32_t  pid_kl;
    
    /** @brief Offset 20'h00058 - pid_LSR
      *  PID slow limited integrator gain exponent
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_LSR;
    
    /** @brief Offset 20'h0005C - pid_cl
      *  PID slow limited integrator cutoff time exponent 
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_cl;
    
    /** @brief Offset 20'h00060 - pid_kf
      *  PID fast limited integrator gain factor
      *
      *  bits [31:11] - Reserved
      *  bits [10: 0] - Data
      */
    int32_t  pid_kf;
    
    /** @brief Offset 20'h00064 - pid_FSR
      *  PID fast limited integrator gain exponent
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_FSR;
    
    /** @brief Offset 20'h00068 - pid_cf
      *  PID fast limited integrator cutoff time exponent 
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    uint32_t pid_cf;
    
    /** @brief Offset 20'h0006C - pid_kd
      *  PID derivator gain factor
      *
      *  bits [31: 4] - Reserved
      *  bits [ 3: 0] - Data
      */
    int32_t pid_kd;
    
    /** @brief Offset 20'h00070 - pid_DSR
      *  PID derivator gain exponent
      *
      *  bits [31: 4] - Reserved
      *  bits [ 3: 0] - Data
      */
    uint32_t pid_DSR;
    
    /** @brief Offset 20'h00074 - pid_cd
      *  PID derivator cutoff time exponent 
      *
      *  bits [31: 6] - Reserved
      *  bits [ 5: 0] - Data
      */
    uint32_t pid_cd;
    
    /** @brief Offset 20'h00078 - rl_config
      *  Loss of lock detection [enable_pid_sat,enable_signal_min,enable_signal_max,enable_error_max]
      *
      *  bits [31: 6] - Reserved
      *  bits [ 5: 0] - Data
      */
    uint32_t rl_config;
    
    /** @brief Offset 20'h0007C - rl_unlocked
      * Loss of lock detection flag
      *
      *  bits [31: 1] - Reserved
      *  bits [    0] - Data
      */
    uint32_t rl_unlocked;
    
    /** @brief Offset 20'h00080 - rl_error_max
      *  Threshold for error signal. Detects loss of lock when |error| > rl_error_max
      *
      *  bits [31: 5] - Reserved
      *  bits [ 4: 0] - Data
      */
    uint32_t rl_error_max;
    
    /** @brief Offset 20'h00084 - rl_signal_min
      *  Min threshold for signal. Detects loss of lock when signal < rl_signal_min
      *
      *  bits [31: 3] - Reserved
      *  bits [ 2: 0] - Data
      */
    int32_t rl_signal_min;

    
    /** @brief Offset 20'h00088 - rl_signal_max
      *  Max threshold for signal. Detects loss of lock when signal > rl_signal_max
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    int32_t  rl_signal_max;
    
    /** @brief Offset 20'h0008C - error_mean
      *  134 ms error mean val
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    int32_t  error_mean;
    
    /** @brief Offset 20'h00090 - error_var
      *  134 ms error variance
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    uint32_t  error_var;
    
    /** @brief Offset 20'h00094 - ramp_offset
      *  ramp offset (controlled by incremental counter)
      *
      *  bits [31:27] - Reserved
      *  bits [26: 0] - Data
      */
    int32_t ramp_offset;
    
    /** @brief Offset 20'h00098 - ramp_ampl
      *  ramp amplitude (controlled by incremental counter)
      *
      *  bits [31:12] - Reserved
      *  bits [11: 0] - Data
      */
    uint32_t ramp_ampl;
    
    /** @brief Offset 20'h0009C - ramp_offs_step
      *  ramp offset increment rate (controlled by incremental counter)
      *
      *  bits [31: 0] - Data
      */
    uint32_t ramp_offs_step;
    
    /** @brief Offset 20'h000A0 - ramp_ampl_step
      *  ramp amplitude increment rate (controlled by incremental counter)
      *
      *  bits [31:14] - Reserved
      *  bits [13: 0] - Data
      */
    uint32_t ramp_ampl_step;
    
    /** @brief Offset 20'h000A4 - i_out
      *  unlimited integrator output (int14 extended to int32)
      *
      *  bits [31: 0] - Data
      */
//    uint32_t i_out;

} lock_reg_t;
// [FPGAREG DOCK END]


/** @} */

/* Description of the following variables or function declarations is in
 * fpga_lock.c
 */
  extern lock_reg_t    *g_lock_reg;

int fpga_lock_init(void);
int fpga_lock_exit(void);

#endif // _FPGA_LOCK_H_
