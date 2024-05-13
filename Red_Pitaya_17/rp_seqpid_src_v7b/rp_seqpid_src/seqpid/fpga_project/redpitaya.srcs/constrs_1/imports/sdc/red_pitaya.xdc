#
# $Id: red_pitaya.xdc 961 2014-01-21 11:40:39Z matej.oblak $
#
# @brief Red Pitaya location constraints.
#
# @Author Matej Oblak
#
# (c) Red Pitaya  http://www.redpitaya.com
#

############################################################################
# IO constraints                                                           #
############################################################################

### ADC

# ADC data
set_property IOSTANDARD LVCMOS18 [get_ports {adc_dat_i[*][*]}]
set_property IOB TRUE [get_ports {adc_dat_i[*][*]}]

# ADC 0 data
set_property PACKAGE_PIN V17 [get_ports {adc_dat_i[0][0]}]
set_property PACKAGE_PIN U17 [get_ports {adc_dat_i[0][1]}]
set_property PACKAGE_PIN Y17 [get_ports {adc_dat_i[0][2]}]
set_property PACKAGE_PIN W16 [get_ports {adc_dat_i[0][3]}]
set_property PACKAGE_PIN Y16 [get_ports {adc_dat_i[0][4]}]
set_property PACKAGE_PIN W15 [get_ports {adc_dat_i[0][5]}]
set_property PACKAGE_PIN W14 [get_ports {adc_dat_i[0][6]}]
set_property PACKAGE_PIN Y14 [get_ports {adc_dat_i[0][7]}]
set_property PACKAGE_PIN W13 [get_ports {adc_dat_i[0][8]}]
set_property PACKAGE_PIN V12 [get_ports {adc_dat_i[0][9]}]
set_property PACKAGE_PIN V13 [get_ports {adc_dat_i[0][10]}]
set_property PACKAGE_PIN T14 [get_ports {adc_dat_i[0][11]}]
set_property PACKAGE_PIN T15 [get_ports {adc_dat_i[0][12]}]
set_property PACKAGE_PIN V15 [get_ports {adc_dat_i[0][13]}]
set_property PACKAGE_PIN T16 [get_ports {adc_dat_i[0][14]}]
set_property PACKAGE_PIN V16 [get_ports {adc_dat_i[0][15]}]

# ADC 1 data
set_property PACKAGE_PIN T17 [get_ports {adc_dat_i[1][0]}]
set_property PACKAGE_PIN R16 [get_ports {adc_dat_i[1][1]}]
set_property PACKAGE_PIN R18 [get_ports {adc_dat_i[1][2]}]
set_property PACKAGE_PIN P16 [get_ports {adc_dat_i[1][3]}]
set_property PACKAGE_PIN P18 [get_ports {adc_dat_i[1][4]}]
set_property PACKAGE_PIN N17 [get_ports {adc_dat_i[1][5]}]
set_property PACKAGE_PIN R19 [get_ports {adc_dat_i[1][6]}]
set_property PACKAGE_PIN T20 [get_ports {adc_dat_i[1][7]}]
set_property PACKAGE_PIN T19 [get_ports {adc_dat_i[1][8]}]
set_property PACKAGE_PIN U20 [get_ports {adc_dat_i[1][9]}]
set_property PACKAGE_PIN V20 [get_ports {adc_dat_i[1][10]}]
set_property PACKAGE_PIN W20 [get_ports {adc_dat_i[1][11]}]
set_property PACKAGE_PIN W19 [get_ports {adc_dat_i[1][12]}]
set_property PACKAGE_PIN Y19 [get_ports {adc_dat_i[1][13]}]
set_property PACKAGE_PIN W18 [get_ports {adc_dat_i[1][14]}]
set_property PACKAGE_PIN Y18 [get_ports {adc_dat_i[1][15]}]

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports {adc_clk_i[*]}]
set_property PACKAGE_PIN U18 [get_ports {adc_clk_i[1]}]
set_property PACKAGE_PIN U19 [get_ports {adc_clk_i[0]}]

# Output ADC clock
set_property IOSTANDARD LVCMOS18 [get_ports {adc_clk_o[*]}]
set_property SLEW FAST [get_ports {adc_clk_o[*]}]
set_property DRIVE 8 [get_ports {adc_clk_o[*]}]
#set_property IOB        TRUE     [get_ports {adc_clk_o[*]}]

set_property PACKAGE_PIN N20 [get_ports {adc_clk_o[0]}]
set_property PACKAGE_PIN P20 [get_ports {adc_clk_o[1]}]

# ADC clock stabilizer
set_property IOSTANDARD LVCMOS18 [get_ports adc_cdcs_o]
set_property PACKAGE_PIN V18 [get_ports adc_cdcs_o]
set_property SLEW FAST [get_ports adc_cdcs_o]
set_property DRIVE 8 [get_ports adc_cdcs_o]

### DAC

# data
set_property IOSTANDARD LVCMOS33 [get_ports {dac_dat_o[*]}]
set_property SLEW FAST [get_ports {dac_dat_o[*]}]
set_property DRIVE 8 [get_ports {dac_dat_o[*]}]
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
set_property SLEW FAST [get_ports dac_*_o]
set_property DRIVE 8 [get_ports dac_*_o]
#set_property IOB        TRUE     [get_ports dac_*_o]

set_property PACKAGE_PIN M17 [get_ports dac_wrt_o]
set_property PACKAGE_PIN N16 [get_ports dac_sel_o]
set_property PACKAGE_PIN M18 [get_ports dac_clk_o]
set_property PACKAGE_PIN N15 [get_ports dac_rst_o]

### PWM DAC //Alexei: disabled
#set_property IOSTANDARD LVCMOS18 [get_ports {dac_pwm_o[*]}]
#set_property SLEW FAST           [get_ports {dac_pwm_o[*]}]
#set_property DRIVE 12            [get_ports {dac_pwm_o[*]}]
#set_property IOB TRUE            [get_ports {dac_pwm_o[*]}]

#set_property PACKAGE_PIN T10 [get_ports {dac_pwm_o[0]}]
#set_property PACKAGE_PIN T11 [get_ports {dac_pwm_o[1]}]
#set_property PACKAGE_PIN P15 [get_ports {dac_pwm_o[2]}]
#set_property PACKAGE_PIN U13 [get_ports {dac_pwm_o[3]}]

### XADC //Alexei: disabled
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

### Expansion connector //Alexei: modified to remove unused pins
set_property IOSTANDARD LVCMOS33 [get_ports exp_p_io*]
set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_io[*]}]

set_property SLEW FAST [get_ports {exp_n_io[*]}]
set_property SLEW FAST [get_ports exp_p_io2]
set_property SLEW FAST [get_ports exp_p_io3]

set_property DRIVE 8 [get_ports {exp_n_io[*]}]
set_property DRIVE 8 [get_ports exp_p_io2]
set_property DRIVE 8 [get_ports exp_p_io3]

#set_property PACKAGE_PIN G17 [get_ports {exp_p_io[0]}]
set_property PACKAGE_PIN G17 [get_ports exp_p_io0]
set_property PACKAGE_PIN G18 [get_ports {exp_n_io[0]}]
#set_property PACKAGE_PIN G18 [get_ports {exp_n_io0}]
#set_property PACKAGE_PIN H16 [get_ports {exp_p_io[1]}]
set_property PACKAGE_PIN H16 [get_ports exp_p_io1]
set_property PACKAGE_PIN H17 [get_ports {exp_n_io[1]}]
#set_property PACKAGE_PIN H17 [get_ports {exp_n_io1}]
#set_property PACKAGE_PIN J18 [get_ports {exp_p_io[2]}]
set_property PACKAGE_PIN J18 [get_ports exp_p_io2]
set_property PACKAGE_PIN H18 [get_ports {exp_n_io[2]}]
#set_property PACKAGE_PIN H18 [get_ports {exp_n_io2}]
#set_property PACKAGE_PIN K17 [get_ports {exp_p_io[3]}]
set_property PACKAGE_PIN K17 [get_ports exp_p_io3]
set_property PACKAGE_PIN K18 [get_ports {exp_n_io[3]}]
#set_property PACKAGE_PIN L14 [get_ports {exp_p_io[4]}]
#set_property PACKAGE_PIN L15 [get_ports {exp_n_io[4]}]
#set_property PACKAGE_PIN L16 [get_ports {exp_p_io[5]}]
#set_property PACKAGE_PIN L17 [get_ports {exp_n_io[5]}]
#set_property PACKAGE_PIN K16 [get_ports {exp_p_io[6]}]
#set_property PACKAGE_PIN J16 [get_ports {exp_n_io[6]}]
#set_property PACKAGE_PIN M14 [get_ports {exp_p_io[7]}]
#set_property PACKAGE_PIN M15 [get_ports {exp_n_io[7]}]
#set_property PACKAGE_PIN M15 [get_ports {exp_n_io7}]

#inputs for switches and incremental counters
set_property PULLDOWN true [get_ports exp_p_io0]
set_property PULLDOWN true [get_ports exp_p_io1]



### SATA connector
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_p_i[*]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_n_i[*]}]

#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_p_o[*]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {daisy_n_o[*]}]
#set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports {daisy_p_i[*]}]
#set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports {daisy_n_i[*]}]

#set_property PACKAGE_PIN T12 [get_ports {daisy_p_o[0]}]
#set_property PACKAGE_PIN U12 [get_ports {daisy_n_o[0]}]
#set_property PACKAGE_PIN U14 [get_ports {daisy_p_o[1]}]
#set_property PACKAGE_PIN U15 [get_ports {daisy_n_o[1]}]
#set_property PACKAGE_PIN P14 [get_ports {daisy_p_i[0]}]
#set_property PACKAGE_PIN R14 [get_ports {daisy_n_i[0]}]
#set_property PACKAGE_PIN N18 [get_ports {daisy_p_i[1]}]
#set_property PACKAGE_PIN P19 [get_ports {daisy_n_i[1]}]

### LED
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
set_property IOSTANDARD LVCMOS33 [get_ports led_o*]
set_property SLEW SLOW [get_ports led_o*]
set_property DRIVE 4 [get_ports led_o*]

set_property PACKAGE_PIN F16 [get_ports led_o0]

############################################################################
# Clock constraints                                                        #
############################################################################

#NET "adc_clk" TNM_NET = "adc_clk";
#TIMESPEC TS_adc_clk = PERIOD "adc_clk" 125 MHz;

###Clock declaration (clocks connected to MMIC and PLL are auto-detected):

#Input 125MHz clock
create_clock -period 8.000 -name exp_p_io1 [get_ports exp_p_io1]

#Clocks sent to the DAC, to the ADC and to the 125MHz output go through ODDRs, they are not auto-detected and must be declared here
create_generated_clock -name dac_clk -source [get_pins oddr_dac_clk/C] -multiply_by 1 [get_ports dac_clk_o]
create_generated_clock -name clk_src_out -source [get_pins oddr_clk_src_out/C] -multiply_by 1 [get_ports exp_p_io3]
create_generated_clock -name adc_clk_out -source [get_pins oddr_adc_clk_p/C] -multiply_by 1 [get_ports {adc_clk_o[0]}]
#The differential ADC clock is defined via the P channel only, then the delay of the n channel is adjusted to be in phase, with an inverted logic
set_output_delay -clock adc_clk_out 0.000 [get_ports {adc_clk_o[1]}]

#We have three effectively asynchronous groups:
# - one derived from the internal 33MHz crystal (clk_fpga_0/1/2/3),
# - one from the external 125MHz clock (exp_p_io1 -> adc_clk_ext),
# - and one from the clock sent back from the ADC (adc_clk, dac_clkXX)
set_clock_groups -name async_clks -asynchronous -group [get_clocks -include_generated_clocks -of_objects [get_pins {ps/system_i/processing_system7/inst/PS7_i/FCLKCLK[0] ps/system_i/processing_system7/inst/PS7_i/FCLKCLK[1] ps/system_i/processing_system7/inst/PS7_i/FCLKCLK[2] ps/system_i/processing_system7/inst/PS7_i/FCLKCLK[3]}]] -group [get_clocks -include_generated_clocks exp_p_io1] -group [get_clocks -include_generated_clocks adc_clk_i[1]] 
#set_clock_groups -name async_clks -asynchronous -group [get_clocks -include_generated_clocks {clk_fpga_0 clk_fpga_0 clk_fpga_0 clk_fpga_0}] -group [get_clocks -include_generated_clocks exp_p_io1] -group [get_clocks -include_generated_clocks adc_clk_i[1]] 


#Because the code effectively treats the clock coming back from the ADC as asynchronous, the delay of the clock sent to the ADC (either clk_fpga_0 or adc_clk_ext) is irrelevant:
#set_false_path -from [get_clocks -of_objects [get_pins ps/system_i/processing_system7/inst/PS7_i/FCLKCLK[0]]] -to [get_clocks adc_clk_out]
#set_false_path -from [get_clocks -of_objects [get_pins ext_clk_adc/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks adc_clk_out]
set_false_path -to [get_clocks adc_clk_out]

#The delay of the generated 125MHz clock is also unimportant (the PLL-derived clock is referenced by pin name for good practice):
#set_false_path -to [get_clocks -of_objects [get_pins pll/inst/plle2_adv_inst/CLKOUT4]]
set_false_path -to [get_clocks clk_src_out]
#set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins ext_clk_adc/inst/mmcm_adv_inst/CLKOUT0]]


### Input delays:

#ADC inputs: refer to the ADC clock after the PLL (clk_adc_red_pitaya_pll_mod, referenced by pin for good practice), not to adc_clk_i[1] (large PLL delay => timing errors)
set_input_delay -clock [get_clocks -of_objects [get_pins pll/inst/plle2_adv_inst/CLKOUT0]] 3.400 [get_ports {adc_dat_i[*][*]}]

#Set then ignore delays for the input trigger (sync with other devices controlled by seq_syncDelay in seqpid.ch)
set_input_delay -clock  [get_clocks -of_objects [get_pins pll/inst/plle2_adv_inst/CLKOUT0]] 3.400 [get_ports exp_p_io0]
set_false_path -from [get_ports exp_p_io0] 

### Output delays:

#The -45° phase of dac_clk_2p driving dac_clk correspond to 0.5ns of delay with respect to dac_clk_2x. Setting it to -90° changes the delay to 1ns, but changing the output delays accordingly gives timing errors
set_output_delay -clock dac_clk 0.500 [get_ports {dac_dat_o[*]}]
set_output_delay -clock dac_clk 0.500 [get_ports dac_rst_o]
set_output_delay -clock dac_clk 0.500 [get_ports dac_sel_o]
set_output_delay -clock dac_clk 0.500 [get_ports dac_wrt_o]

#Set then ignore delays for the LED and the output trigger (not up to a few clock cycles here):
set_output_delay -clock clk_fpga_0 0.500 [get_ports led_o0]
set_output_delay -clock [get_clocks -of_objects [get_pins pll/inst/plle2_adv_inst/CLKOUT0]] 0.500 [get_ports exp_p_io2]
set_false_path -to [get_ports led_o0]
set_false_path -to [get_ports exp_p_io2]

#Multicycle paths for PS data exchange registers
#set_false_path -from [get_pins {ext_clk_detect/clkext_use_out_reg/C}] -to [get_pins {i_seqpid_instr/sys_rdata_reg[*]/D}]
#set_false_path -from [get_pins {i_seqpid_instr/action_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_instr/action_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_instr/trig_out_enab_buf_reg/C}]
#set_false_path -from [get_pins {i_seqpid_instr/clk_out_enab_reg/C}]

#set_false_path -from [get_pins {adc_dat_raw_reg[*][*]/C}] -to [get_pins {i_seqpid_ch[*]/sys_rdata_reg[*]/D}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/offset_adc_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/offset_dac_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_kp_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_PSR_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_ki_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_ISR_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_kd_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_DSR_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_cd_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_off_reg/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_min_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/pid_max_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/seq_countStepLim_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/seq_syncDelay_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/enforceMode_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/inputRangeLow_reg/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/seq_overwr_val_reg[*]/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/seq_out_overwr_reg/C}]
#set_false_path -from [get_pins {i_seqpid_ch[*]/trig_enable_reg/C}]
