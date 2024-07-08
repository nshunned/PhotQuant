// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 21 14:34:13 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_frequency_counter_0_0_sim_netlist.v
// Design      : system_frequency_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter
   (counter_output,
    S_AXIS_IN_tdata,
    rst,
    clk,
    Ncycles);
  output [31:0]counter_output;
  input [13:0]S_AXIS_IN_tdata;
  input rst;
  input clk;
  input [31:0]Ncycles;

  wire [31:0]Ncycles;
  wire [13:0]S_AXIS_IN_tdata;
  wire clk;
  wire \counter[0]_i_2_n_0 ;
  wire counter_next0_carry__0_i_1_n_0;
  wire counter_next0_carry__0_i_2_n_0;
  wire counter_next0_carry__0_i_3_n_0;
  wire counter_next0_carry__0_i_4_n_0;
  wire counter_next0_carry__0_i_5_n_0;
  wire counter_next0_carry__0_i_6_n_0;
  wire counter_next0_carry__0_i_7_n_0;
  wire counter_next0_carry__0_i_8_n_0;
  wire counter_next0_carry__0_n_0;
  wire counter_next0_carry__0_n_1;
  wire counter_next0_carry__0_n_2;
  wire counter_next0_carry__0_n_3;
  wire counter_next0_carry__1_i_1_n_0;
  wire counter_next0_carry__1_i_2_n_0;
  wire counter_next0_carry__1_i_3_n_0;
  wire counter_next0_carry__1_i_4_n_0;
  wire counter_next0_carry__1_i_5_n_0;
  wire counter_next0_carry__1_i_6_n_0;
  wire counter_next0_carry__1_i_7_n_0;
  wire counter_next0_carry__1_i_8_n_0;
  wire counter_next0_carry__1_n_0;
  wire counter_next0_carry__1_n_1;
  wire counter_next0_carry__1_n_2;
  wire counter_next0_carry__1_n_3;
  wire counter_next0_carry__2_i_1_n_0;
  wire counter_next0_carry__2_i_2_n_0;
  wire counter_next0_carry__2_i_3_n_0;
  wire counter_next0_carry__2_i_4_n_0;
  wire counter_next0_carry__2_i_5_n_0;
  wire counter_next0_carry__2_i_6_n_0;
  wire counter_next0_carry__2_i_7_n_0;
  wire counter_next0_carry__2_i_8_n_0;
  wire counter_next0_carry__2_n_0;
  wire counter_next0_carry__2_n_1;
  wire counter_next0_carry__2_n_2;
  wire counter_next0_carry__2_n_3;
  wire counter_next0_carry_i_1_n_0;
  wire counter_next0_carry_i_2_n_0;
  wire counter_next0_carry_i_3_n_0;
  wire counter_next0_carry_i_4_n_0;
  wire counter_next0_carry_i_5_n_0;
  wire counter_next0_carry_i_6_n_0;
  wire counter_next0_carry_i_7_n_0;
  wire counter_next0_carry_i_8_n_0;
  wire counter_next0_carry_n_0;
  wire counter_next0_carry_n_1;
  wire counter_next0_carry_n_2;
  wire counter_next0_carry_n_3;
  wire [31:1]counter_next1;
  wire counter_next1_carry__0_i_1_n_0;
  wire counter_next1_carry__0_i_2_n_0;
  wire counter_next1_carry__0_i_3_n_0;
  wire counter_next1_carry__0_i_4_n_0;
  wire counter_next1_carry__0_n_0;
  wire counter_next1_carry__0_n_1;
  wire counter_next1_carry__0_n_2;
  wire counter_next1_carry__0_n_3;
  wire counter_next1_carry__1_i_1_n_0;
  wire counter_next1_carry__1_i_2_n_0;
  wire counter_next1_carry__1_i_3_n_0;
  wire counter_next1_carry__1_i_4_n_0;
  wire counter_next1_carry__1_n_0;
  wire counter_next1_carry__1_n_1;
  wire counter_next1_carry__1_n_2;
  wire counter_next1_carry__1_n_3;
  wire counter_next1_carry__2_i_1_n_0;
  wire counter_next1_carry__2_i_2_n_0;
  wire counter_next1_carry__2_i_3_n_0;
  wire counter_next1_carry__2_i_4_n_0;
  wire counter_next1_carry__2_n_0;
  wire counter_next1_carry__2_n_1;
  wire counter_next1_carry__2_n_2;
  wire counter_next1_carry__2_n_3;
  wire counter_next1_carry__3_i_1_n_0;
  wire counter_next1_carry__3_i_2_n_0;
  wire counter_next1_carry__3_i_3_n_0;
  wire counter_next1_carry__3_i_4_n_0;
  wire counter_next1_carry__3_n_0;
  wire counter_next1_carry__3_n_1;
  wire counter_next1_carry__3_n_2;
  wire counter_next1_carry__3_n_3;
  wire counter_next1_carry__4_i_1_n_0;
  wire counter_next1_carry__4_i_2_n_0;
  wire counter_next1_carry__4_i_3_n_0;
  wire counter_next1_carry__4_i_4_n_0;
  wire counter_next1_carry__4_n_0;
  wire counter_next1_carry__4_n_1;
  wire counter_next1_carry__4_n_2;
  wire counter_next1_carry__4_n_3;
  wire counter_next1_carry__5_i_1_n_0;
  wire counter_next1_carry__5_i_2_n_0;
  wire counter_next1_carry__5_i_3_n_0;
  wire counter_next1_carry__5_i_4_n_0;
  wire counter_next1_carry__5_n_0;
  wire counter_next1_carry__5_n_1;
  wire counter_next1_carry__5_n_2;
  wire counter_next1_carry__5_n_3;
  wire counter_next1_carry__6_i_1_n_0;
  wire counter_next1_carry__6_i_2_n_0;
  wire counter_next1_carry__6_i_3_n_0;
  wire counter_next1_carry__6_n_2;
  wire counter_next1_carry__6_n_3;
  wire counter_next1_carry_i_1_n_0;
  wire counter_next1_carry_i_2_n_0;
  wire counter_next1_carry_i_3_n_0;
  wire counter_next1_carry_i_4_n_0;
  wire counter_next1_carry_n_0;
  wire counter_next1_carry_n_1;
  wire counter_next1_carry_n_2;
  wire counter_next1_carry_n_3;
  wire [31:0]counter_output;
  wire \counter_output[31]_i_2_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_1 ;
  wire \counter_reg[0]_i_1_n_2 ;
  wire \counter_reg[0]_i_1_n_3 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \cycle[0]_i_1_n_0 ;
  wire \cycle[0]_i_2_n_0 ;
  wire \cycle[0]_i_4_n_0 ;
  wire [31:0]cycle_reg;
  wire \cycle_reg[0]_i_3_n_0 ;
  wire \cycle_reg[0]_i_3_n_1 ;
  wire \cycle_reg[0]_i_3_n_2 ;
  wire \cycle_reg[0]_i_3_n_3 ;
  wire \cycle_reg[0]_i_3_n_4 ;
  wire \cycle_reg[0]_i_3_n_5 ;
  wire \cycle_reg[0]_i_3_n_6 ;
  wire \cycle_reg[0]_i_3_n_7 ;
  wire \cycle_reg[12]_i_1_n_0 ;
  wire \cycle_reg[12]_i_1_n_1 ;
  wire \cycle_reg[12]_i_1_n_2 ;
  wire \cycle_reg[12]_i_1_n_3 ;
  wire \cycle_reg[12]_i_1_n_4 ;
  wire \cycle_reg[12]_i_1_n_5 ;
  wire \cycle_reg[12]_i_1_n_6 ;
  wire \cycle_reg[12]_i_1_n_7 ;
  wire \cycle_reg[16]_i_1_n_0 ;
  wire \cycle_reg[16]_i_1_n_1 ;
  wire \cycle_reg[16]_i_1_n_2 ;
  wire \cycle_reg[16]_i_1_n_3 ;
  wire \cycle_reg[16]_i_1_n_4 ;
  wire \cycle_reg[16]_i_1_n_5 ;
  wire \cycle_reg[16]_i_1_n_6 ;
  wire \cycle_reg[16]_i_1_n_7 ;
  wire \cycle_reg[20]_i_1_n_0 ;
  wire \cycle_reg[20]_i_1_n_1 ;
  wire \cycle_reg[20]_i_1_n_2 ;
  wire \cycle_reg[20]_i_1_n_3 ;
  wire \cycle_reg[20]_i_1_n_4 ;
  wire \cycle_reg[20]_i_1_n_5 ;
  wire \cycle_reg[20]_i_1_n_6 ;
  wire \cycle_reg[20]_i_1_n_7 ;
  wire \cycle_reg[24]_i_1_n_0 ;
  wire \cycle_reg[24]_i_1_n_1 ;
  wire \cycle_reg[24]_i_1_n_2 ;
  wire \cycle_reg[24]_i_1_n_3 ;
  wire \cycle_reg[24]_i_1_n_4 ;
  wire \cycle_reg[24]_i_1_n_5 ;
  wire \cycle_reg[24]_i_1_n_6 ;
  wire \cycle_reg[24]_i_1_n_7 ;
  wire \cycle_reg[28]_i_1_n_1 ;
  wire \cycle_reg[28]_i_1_n_2 ;
  wire \cycle_reg[28]_i_1_n_3 ;
  wire \cycle_reg[28]_i_1_n_4 ;
  wire \cycle_reg[28]_i_1_n_5 ;
  wire \cycle_reg[28]_i_1_n_6 ;
  wire \cycle_reg[28]_i_1_n_7 ;
  wire \cycle_reg[4]_i_1_n_0 ;
  wire \cycle_reg[4]_i_1_n_1 ;
  wire \cycle_reg[4]_i_1_n_2 ;
  wire \cycle_reg[4]_i_1_n_3 ;
  wire \cycle_reg[4]_i_1_n_4 ;
  wire \cycle_reg[4]_i_1_n_5 ;
  wire \cycle_reg[4]_i_1_n_6 ;
  wire \cycle_reg[4]_i_1_n_7 ;
  wire \cycle_reg[8]_i_1_n_0 ;
  wire \cycle_reg[8]_i_1_n_1 ;
  wire \cycle_reg[8]_i_1_n_2 ;
  wire \cycle_reg[8]_i_1_n_3 ;
  wire \cycle_reg[8]_i_1_n_4 ;
  wire \cycle_reg[8]_i_1_n_5 ;
  wire \cycle_reg[8]_i_1_n_6 ;
  wire \cycle_reg[8]_i_1_n_7 ;
  wire p_0_in;
  wire rst;
  wire state;
  wire state_i_1_n_0;
  wire state_next1__6_carry__0_i_1_n_0;
  wire state_next1__6_carry__0_i_2_n_0;
  wire state_next1__6_carry__0_i_3_n_0;
  wire state_next1__6_carry__0_i_4_n_0;
  wire state_next1__6_carry__0_i_5_n_0;
  wire state_next1__6_carry__0_i_6_n_0;
  wire state_next1__6_carry__0_n_1;
  wire state_next1__6_carry__0_n_2;
  wire state_next1__6_carry__0_n_3;
  wire state_next1__6_carry_i_1_n_0;
  wire state_next1__6_carry_i_2_n_0;
  wire state_next1__6_carry_i_3_n_0;
  wire state_next1__6_carry_i_4_n_0;
  wire state_next1__6_carry_i_5_n_0;
  wire state_next1__6_carry_i_6_n_0;
  wire state_next1__6_carry_i_7_n_0;
  wire state_next1__6_carry_i_8_n_0;
  wire state_next1__6_carry_n_0;
  wire state_next1__6_carry_n_1;
  wire state_next1__6_carry_n_2;
  wire state_next1__6_carry_n_3;
  wire state_next1_carry__0_i_1_n_0;
  wire state_next1_carry__0_i_2_n_0;
  wire state_next1_carry__0_i_3_n_0;
  wire state_next1_carry__0_i_4_n_0;
  wire state_next1_carry__0_n_1;
  wire state_next1_carry__0_n_2;
  wire state_next1_carry__0_n_3;
  wire state_next1_carry_i_1_n_0;
  wire state_next1_carry_i_2_n_0;
  wire state_next1_carry_i_3_n_0;
  wire state_next1_carry_i_4_n_0;
  wire state_next1_carry_i_5_n_0;
  wire state_next1_carry_i_6_n_0;
  wire state_next1_carry_n_0;
  wire state_next1_carry_n_1;
  wire state_next1_carry_n_2;
  wire state_next1_carry_n_3;
  wire [3:0]NLW_counter_next0_carry_O_UNCONNECTED;
  wire [3:0]NLW_counter_next0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_counter_next0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_counter_next0_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_counter_next1_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_counter_next1_carry__6_O_UNCONNECTED;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_cycle_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_state_next1__6_carry_O_UNCONNECTED;
  wire [3:3]NLW_state_next1__6_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_state_next1__6_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_state_next1_carry_O_UNCONNECTED;
  wire [3:3]NLW_state_next1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_state_next1_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_2 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_2_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter_next0_carry
       (.CI(1'b0),
        .CO({counter_next0_carry_n_0,counter_next0_carry_n_1,counter_next0_carry_n_2,counter_next0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({counter_next0_carry_i_1_n_0,counter_next0_carry_i_2_n_0,counter_next0_carry_i_3_n_0,counter_next0_carry_i_4_n_0}),
        .O(NLW_counter_next0_carry_O_UNCONNECTED[3:0]),
        .S({counter_next0_carry_i_5_n_0,counter_next0_carry_i_6_n_0,counter_next0_carry_i_7_n_0,counter_next0_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter_next0_carry__0
       (.CI(counter_next0_carry_n_0),
        .CO({counter_next0_carry__0_n_0,counter_next0_carry__0_n_1,counter_next0_carry__0_n_2,counter_next0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({counter_next0_carry__0_i_1_n_0,counter_next0_carry__0_i_2_n_0,counter_next0_carry__0_i_3_n_0,counter_next0_carry__0_i_4_n_0}),
        .O(NLW_counter_next0_carry__0_O_UNCONNECTED[3:0]),
        .S({counter_next0_carry__0_i_5_n_0,counter_next0_carry__0_i_6_n_0,counter_next0_carry__0_i_7_n_0,counter_next0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__0_i_1
       (.I0(cycle_reg[14]),
        .I1(counter_next1[14]),
        .I2(counter_next1[15]),
        .I3(cycle_reg[15]),
        .O(counter_next0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__0_i_2
       (.I0(cycle_reg[12]),
        .I1(counter_next1[12]),
        .I2(counter_next1[13]),
        .I3(cycle_reg[13]),
        .O(counter_next0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__0_i_3
       (.I0(cycle_reg[10]),
        .I1(counter_next1[10]),
        .I2(counter_next1[11]),
        .I3(cycle_reg[11]),
        .O(counter_next0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__0_i_4
       (.I0(cycle_reg[8]),
        .I1(counter_next1[8]),
        .I2(counter_next1[9]),
        .I3(cycle_reg[9]),
        .O(counter_next0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__0_i_5
       (.I0(cycle_reg[14]),
        .I1(counter_next1[14]),
        .I2(cycle_reg[15]),
        .I3(counter_next1[15]),
        .O(counter_next0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__0_i_6
       (.I0(cycle_reg[12]),
        .I1(counter_next1[12]),
        .I2(cycle_reg[13]),
        .I3(counter_next1[13]),
        .O(counter_next0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__0_i_7
       (.I0(cycle_reg[10]),
        .I1(counter_next1[10]),
        .I2(cycle_reg[11]),
        .I3(counter_next1[11]),
        .O(counter_next0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__0_i_8
       (.I0(cycle_reg[8]),
        .I1(counter_next1[8]),
        .I2(cycle_reg[9]),
        .I3(counter_next1[9]),
        .O(counter_next0_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter_next0_carry__1
       (.CI(counter_next0_carry__0_n_0),
        .CO({counter_next0_carry__1_n_0,counter_next0_carry__1_n_1,counter_next0_carry__1_n_2,counter_next0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({counter_next0_carry__1_i_1_n_0,counter_next0_carry__1_i_2_n_0,counter_next0_carry__1_i_3_n_0,counter_next0_carry__1_i_4_n_0}),
        .O(NLW_counter_next0_carry__1_O_UNCONNECTED[3:0]),
        .S({counter_next0_carry__1_i_5_n_0,counter_next0_carry__1_i_6_n_0,counter_next0_carry__1_i_7_n_0,counter_next0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__1_i_1
       (.I0(cycle_reg[22]),
        .I1(counter_next1[22]),
        .I2(counter_next1[23]),
        .I3(cycle_reg[23]),
        .O(counter_next0_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__1_i_2
       (.I0(cycle_reg[20]),
        .I1(counter_next1[20]),
        .I2(counter_next1[21]),
        .I3(cycle_reg[21]),
        .O(counter_next0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__1_i_3
       (.I0(cycle_reg[18]),
        .I1(counter_next1[18]),
        .I2(counter_next1[19]),
        .I3(cycle_reg[19]),
        .O(counter_next0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__1_i_4
       (.I0(cycle_reg[16]),
        .I1(counter_next1[16]),
        .I2(counter_next1[17]),
        .I3(cycle_reg[17]),
        .O(counter_next0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__1_i_5
       (.I0(cycle_reg[22]),
        .I1(counter_next1[22]),
        .I2(cycle_reg[23]),
        .I3(counter_next1[23]),
        .O(counter_next0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__1_i_6
       (.I0(cycle_reg[20]),
        .I1(counter_next1[20]),
        .I2(cycle_reg[21]),
        .I3(counter_next1[21]),
        .O(counter_next0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__1_i_7
       (.I0(cycle_reg[18]),
        .I1(counter_next1[18]),
        .I2(cycle_reg[19]),
        .I3(counter_next1[19]),
        .O(counter_next0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__1_i_8
       (.I0(cycle_reg[16]),
        .I1(counter_next1[16]),
        .I2(cycle_reg[17]),
        .I3(counter_next1[17]),
        .O(counter_next0_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter_next0_carry__2
       (.CI(counter_next0_carry__1_n_0),
        .CO({counter_next0_carry__2_n_0,counter_next0_carry__2_n_1,counter_next0_carry__2_n_2,counter_next0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({counter_next0_carry__2_i_1_n_0,counter_next0_carry__2_i_2_n_0,counter_next0_carry__2_i_3_n_0,counter_next0_carry__2_i_4_n_0}),
        .O(NLW_counter_next0_carry__2_O_UNCONNECTED[3:0]),
        .S({counter_next0_carry__2_i_5_n_0,counter_next0_carry__2_i_6_n_0,counter_next0_carry__2_i_7_n_0,counter_next0_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__2_i_1
       (.I0(cycle_reg[30]),
        .I1(counter_next1[30]),
        .I2(counter_next1[31]),
        .I3(cycle_reg[31]),
        .O(counter_next0_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__2_i_2
       (.I0(cycle_reg[28]),
        .I1(counter_next1[28]),
        .I2(counter_next1[29]),
        .I3(cycle_reg[29]),
        .O(counter_next0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__2_i_3
       (.I0(cycle_reg[26]),
        .I1(counter_next1[26]),
        .I2(counter_next1[27]),
        .I3(cycle_reg[27]),
        .O(counter_next0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry__2_i_4
       (.I0(cycle_reg[24]),
        .I1(counter_next1[24]),
        .I2(counter_next1[25]),
        .I3(cycle_reg[25]),
        .O(counter_next0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__2_i_5
       (.I0(cycle_reg[30]),
        .I1(counter_next1[30]),
        .I2(cycle_reg[31]),
        .I3(counter_next1[31]),
        .O(counter_next0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__2_i_6
       (.I0(cycle_reg[28]),
        .I1(counter_next1[28]),
        .I2(cycle_reg[29]),
        .I3(counter_next1[29]),
        .O(counter_next0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__2_i_7
       (.I0(cycle_reg[26]),
        .I1(counter_next1[26]),
        .I2(cycle_reg[27]),
        .I3(counter_next1[27]),
        .O(counter_next0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry__2_i_8
       (.I0(cycle_reg[24]),
        .I1(counter_next1[24]),
        .I2(cycle_reg[25]),
        .I3(counter_next1[25]),
        .O(counter_next0_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry_i_1
       (.I0(cycle_reg[6]),
        .I1(counter_next1[6]),
        .I2(counter_next1[7]),
        .I3(cycle_reg[7]),
        .O(counter_next0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry_i_2
       (.I0(cycle_reg[4]),
        .I1(counter_next1[4]),
        .I2(counter_next1[5]),
        .I3(cycle_reg[5]),
        .O(counter_next0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter_next0_carry_i_3
       (.I0(cycle_reg[2]),
        .I1(counter_next1[2]),
        .I2(counter_next1[3]),
        .I3(cycle_reg[3]),
        .O(counter_next0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8F08)) 
    counter_next0_carry_i_4
       (.I0(Ncycles[0]),
        .I1(cycle_reg[0]),
        .I2(counter_next1[1]),
        .I3(cycle_reg[1]),
        .O(counter_next0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry_i_5
       (.I0(cycle_reg[6]),
        .I1(counter_next1[6]),
        .I2(cycle_reg[7]),
        .I3(counter_next1[7]),
        .O(counter_next0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry_i_6
       (.I0(cycle_reg[4]),
        .I1(counter_next1[4]),
        .I2(cycle_reg[5]),
        .I3(counter_next1[5]),
        .O(counter_next0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter_next0_carry_i_7
       (.I0(cycle_reg[2]),
        .I1(counter_next1[2]),
        .I2(cycle_reg[3]),
        .I3(counter_next1[3]),
        .O(counter_next0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    counter_next0_carry_i_8
       (.I0(cycle_reg[0]),
        .I1(Ncycles[0]),
        .I2(cycle_reg[1]),
        .I3(counter_next1[1]),
        .O(counter_next0_carry_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry
       (.CI(1'b0),
        .CO({counter_next1_carry_n_0,counter_next1_carry_n_1,counter_next1_carry_n_2,counter_next1_carry_n_3}),
        .CYINIT(Ncycles[0]),
        .DI(Ncycles[4:1]),
        .O(counter_next1[4:1]),
        .S({counter_next1_carry_i_1_n_0,counter_next1_carry_i_2_n_0,counter_next1_carry_i_3_n_0,counter_next1_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__0
       (.CI(counter_next1_carry_n_0),
        .CO({counter_next1_carry__0_n_0,counter_next1_carry__0_n_1,counter_next1_carry__0_n_2,counter_next1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[8:5]),
        .O(counter_next1[8:5]),
        .S({counter_next1_carry__0_i_1_n_0,counter_next1_carry__0_i_2_n_0,counter_next1_carry__0_i_3_n_0,counter_next1_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__0_i_1
       (.I0(Ncycles[8]),
        .O(counter_next1_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__0_i_2
       (.I0(Ncycles[7]),
        .O(counter_next1_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__0_i_3
       (.I0(Ncycles[6]),
        .O(counter_next1_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__0_i_4
       (.I0(Ncycles[5]),
        .O(counter_next1_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__1
       (.CI(counter_next1_carry__0_n_0),
        .CO({counter_next1_carry__1_n_0,counter_next1_carry__1_n_1,counter_next1_carry__1_n_2,counter_next1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[12:9]),
        .O(counter_next1[12:9]),
        .S({counter_next1_carry__1_i_1_n_0,counter_next1_carry__1_i_2_n_0,counter_next1_carry__1_i_3_n_0,counter_next1_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__1_i_1
       (.I0(Ncycles[12]),
        .O(counter_next1_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__1_i_2
       (.I0(Ncycles[11]),
        .O(counter_next1_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__1_i_3
       (.I0(Ncycles[10]),
        .O(counter_next1_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__1_i_4
       (.I0(Ncycles[9]),
        .O(counter_next1_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__2
       (.CI(counter_next1_carry__1_n_0),
        .CO({counter_next1_carry__2_n_0,counter_next1_carry__2_n_1,counter_next1_carry__2_n_2,counter_next1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[16:13]),
        .O(counter_next1[16:13]),
        .S({counter_next1_carry__2_i_1_n_0,counter_next1_carry__2_i_2_n_0,counter_next1_carry__2_i_3_n_0,counter_next1_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__2_i_1
       (.I0(Ncycles[16]),
        .O(counter_next1_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__2_i_2
       (.I0(Ncycles[15]),
        .O(counter_next1_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__2_i_3
       (.I0(Ncycles[14]),
        .O(counter_next1_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__2_i_4
       (.I0(Ncycles[13]),
        .O(counter_next1_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__3
       (.CI(counter_next1_carry__2_n_0),
        .CO({counter_next1_carry__3_n_0,counter_next1_carry__3_n_1,counter_next1_carry__3_n_2,counter_next1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[20:17]),
        .O(counter_next1[20:17]),
        .S({counter_next1_carry__3_i_1_n_0,counter_next1_carry__3_i_2_n_0,counter_next1_carry__3_i_3_n_0,counter_next1_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__3_i_1
       (.I0(Ncycles[20]),
        .O(counter_next1_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__3_i_2
       (.I0(Ncycles[19]),
        .O(counter_next1_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__3_i_3
       (.I0(Ncycles[18]),
        .O(counter_next1_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__3_i_4
       (.I0(Ncycles[17]),
        .O(counter_next1_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__4
       (.CI(counter_next1_carry__3_n_0),
        .CO({counter_next1_carry__4_n_0,counter_next1_carry__4_n_1,counter_next1_carry__4_n_2,counter_next1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[24:21]),
        .O(counter_next1[24:21]),
        .S({counter_next1_carry__4_i_1_n_0,counter_next1_carry__4_i_2_n_0,counter_next1_carry__4_i_3_n_0,counter_next1_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__4_i_1
       (.I0(Ncycles[24]),
        .O(counter_next1_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__4_i_2
       (.I0(Ncycles[23]),
        .O(counter_next1_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__4_i_3
       (.I0(Ncycles[22]),
        .O(counter_next1_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__4_i_4
       (.I0(Ncycles[21]),
        .O(counter_next1_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__5
       (.CI(counter_next1_carry__4_n_0),
        .CO({counter_next1_carry__5_n_0,counter_next1_carry__5_n_1,counter_next1_carry__5_n_2,counter_next1_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(Ncycles[28:25]),
        .O(counter_next1[28:25]),
        .S({counter_next1_carry__5_i_1_n_0,counter_next1_carry__5_i_2_n_0,counter_next1_carry__5_i_3_n_0,counter_next1_carry__5_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__5_i_1
       (.I0(Ncycles[28]),
        .O(counter_next1_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__5_i_2
       (.I0(Ncycles[27]),
        .O(counter_next1_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__5_i_3
       (.I0(Ncycles[26]),
        .O(counter_next1_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__5_i_4
       (.I0(Ncycles[25]),
        .O(counter_next1_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_next1_carry__6
       (.CI(counter_next1_carry__5_n_0),
        .CO({NLW_counter_next1_carry__6_CO_UNCONNECTED[3:2],counter_next1_carry__6_n_2,counter_next1_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Ncycles[30:29]}),
        .O({NLW_counter_next1_carry__6_O_UNCONNECTED[3],counter_next1[31:29]}),
        .S({1'b0,counter_next1_carry__6_i_1_n_0,counter_next1_carry__6_i_2_n_0,counter_next1_carry__6_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__6_i_1
       (.I0(Ncycles[31]),
        .O(counter_next1_carry__6_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__6_i_2
       (.I0(Ncycles[30]),
        .O(counter_next1_carry__6_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry__6_i_3
       (.I0(Ncycles[29]),
        .O(counter_next1_carry__6_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry_i_1
       (.I0(Ncycles[4]),
        .O(counter_next1_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry_i_2
       (.I0(Ncycles[3]),
        .O(counter_next1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry_i_3
       (.I0(Ncycles[2]),
        .O(counter_next1_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter_next1_carry_i_4
       (.I0(Ncycles[1]),
        .O(counter_next1_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_output[31]_i_1 
       (.I0(rst),
        .O(p_0_in));
  LUT3 #(
    .INIT(8'h40)) 
    \counter_output[31]_i_2 
       (.I0(state),
        .I1(state_next1_carry__0_n_1),
        .I2(counter_next0_carry__2_n_0),
        .O(\counter_output[31]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[0] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[0]),
        .Q(counter_output[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[10] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[10]),
        .Q(counter_output[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[11] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[11]),
        .Q(counter_output[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[12] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[12]),
        .Q(counter_output[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[13] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[13]),
        .Q(counter_output[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[14] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[14]),
        .Q(counter_output[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[15] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[15]),
        .Q(counter_output[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[16] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[16]),
        .Q(counter_output[16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[17] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[17]),
        .Q(counter_output[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[18] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[18]),
        .Q(counter_output[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[19] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[19]),
        .Q(counter_output[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[1] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[1]),
        .Q(counter_output[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[20] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[20]),
        .Q(counter_output[20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[21] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[21]),
        .Q(counter_output[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[22] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[22]),
        .Q(counter_output[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[23] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[23]),
        .Q(counter_output[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[24] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[24]),
        .Q(counter_output[24]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[25] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[25]),
        .Q(counter_output[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[26] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[26]),
        .Q(counter_output[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[27] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[27]),
        .Q(counter_output[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[28] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[28]),
        .Q(counter_output[28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[29] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[29]),
        .Q(counter_output[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[2] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[2]),
        .Q(counter_output[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[30] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[30]),
        .Q(counter_output[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[31] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[31]),
        .Q(counter_output[31]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[3] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[3]),
        .Q(counter_output[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[4] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[4]),
        .Q(counter_output[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[5] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[5]),
        .Q(counter_output[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[6] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[6]),
        .Q(counter_output[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[7] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[7]),
        .Q(counter_output[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[8] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[8]),
        .Q(counter_output[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_output_reg[9] 
       (.C(clk),
        .CE(\counter_output[31]_i_2_n_0 ),
        .D(counter_reg[9]),
        .Q(counter_output[9]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(counter_reg[0]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\counter_reg[0]_i_1_n_1 ,\counter_reg[0]_i_1_n_2 ,\counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(counter_reg[1]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3],\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(counter_reg[2]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(counter_reg[3]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\cycle[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h08FF)) 
    \cycle[0]_i_1 
       (.I0(counter_next0_carry__2_n_0),
        .I1(state_next1_carry__0_n_1),
        .I2(state),
        .I3(rst),
        .O(\cycle[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cycle[0]_i_2 
       (.I0(state_next1_carry__0_n_1),
        .I1(state),
        .O(\cycle[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cycle[0]_i_4 
       (.I0(cycle_reg[0]),
        .O(\cycle[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[0] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[0]_i_3_n_7 ),
        .Q(cycle_reg[0]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\cycle_reg[0]_i_3_n_0 ,\cycle_reg[0]_i_3_n_1 ,\cycle_reg[0]_i_3_n_2 ,\cycle_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cycle_reg[0]_i_3_n_4 ,\cycle_reg[0]_i_3_n_5 ,\cycle_reg[0]_i_3_n_6 ,\cycle_reg[0]_i_3_n_7 }),
        .S({cycle_reg[3:1],\cycle[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[10] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[8]_i_1_n_5 ),
        .Q(cycle_reg[10]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[11] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[8]_i_1_n_4 ),
        .Q(cycle_reg[11]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[12] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[12]_i_1_n_7 ),
        .Q(cycle_reg[12]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[12]_i_1 
       (.CI(\cycle_reg[8]_i_1_n_0 ),
        .CO({\cycle_reg[12]_i_1_n_0 ,\cycle_reg[12]_i_1_n_1 ,\cycle_reg[12]_i_1_n_2 ,\cycle_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[12]_i_1_n_4 ,\cycle_reg[12]_i_1_n_5 ,\cycle_reg[12]_i_1_n_6 ,\cycle_reg[12]_i_1_n_7 }),
        .S(cycle_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[13] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[12]_i_1_n_6 ),
        .Q(cycle_reg[13]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[14] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[12]_i_1_n_5 ),
        .Q(cycle_reg[14]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[15] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[12]_i_1_n_4 ),
        .Q(cycle_reg[15]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[16] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[16]_i_1_n_7 ),
        .Q(cycle_reg[16]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[16]_i_1 
       (.CI(\cycle_reg[12]_i_1_n_0 ),
        .CO({\cycle_reg[16]_i_1_n_0 ,\cycle_reg[16]_i_1_n_1 ,\cycle_reg[16]_i_1_n_2 ,\cycle_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[16]_i_1_n_4 ,\cycle_reg[16]_i_1_n_5 ,\cycle_reg[16]_i_1_n_6 ,\cycle_reg[16]_i_1_n_7 }),
        .S(cycle_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[17] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[16]_i_1_n_6 ),
        .Q(cycle_reg[17]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[18] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[16]_i_1_n_5 ),
        .Q(cycle_reg[18]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[19] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[16]_i_1_n_4 ),
        .Q(cycle_reg[19]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[1] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[0]_i_3_n_6 ),
        .Q(cycle_reg[1]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[20] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[20]_i_1_n_7 ),
        .Q(cycle_reg[20]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[20]_i_1 
       (.CI(\cycle_reg[16]_i_1_n_0 ),
        .CO({\cycle_reg[20]_i_1_n_0 ,\cycle_reg[20]_i_1_n_1 ,\cycle_reg[20]_i_1_n_2 ,\cycle_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[20]_i_1_n_4 ,\cycle_reg[20]_i_1_n_5 ,\cycle_reg[20]_i_1_n_6 ,\cycle_reg[20]_i_1_n_7 }),
        .S(cycle_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[21] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[20]_i_1_n_6 ),
        .Q(cycle_reg[21]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[22] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[20]_i_1_n_5 ),
        .Q(cycle_reg[22]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[23] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[20]_i_1_n_4 ),
        .Q(cycle_reg[23]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[24] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[24]_i_1_n_7 ),
        .Q(cycle_reg[24]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[24]_i_1 
       (.CI(\cycle_reg[20]_i_1_n_0 ),
        .CO({\cycle_reg[24]_i_1_n_0 ,\cycle_reg[24]_i_1_n_1 ,\cycle_reg[24]_i_1_n_2 ,\cycle_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[24]_i_1_n_4 ,\cycle_reg[24]_i_1_n_5 ,\cycle_reg[24]_i_1_n_6 ,\cycle_reg[24]_i_1_n_7 }),
        .S(cycle_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[25] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[24]_i_1_n_6 ),
        .Q(cycle_reg[25]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[26] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[24]_i_1_n_5 ),
        .Q(cycle_reg[26]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[27] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[24]_i_1_n_4 ),
        .Q(cycle_reg[27]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[28] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[28]_i_1_n_7 ),
        .Q(cycle_reg[28]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[28]_i_1 
       (.CI(\cycle_reg[24]_i_1_n_0 ),
        .CO({\NLW_cycle_reg[28]_i_1_CO_UNCONNECTED [3],\cycle_reg[28]_i_1_n_1 ,\cycle_reg[28]_i_1_n_2 ,\cycle_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[28]_i_1_n_4 ,\cycle_reg[28]_i_1_n_5 ,\cycle_reg[28]_i_1_n_6 ,\cycle_reg[28]_i_1_n_7 }),
        .S(cycle_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[29] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[28]_i_1_n_6 ),
        .Q(cycle_reg[29]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[2] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[0]_i_3_n_5 ),
        .Q(cycle_reg[2]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[30] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[28]_i_1_n_5 ),
        .Q(cycle_reg[30]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[31] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[28]_i_1_n_4 ),
        .Q(cycle_reg[31]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[3] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[0]_i_3_n_4 ),
        .Q(cycle_reg[3]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[4] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[4]_i_1_n_7 ),
        .Q(cycle_reg[4]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[4]_i_1 
       (.CI(\cycle_reg[0]_i_3_n_0 ),
        .CO({\cycle_reg[4]_i_1_n_0 ,\cycle_reg[4]_i_1_n_1 ,\cycle_reg[4]_i_1_n_2 ,\cycle_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[4]_i_1_n_4 ,\cycle_reg[4]_i_1_n_5 ,\cycle_reg[4]_i_1_n_6 ,\cycle_reg[4]_i_1_n_7 }),
        .S(cycle_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[5] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[4]_i_1_n_6 ),
        .Q(cycle_reg[5]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[6] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[4]_i_1_n_5 ),
        .Q(cycle_reg[6]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[7] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[4]_i_1_n_4 ),
        .Q(cycle_reg[7]),
        .R(\cycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[8] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[8]_i_1_n_7 ),
        .Q(cycle_reg[8]),
        .R(\cycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_reg[8]_i_1 
       (.CI(\cycle_reg[4]_i_1_n_0 ),
        .CO({\cycle_reg[8]_i_1_n_0 ,\cycle_reg[8]_i_1_n_1 ,\cycle_reg[8]_i_1_n_2 ,\cycle_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_reg[8]_i_1_n_4 ,\cycle_reg[8]_i_1_n_5 ,\cycle_reg[8]_i_1_n_6 ,\cycle_reg[8]_i_1_n_7 }),
        .S(cycle_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_reg[9] 
       (.C(clk),
        .CE(\cycle[0]_i_2_n_0 ),
        .D(\cycle_reg[8]_i_1_n_6 ),
        .Q(cycle_reg[9]),
        .R(\cycle[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF200)) 
    state_i_1
       (.I0(state),
        .I1(state_next1__6_carry__0_n_1),
        .I2(state_next1_carry__0_n_1),
        .I3(rst),
        .O(state_i_1_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 state_next1__6_carry
       (.CI(1'b0),
        .CO({state_next1__6_carry_n_0,state_next1__6_carry_n_1,state_next1__6_carry_n_2,state_next1__6_carry_n_3}),
        .CYINIT(1'b0),
        .DI({state_next1__6_carry_i_1_n_0,state_next1__6_carry_i_2_n_0,state_next1__6_carry_i_3_n_0,state_next1__6_carry_i_4_n_0}),
        .O(NLW_state_next1__6_carry_O_UNCONNECTED[3:0]),
        .S({state_next1__6_carry_i_5_n_0,state_next1__6_carry_i_6_n_0,state_next1__6_carry_i_7_n_0,state_next1__6_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 state_next1__6_carry__0
       (.CI(state_next1__6_carry_n_0),
        .CO({NLW_state_next1__6_carry__0_CO_UNCONNECTED[3],state_next1__6_carry__0_n_1,state_next1__6_carry__0_n_2,state_next1__6_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,state_next1__6_carry__0_i_1_n_0,state_next1__6_carry__0_i_2_n_0,state_next1__6_carry__0_i_3_n_0}),
        .O(NLW_state_next1__6_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,state_next1__6_carry__0_i_4_n_0,state_next1__6_carry__0_i_5_n_0,state_next1__6_carry__0_i_6_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1__6_carry__0_i_1
       (.I0(S_AXIS_IN_tdata[13]),
        .I1(S_AXIS_IN_tdata[12]),
        .O(state_next1__6_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    state_next1__6_carry__0_i_2
       (.I0(S_AXIS_IN_tdata[10]),
        .I1(S_AXIS_IN_tdata[11]),
        .O(state_next1__6_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    state_next1__6_carry__0_i_3
       (.I0(S_AXIS_IN_tdata[8]),
        .I1(S_AXIS_IN_tdata[9]),
        .O(state_next1__6_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1__6_carry__0_i_4
       (.I0(S_AXIS_IN_tdata[12]),
        .I1(S_AXIS_IN_tdata[13]),
        .O(state_next1__6_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1__6_carry__0_i_5
       (.I0(S_AXIS_IN_tdata[10]),
        .I1(S_AXIS_IN_tdata[11]),
        .O(state_next1__6_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1__6_carry__0_i_6
       (.I0(S_AXIS_IN_tdata[8]),
        .I1(S_AXIS_IN_tdata[9]),
        .O(state_next1__6_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    state_next1__6_carry_i_1
       (.I0(S_AXIS_IN_tdata[6]),
        .I1(S_AXIS_IN_tdata[7]),
        .O(state_next1__6_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    state_next1__6_carry_i_2
       (.I0(S_AXIS_IN_tdata[5]),
        .O(state_next1__6_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    state_next1__6_carry_i_3
       (.I0(S_AXIS_IN_tdata[3]),
        .O(state_next1__6_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    state_next1__6_carry_i_4
       (.I0(S_AXIS_IN_tdata[1]),
        .O(state_next1__6_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1__6_carry_i_5
       (.I0(S_AXIS_IN_tdata[6]),
        .I1(S_AXIS_IN_tdata[7]),
        .O(state_next1__6_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1__6_carry_i_6
       (.I0(S_AXIS_IN_tdata[5]),
        .I1(S_AXIS_IN_tdata[4]),
        .O(state_next1__6_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1__6_carry_i_7
       (.I0(S_AXIS_IN_tdata[3]),
        .I1(S_AXIS_IN_tdata[2]),
        .O(state_next1__6_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1__6_carry_i_8
       (.I0(S_AXIS_IN_tdata[1]),
        .I1(S_AXIS_IN_tdata[0]),
        .O(state_next1__6_carry_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 state_next1_carry
       (.CI(1'b0),
        .CO({state_next1_carry_n_0,state_next1_carry_n_1,state_next1_carry_n_2,state_next1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({state_next1_carry_i_1_n_0,S_AXIS_IN_tdata[5],1'b0,state_next1_carry_i_2_n_0}),
        .O(NLW_state_next1_carry_O_UNCONNECTED[3:0]),
        .S({state_next1_carry_i_3_n_0,state_next1_carry_i_4_n_0,state_next1_carry_i_5_n_0,state_next1_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 state_next1_carry__0
       (.CI(state_next1_carry_n_0),
        .CO({NLW_state_next1_carry__0_CO_UNCONNECTED[3],state_next1_carry__0_n_1,state_next1_carry__0_n_2,state_next1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,state_next1_carry__0_i_1_n_0,1'b0,1'b0}),
        .O(NLW_state_next1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,state_next1_carry__0_i_2_n_0,state_next1_carry__0_i_3_n_0,state_next1_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    state_next1_carry__0_i_1
       (.I0(S_AXIS_IN_tdata[13]),
        .O(state_next1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1_carry__0_i_2
       (.I0(S_AXIS_IN_tdata[12]),
        .I1(S_AXIS_IN_tdata[13]),
        .O(state_next1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1_carry__0_i_3
       (.I0(S_AXIS_IN_tdata[10]),
        .I1(S_AXIS_IN_tdata[11]),
        .O(state_next1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1_carry__0_i_4
       (.I0(S_AXIS_IN_tdata[8]),
        .I1(S_AXIS_IN_tdata[9]),
        .O(state_next1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1_carry_i_1
       (.I0(S_AXIS_IN_tdata[6]),
        .I1(S_AXIS_IN_tdata[7]),
        .O(state_next1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    state_next1_carry_i_2
       (.I0(S_AXIS_IN_tdata[0]),
        .I1(S_AXIS_IN_tdata[1]),
        .O(state_next1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1_carry_i_3
       (.I0(S_AXIS_IN_tdata[7]),
        .I1(S_AXIS_IN_tdata[6]),
        .O(state_next1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    state_next1_carry_i_4
       (.I0(S_AXIS_IN_tdata[4]),
        .I1(S_AXIS_IN_tdata[5]),
        .O(state_next1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    state_next1_carry_i_5
       (.I0(S_AXIS_IN_tdata[2]),
        .I1(S_AXIS_IN_tdata[3]),
        .O(state_next1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    state_next1_carry_i_6
       (.I0(S_AXIS_IN_tdata[0]),
        .I1(S_AXIS_IN_tdata[1]),
        .O(state_next1_carry_i_6_n_0));
  FDRE state_reg
       (.C(clk),
        .CE(1'b1),
        .D(state_i_1_n_0),
        .Q(state),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "system_frequency_counter_0_0,frequency_counter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "frequency_counter,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (S_AXIS_IN_tdata,
    S_AXIS_IN_tvalid,
    clk,
    rst,
    Ncycles,
    M_AXIS_OUT_tdata,
    M_AXIS_OUT_tvalid,
    counter_output);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IN TDATA" *) (* X_INTERFACE_PARAMETER = "FREQ_HZ 125000000" *) input [31:0]S_AXIS_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IN TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_IN, FREQ_HZ 125000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input S_AXIS_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF M_AXIS_OUT:S_AXIS_IN, ASSOCIATED_RESET rst, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [31:0]Ncycles;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OUT TDATA" *) output [31:0]M_AXIS_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OUT TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output M_AXIS_OUT_tvalid;
  output [31:0]counter_output;

  wire \<const0> ;
  wire [31:0]Ncycles;
  wire [31:0]S_AXIS_IN_tdata;
  wire S_AXIS_IN_tvalid;
  wire clk;
  wire [31:0]counter_output;
  wire rst;

  assign M_AXIS_OUT_tdata[31] = \<const0> ;
  assign M_AXIS_OUT_tdata[30] = \<const0> ;
  assign M_AXIS_OUT_tdata[29] = \<const0> ;
  assign M_AXIS_OUT_tdata[28] = \<const0> ;
  assign M_AXIS_OUT_tdata[27] = \<const0> ;
  assign M_AXIS_OUT_tdata[26] = \<const0> ;
  assign M_AXIS_OUT_tdata[25] = \<const0> ;
  assign M_AXIS_OUT_tdata[24] = \<const0> ;
  assign M_AXIS_OUT_tdata[23] = \<const0> ;
  assign M_AXIS_OUT_tdata[22] = \<const0> ;
  assign M_AXIS_OUT_tdata[21] = \<const0> ;
  assign M_AXIS_OUT_tdata[20] = \<const0> ;
  assign M_AXIS_OUT_tdata[19] = \<const0> ;
  assign M_AXIS_OUT_tdata[18] = \<const0> ;
  assign M_AXIS_OUT_tdata[17] = \<const0> ;
  assign M_AXIS_OUT_tdata[16] = \<const0> ;
  assign M_AXIS_OUT_tdata[15] = \<const0> ;
  assign M_AXIS_OUT_tdata[14] = \<const0> ;
  assign M_AXIS_OUT_tdata[13:0] = S_AXIS_IN_tdata[13:0];
  assign M_AXIS_OUT_tvalid = S_AXIS_IN_tvalid;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter inst
       (.Ncycles(Ncycles),
        .S_AXIS_IN_tdata(S_AXIS_IN_tdata[13:0]),
        .clk(clk),
        .counter_output(counter_output),
        .rst(rst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
