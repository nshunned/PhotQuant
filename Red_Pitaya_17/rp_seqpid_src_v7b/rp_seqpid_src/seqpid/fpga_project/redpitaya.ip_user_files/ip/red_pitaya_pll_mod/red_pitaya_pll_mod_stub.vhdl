-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Jan  8 13:02:59 2024
-- Host        : alexei-jeip running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid/fpga_project/redpitaya.srcs/sources_1/ip/red_pitaya_pll_mod/red_pitaya_pll_mod_stub.vhdl
-- Design      : red_pitaya_pll_mod
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity red_pitaya_pll_mod is
  Port ( 
    clk_adc : out STD_LOGIC;
    clk_dac_1x : out STD_LOGIC;
    clk_dac_2x : out STD_LOGIC;
    clk_dac_2p : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end red_pitaya_pll_mod;

architecture stub of red_pitaya_pll_mod is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_adc,clk_dac_1x,clk_dac_2x,clk_dac_2p,resetn,locked,clk_in1_p,clk_in1_n";
begin
end;
