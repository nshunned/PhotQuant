// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 21 14:33:26 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_axis_constant_0_0/system_axis_constant_0_0_stub.v
// Design      : system_axis_constant_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_constant,Vivado 2020.1" *)
module system_axis_constant_0_0(aclk, cfg_data, m_axis_tdata, m_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="aclk,cfg_data[31:0],m_axis_tdata[31:0],m_axis_tvalid" */;
  input aclk;
  input [31:0]cfg_data;
  output [31:0]m_axis_tdata;
  output m_axis_tvalid;
endmodule
