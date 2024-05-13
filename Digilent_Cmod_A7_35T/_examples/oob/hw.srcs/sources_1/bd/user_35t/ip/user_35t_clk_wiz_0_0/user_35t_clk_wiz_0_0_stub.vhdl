-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Thu Nov  5 15:17:24 2020
-- Host        : K-Legion running 64-bit Kali GNU/Linux Rolling
-- Command     : write_vhdl -force -mode synth_stub
--               /home/ciprian/Documents/Github/Cmod-A7/hw/proj/hw.srcs/sources_1/bd/user_35t/ip/user_35t_clk_wiz_0_0/user_35t_clk_wiz_0_0_stub.vhdl
-- Design      : user_35t_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity user_35t_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end user_35t_clk_wiz_0_0;

architecture stub of user_35t_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;
