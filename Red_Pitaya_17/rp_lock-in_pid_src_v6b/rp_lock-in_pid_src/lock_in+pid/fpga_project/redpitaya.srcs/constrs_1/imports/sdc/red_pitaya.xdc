#
# $Id: red_pitaya.xdc 961 2014-01-21 11:40:39Z matej.oblak $
#
# @brief Red Pitaya location constraints.
#
# @Author Matej Oblak, changed by Alexei Ourjoumtsev
#
# (c) Red Pitaya  http://www.redpitaya.com
#

############################################################################
# IO constraints                                                           #
############################################################################

### ADC

# ADC data
set_property IOSTANDARD LVCMOS18 [get_ports {adc_dat_i[*][*]}]
set_property IOB        TRUE     [get_ports {adc_dat_i[*][*]}]

# ADC 0 data
set_property PACKAGE_PIN V17     [get_ports {adc_dat_i[0][0]}]
set_property PACKAGE_PIN U17     [get_ports {adc_dat_i[0][1]}]
set_property PACKAGE_PIN Y17     [get_ports {adc_dat_i[0][2]}]
set_property PACKAGE_PIN W16     [get_ports {adc_dat_i[0][3]}]
set_property PACKAGE_PIN Y16     [get_ports {adc_dat_i[0][4]}]
set_property PACKAGE_PIN W15     [get_ports {adc_dat_i[0][5]}]
set_property PACKAGE_PIN W14     [get_ports {adc_dat_i[0][6]}]
set_property PACKAGE_PIN Y14     [get_ports {adc_dat_i[0][7]}]
set_property PACKAGE_PIN W13     [get_ports {adc_dat_i[0][8]}]
set_property PACKAGE_PIN V12     [get_ports {adc_dat_i[0][9]}]
set_property PACKAGE_PIN V13     [get_ports {adc_dat_i[0][10]}]
set_property PACKAGE_PIN T14     [get_ports {adc_dat_i[0][11]}]
set_property PACKAGE_PIN T15     [get_ports {adc_dat_i[0][12]}]
set_property PACKAGE_PIN V15     [get_ports {adc_dat_i[0][13]}]
set_property PACKAGE_PIN T16     [get_ports {adc_dat_i[0][14]}]
set_property PACKAGE_PIN V16     [get_ports {adc_dat_i[0][15]}]

# ADC 1 data
set_property PACKAGE_PIN T17     [get_ports {adc_dat_i[1][0]}]
set_property PACKAGE_PIN R16     [get_ports {adc_dat_i[1][1]}]
set_property PACKAGE_PIN R18     [get_ports {adc_dat_i[1][2]}]
set_property PACKAGE_PIN P16     [get_ports {adc_dat_i[1][3]}]
set_property PACKAGE_PIN P18     [get_ports {adc_dat_i[1][4]}]
set_property PACKAGE_PIN N17     [get_ports {adc_dat_i[1][5]}]
set_property PACKAGE_PIN R19     [get_ports {adc_dat_i[1][6]}]
set_property PACKAGE_PIN T20     [get_ports {adc_dat_i[1][7]}]
set_property PACKAGE_PIN T19     [get_ports {adc_dat_i[1][8]}]
set_property PACKAGE_PIN U20     [get_ports {adc_dat_i[1][9]}]
set_property PACKAGE_PIN V20     [get_ports {adc_dat_i[1][10]}]
set_property PACKAGE_PIN W20     [get_ports {adc_dat_i[1][11]}]
set_property PACKAGE_PIN W19     [get_ports {adc_dat_i[1][12]}]
set_property PACKAGE_PIN Y19     [get_ports {adc_dat_i[1][13]}]
set_property PACKAGE_PIN W18     [get_ports {adc_dat_i[1][14]}]
set_property PACKAGE_PIN Y18     [get_ports {adc_dat_i[1][15]}]

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_i[*]]
set_property PACKAGE_PIN U18           [get_ports adc_clk_i[1]]
set_property PACKAGE_PIN U19           [get_ports adc_clk_i[0]]

# Output ADC clock
set_property IOSTANDARD LVCMOS18 [get_ports {adc_clk_o[*]}]
set_property SLEW       FAST     [get_ports {adc_clk_o[*]}]
set_property DRIVE      8        [get_ports {adc_clk_o[*]}]
#set_property IOB        TRUE     [get_ports {adc_clk_o[*]}]

set_property PACKAGE_PIN N20 [get_ports {adc_clk_o[0]}]
set_property PACKAGE_PIN P20 [get_ports {adc_clk_o[1]}]

# ADC clock stabilizer
set_property IOSTANDARD LVCMOS18 [get_ports adc_cdcs_o]
set_property PACKAGE_PIN V18     [get_ports adc_cdcs_o]
set_property SLEW       FAST     [get_ports adc_cdcs_o]
set_property DRIVE      8        [get_ports adc_cdcs_o]

### DAC

# data
set_property IOSTANDARD LVCMOS33 [get_ports {dac_dat_o[*]}]
set_property SLEW       SLOW     [get_ports {dac_dat_o[*]}]
set_property DRIVE      4        [get_ports {dac_dat_o[*]}]
#set_property IOB        TRUE     [get_ports {dac_dat_o[*]}]

set_property PACKAGE_PIN M19 [get_ports {dac_dat_o[0]}]
set_property PACKAGE_PIN M20 [get_ports {dac_dat_o[1]}]
set_property PACKAGE_PIN L19 [get_ports {dac_dat_o[2]}]
set_property PACKAGE_PIN L20 [get_ports {dac_dat_o[3]}]
set_property PACKAGE_PIN K19 [get_ports {dac_dat_o[4]}]
set_property PACKAGE_PIN J19 [get_ports {dac_dat_o[5]}]
set_property PACKAGE_PIN J20 [get_ports {dac_dat_o[6]}]
set_property PACKAGE_PIN H20 [get_ports {dac_dat_o[7]}]
set_property PACKAGE_PIN G19 [get_ports {dac_dat_o[8]}]
set_property PACKAGE_PIN G20 [get_ports {dac_dat_o[9]}]
set_property PACKAGE_PIN F19 [get_ports {dac_dat_o[10]}]
set_property PACKAGE_PIN F20 [get_ports {dac_dat_o[11]}]
set_property PACKAGE_PIN D20 [get_ports {dac_dat_o[12]}]
set_property PACKAGE_PIN D19 [get_ports {dac_dat_o[13]}]

# control
set_property IOSTANDARD LVCMOS33 [get_ports dac_*_o]
set_property SLEW       FAST     [get_ports dac_*_o]
set_property DRIVE      8        [get_ports dac_*_o]
#set_property IOB        TRUE     [get_ports dac_*_o]

set_property PACKAGE_PIN M17 [get_ports dac_wrt_o]
set_property PACKAGE_PIN N16 [get_ports dac_sel_o]
set_property PACKAGE_PIN M18 [get_ports dac_clk_o]
set_property PACKAGE_PIN N15 [get_ports dac_rst_o]

### PWM DAC : unused, keep in comments for port mapping
#set_property IOSTANDARD LVCMOS18 [get_ports {dac_pwm_o[*]}]
#set_property SLEW FAST           [get_ports {dac_pwm_o[*]}]
#set_property DRIVE 12            [get_ports {dac_pwm_o[*]}]
#set_property IOB TRUE            [get_ports {dac_pwm_o[*]}]

#set_property PACKAGE_PIN T10 [get_ports {dac_pwm_o[0]}]
#set_property PACKAGE_PIN T11 [get_ports {dac_pwm_o[1]}]
#set_property PACKAGE_PIN P15 [get_ports {dac_pwm_o[2]}]
#set_property PACKAGE_PIN U13 [get_ports {dac_pwm_o[3]}]

### XADC : unused, keep in comments for port mapping
#set_property IOSTANDARD LVCMOS33 [get_ports {vinp_i[*]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vinn_i[*]}]
##AD0
#set_property PACKAGE_PIN C20 [get_ports {vinp_i[1]}]
#set_property PACKAGE_PIN B20 [get_ports {vinn_i[1]}]
##AD1
#set_property PACKAGE_PIN E17 [get_ports {vinp_i[2]}]
#set_property PACKAGE_PIN D18 [get_ports {vinn_i[2]}]
##AD8
#set_property PACKAGE_PIN B19 [get_ports {vinp_i[0]}]
#set_property PACKAGE_PIN A20 [get_ports {vinn_i[0]}]
##AD9
#set_property PACKAGE_PIN E18 [get_ports {vinp_i[3]}]
#set_property PACKAGE_PIN E19 [get_ports {vinn_i[3]}]
##V_0
#set_property PACKAGE_PIN K9  [get_ports {vinp_i[4]}]
#set_property PACKAGE_PIN L10 [get_ports {vinn_i[4]}]

### Expansion connector //Alexei: modified to remove unused pins, kept in comments for mapping
set_property IOSTANDARD LVCMOS33 [get_ports {exp_p_io[*]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_io[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_io*}]
#set_property SLEW       FAST     [get_ports {exp_p_io[*]}]
#set_property SLEW       FAST     [get_ports {exp_n_io[*]}]
set_property SLEW       FAST     [get_ports {exp_n_io7}]
set_property SLEW       FAST     [get_ports {exp_n_io1}]
#set_property DRIVE      8        [get_ports {exp_p_io[*]}]
#set_property DRIVE      8        [get_ports {exp_n_io[*]}]
set_property DRIVE      8        [get_ports {exp_n_io7}]
set_property DRIVE      8        [get_ports {exp_n_io1}]

set_property PACKAGE_PIN G17 [get_ports {exp_p_io[0]}]
#set_property PACKAGE_PIN G18 [get_ports {exp_n_io[0]}]
set_property PACKAGE_PIN H16 [get_ports {exp_p_io[1]}]
set_property PACKAGE_PIN H17 [get_ports {exp_n_io1}]
set_property PACKAGE_PIN J18 [get_ports {exp_p_io[2]}]
set_property PACKAGE_PIN H18 [get_ports {exp_n_io2}]
set_property PACKAGE_PIN K17 [get_ports {exp_p_io[3]}]
#set_property PACKAGE_PIN K18 [get_ports {exp_n_io[3]}]
set_property PACKAGE_PIN L14 [get_ports {exp_p_io[4]}]
#set_property PACKAGE_PIN L15 [get_ports {exp_n_io[4]}]
set_property PACKAGE_PIN L16 [get_ports {exp_p_io[5]}]
#set_property PACKAGE_PIN L17 [get_ports {exp_n_io[5]}]
set_property PACKAGE_PIN K16 [get_ports {exp_p_io[6]}]
#set_property PACKAGE_PIN J16 [get_ports {exp_n_io[6]}]
set_property PACKAGE_PIN M14 [get_ports {exp_p_io[7]}]
set_property PACKAGE_PIN M15 [get_ports {exp_n_io7}]

#inputs for switches and incremental counters
set_property PULLDOWN TRUE [get_ports {exp_p_io[*]}]
#input to freeze PID
set_property PULLDOWN TRUE [get_ports {exp_n_io2}]

### SATA connector : unused, keep in comments for port mapping
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_p_o[*]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_n_o[*]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_p_i[*]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_n_i[*]}]

#set_property PACKAGE_PIN T12 [get_ports {daisy_p_o[0]}]
#set_property PACKAGE_PIN U12 [get_ports {daisy_n_o[0]}]
#set_property PACKAGE_PIN U14 [get_ports {daisy_p_o[1]}]
#set_property PACKAGE_PIN U15 [get_ports {daisy_n_o[1]}]
#set_property PACKAGE_PIN P14 [get_ports {daisy_p_i[0]}]
#set_property PACKAGE_PIN R14 [get_ports {daisy_n_i[0]}]
#set_property PACKAGE_PIN N18 [get_ports {daisy_p_i[1]}]
#set_property PACKAGE_PIN P19 [get_ports {daisy_n_i[1]}]

### LED : unused, keep in comments for port mapping
#set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]
#set_property SLEW       SLOW     [get_ports {led_o[*]}]
#set_property DRIVE      4        [get_ports {led_o[*]}]

#set_property PACKAGE_PIN F16     [get_ports {led_o[0]}]
#set_property PACKAGE_PIN F17     [get_ports {led_o[1]}]
#set_property PACKAGE_PIN G15     [get_ports {led_o[2]}]
#set_property PACKAGE_PIN H15     [get_ports {led_o[3]}]
#set_property PACKAGE_PIN K14     [get_ports {led_o[4]}]
#set_property PACKAGE_PIN G14     [get_ports {led_o[5]}]
#set_property PACKAGE_PIN J15     [get_ports {led_o[6]}]
#set_property PACKAGE_PIN J14     [get_ports {led_o[7]}]

############################################################################
# Clock constraints                                                        #
############################################################################

#Input delays:
#ADC inputs:
#  - refer to clk_adc output from internal_clks_pll (see Open Synthesized Design / Report Clock Networks), not to adc_clk_i[1] (large PLL delay => timing errors)
set_input_delay -clock clk_adc_internal_clks_pll 3.400 [get_ports adc_dat_i[*][*]]
#set_false_path -from [get_pins {adc_dat_raw_reg[*][*]/C}] -to [get_pins {i_lock/sys_rdata_reg[*]/D}]
#set_false_path -from [get_pins {adc_dat_raw_reg[1][*]/C}] -to [get_pins {i_lock/lock_fail_reg[*]/D}]

#Set then ignore delays for signals from mechanical switches and incremental counters:
set_input_delay -clock clk_adc_internal_clks_pll 3.400 [get_ports {exp_p_io[*]}]
set_false_path -from [get_ports {exp_p_io[0]}]
#Set then ignore delay for the "freeze" signal, reasonable if it is deterministic (plus, cable length unknown):
set_input_delay -clock clk_adc_internal_clks_pll 3.400 [get_ports exp_n_io2]
set_false_path -from [get_ports exp_n_io2]
#Set then ignore delay for the scope trigger (not up to a few clock cycles here):
set_output_delay -clock clk_adc_internal_clks_pll 3.400 [get_ports exp_n_io1]
set_false_path -to [get_ports exp_n_io1]
#Set then ignore delay for the modulation signal (cable length unknown):
set_output_delay -clock clk_adc_internal_clks_pll 3.400 [get_ports {exp_n_io7}]
set_false_path -to [get_ports exp_n_io7]

#Output delays:
#the clocks from the PLL are auto-detected, but dac_clk goes through an ODDR and must be declared "manually" here
create_generated_clock -name dac_clk -multiply_by 1 -source [get_pins oddr_dac_clk/C] [get_ports dac_clk_o]
#The -45° phase of dac_clk_2p driving dac_clk correspond to 0.5ns of delay with respect to dac_clk_2x.
#Setting it to -90° changes the delay to 1ns, but changing the output delays accordingly gives timing errors
set_output_delay -clock dac_clk 0.5 [get_ports dac_dat_o[*]]
set_output_delay -clock dac_clk 0.5 [get_ports dac_rst_o]
set_output_delay -clock dac_clk 0.5 [get_ports dac_sel_o]
set_output_delay -clock dac_clk 0.5 [get_ports dac_wrt_o]

#Internal logic false paths for scope and monitoring signals
#set_false_path -to [get_pins {i_lock/i_muxer2_scope*/pipe*_reg[*]/D}]
#set_false_path -from [get_pins {i_lock/i_muxer2_scope*/out_reg[*]/C}]
#set_false_path -to [get_pins {i_scope/ext_trig_in_reg[0]/D}]
#set_false_path -from [get_pins {i_lock/i_debounce_rl_unlocked/out_reg/C}]
#set_false_path -from [get_pins {i_lock/mean_var_error/data1_mean_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/mean_var_error/data_var_reg[*]/C}]

#Internal logic false paths for PS data exchange registers
#set_false_path -from [get_pins {i_lock/oscA_sw_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/oscB_sw_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/osc_ctrl_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/trig_sw_reg/C}]
#set_false_path -from [get_pins {i_lock/mod_period_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/loc_osc_phase_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/demod_lpf_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/demod_gain_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/ramp_B_factor_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/ramp_freqexp_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/error_offset_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/offset_out_B_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_kp_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_PSR_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_off_reg/C}]
#set_false_path -from [get_pins {i_lock/error_sw_reg/C}]
#set_false_path -from [get_pins {i_lock/pid_ki_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_ISR_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_kl_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_LSR_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_cl_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_kf_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_FSR_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_cf_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_kd_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_DSR_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/pid_cd_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/rl_config_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/rl_error_max_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/rl_signal_min_reg[*]/C}]
#set_false_path -from [get_pins {i_lock/rl_signal_max_reg[*]/C}]
#set_false_path -from [get_pins {i_lock_monitor/integr_lptimeexp_reg[*]/C}]
#set_false_path -from [get_pins {i_lock_monitor/lp_filter_run_reg/C}]
#set_false_path -from [get_pins {i_lock_monitor/i_LP_filter_IntLP/mem_reg[*]/C}] -to [get_pins {i_lock_monitor/sys_rdata_reg[*]/D}]

##set_false_path -from [get_pins {i_lock/i_lock_pid/i_offs_reg[*]/C}] -to [get_pins {i_lock_monitor/i_LP_filter_IntLP/mem_reg[*]/D}]

