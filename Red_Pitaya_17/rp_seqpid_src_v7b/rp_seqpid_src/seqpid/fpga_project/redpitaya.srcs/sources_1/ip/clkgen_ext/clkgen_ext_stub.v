// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 28 23:33:06 2023
// Host        : alexei-jeip running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid/fpga_project/redpitaya.srcs/sources_1/ip/clkgen_ext/clkgen_ext_stub.v
// Design      : clkgen_ext
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clkgen_ext(clk_adc, reset, input_clk_stopped, locked, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_adc,reset,input_clk_stopped,locked,clk_in1" */;
  output clk_adc;
  input reset;
  output input_clk_stopped;
  output locked;
  input clk_in1;
endmodule
