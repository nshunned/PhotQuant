-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 21 14:34:13 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_frequency_counter_0_0/system_frequency_counter_0_0_stub.vhdl
-- Design      : system_frequency_counter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_frequency_counter_0_0 is
  Port ( 
    S_AXIS_IN_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_IN_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    Ncycles : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_OUT_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_OUT_tvalid : out STD_LOGIC;
    counter_output : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end system_frequency_counter_0_0;

architecture stub of system_frequency_counter_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "S_AXIS_IN_tdata[31:0],S_AXIS_IN_tvalid,clk,rst,Ncycles[31:0],M_AXIS_OUT_tdata[31:0],M_AXIS_OUT_tvalid,counter_output[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "frequency_counter,Vivado 2020.1";
begin
end;
