
// file: red_pitaya_pll_mod.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// _clk_adc__125.00000______0.000______50.0______119.348_____96.948
// clk_dac_1x__125.00000______0.000______50.0______119.348_____96.948
// clk_dac_2x__250.00000______0.000______50.0______104.759_____96.948
// clk_dac_2p__250.00000____-45.000______50.0______104.759_____96.948
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________125.000____________0.010

`timescale 1ps/1ps

module red_pitaya_pll_mod_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        clk_adc,
  output        clk_dac_1x,
  output        clk_dac_2x,
  output        clk_dac_2p,
  // Status and control signals
  input         resetn,
  output        locked,
  input         clk_in1_p,
  input         clk_in1_n
 );
  // Input buffering
  //------------------------------------
wire clk_in1_red_pitaya_pll_mod;
wire clk_in2_red_pitaya_pll_mod;
  IBUFDS clkin1_ibufgds
   (.O  (clk_in1_red_pitaya_pll_mod),
    .I  (clk_in1_p),
    .IB (clk_in1_n));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_adc_red_pitaya_pll_mod;
  wire        clk_dac_1x_red_pitaya_pll_mod;
  wire        clk_dac_2x_red_pitaya_pll_mod;
  wire        clk_dac_2p_red_pitaya_pll_mod;
  wire        clk_src_out_red_pitaya_pll_mod;
  wire        clk_out6_red_pitaya_pll_mod;
  wire        clk_out7_red_pitaya_pll_mod;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_red_pitaya_pll_mod;
  wire        clkfbout_buf_red_pitaya_pll_mod;
  wire        clkfboutb_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

  PLLE2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT        (8),
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE       (8),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (8),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT2_DIVIDE       (4),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT3_DIVIDE       (4),
    .CLKOUT3_PHASE        (-45.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKIN1_PERIOD        (8.000))
  plle2_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_red_pitaya_pll_mod),
    .CLKOUT0             (clk_adc_red_pitaya_pll_mod),
    .CLKOUT1             (clk_dac_1x_red_pitaya_pll_mod),
    .CLKOUT2             (clk_dac_2x_red_pitaya_pll_mod),
    .CLKOUT3             (clk_dac_2p_red_pitaya_pll_mod),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_red_pitaya_pll_mod),
    .CLKIN1              (clk_in1_red_pitaya_pll_mod),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Other control and status signals
    .LOCKED              (locked_int),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = ~resetn; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_red_pitaya_pll_mod),
    .I (clkfbout_red_pitaya_pll_mod));






  BUFG clkout1_buf
   (.O   (clk_adc),
    .I   (clk_adc_red_pitaya_pll_mod));


  BUFG clkout2_buf
   (.O   (clk_dac_1x),
    .I   (clk_dac_1x_red_pitaya_pll_mod));

  BUFG clkout3_buf
   (.O   (clk_dac_2x),
    .I   (clk_dac_2x_red_pitaya_pll_mod));

  BUFG clkout4_buf
   (.O   (clk_dac_2p),
    .I   (clk_dac_2p_red_pitaya_pll_mod));



endmodule
