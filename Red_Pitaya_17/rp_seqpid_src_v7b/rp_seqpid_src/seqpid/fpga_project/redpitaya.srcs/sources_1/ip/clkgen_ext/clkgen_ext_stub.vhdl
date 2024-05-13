-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Feb 28 23:33:06 2023
-- Host        : alexei-jeip running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid/fpga_project/redpitaya.srcs/sources_1/ip/clkgen_ext/clkgen_ext_stub.vhdl
-- Design      : clkgen_ext
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkgen_ext is
  Port ( 
    clk_adc : out STD_LOGIC;
    reset : in STD_LOGIC;
    input_clk_stopped : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clkgen_ext;

architecture stub of clkgen_ext is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_adc,reset,input_clk_stopped,locked,clk_in1";
begin
end;
