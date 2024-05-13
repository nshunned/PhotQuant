-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Wed Mar 20 16:08:20 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/2_knight_rider/2_knight_rider.srcs/sources_1/bd/system/ip/system_knight_rider_1_0/system_knight_rider_1_0_stub.vhdl
-- Design      : system_knight_rider_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_knight_rider_1_0 is
  Port ( 
    clk : in STD_LOGIC;
    led_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end system_knight_rider_1_0;

architecture stub of system_knight_rider_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,led_out[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "knight_rider,Vivado 2020.1";
begin
end;
