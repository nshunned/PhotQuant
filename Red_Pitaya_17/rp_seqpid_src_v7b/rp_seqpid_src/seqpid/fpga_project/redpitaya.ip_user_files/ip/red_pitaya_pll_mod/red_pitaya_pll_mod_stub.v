// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Jan  8 13:02:59 2024
// Host        : alexei-jeip running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid/fpga_project/redpitaya.srcs/sources_1/ip/red_pitaya_pll_mod/red_pitaya_pll_mod_stub.v
// Design      : red_pitaya_pll_mod
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module red_pitaya_pll_mod(clk_adc, clk_dac_1x, clk_dac_2x, clk_dac_2p, 
  resetn, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_adc,clk_dac_1x,clk_dac_2x,clk_dac_2p,resetn,locked,clk_in1_p,clk_in1_n" */;
  output clk_adc;
  output clk_dac_1x;
  output clk_dac_2x;
  output clk_dac_2p;
  input resetn;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
