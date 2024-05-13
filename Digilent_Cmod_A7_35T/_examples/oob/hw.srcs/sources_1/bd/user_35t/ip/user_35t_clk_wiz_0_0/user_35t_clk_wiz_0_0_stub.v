// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Thu Nov  5 15:17:23 2020
// Host        : K-Legion running 64-bit Kali GNU/Linux Rolling
// Command     : write_verilog -force -mode synth_stub
//               /home/ciprian/Documents/Github/Cmod-A7/hw/proj/hw.srcs/sources_1/bd/user_35t/ip/user_35t_clk_wiz_0_0/user_35t_clk_wiz_0_0_stub.v
// Design      : user_35t_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module user_35t_clk_wiz_0_0(clk_out1, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1" */;
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;
endmodule
