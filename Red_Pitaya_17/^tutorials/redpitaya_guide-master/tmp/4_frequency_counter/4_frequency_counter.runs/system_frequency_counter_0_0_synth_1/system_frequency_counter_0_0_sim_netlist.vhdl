-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 21 14:34:13 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_frequency_counter_0_0_sim_netlist.vhdl
-- Design      : system_frequency_counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter is
  port (
    counter_output : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_IN_tdata : in STD_LOGIC_VECTOR ( 13 downto 0 );
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    Ncycles : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter is
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__0_n_1\ : STD_LOGIC;
  signal \counter_next0_carry__0_n_2\ : STD_LOGIC;
  signal \counter_next0_carry__0_n_3\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__1_n_1\ : STD_LOGIC;
  signal \counter_next0_carry__1_n_2\ : STD_LOGIC;
  signal \counter_next0_carry__1_n_3\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_n_0\ : STD_LOGIC;
  signal \counter_next0_carry__2_n_1\ : STD_LOGIC;
  signal \counter_next0_carry__2_n_2\ : STD_LOGIC;
  signal \counter_next0_carry__2_n_3\ : STD_LOGIC;
  signal counter_next0_carry_i_1_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_2_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_3_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_4_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_5_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_6_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_7_n_0 : STD_LOGIC;
  signal counter_next0_carry_i_8_n_0 : STD_LOGIC;
  signal counter_next0_carry_n_0 : STD_LOGIC;
  signal counter_next0_carry_n_1 : STD_LOGIC;
  signal counter_next0_carry_n_2 : STD_LOGIC;
  signal counter_next0_carry_n_3 : STD_LOGIC;
  signal counter_next1 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \counter_next1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__0_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__0_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__0_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__0_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__1_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__1_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__1_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__2_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__2_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__2_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__3_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__3_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__3_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__4_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__4_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__4_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__5_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__5_n_1\ : STD_LOGIC;
  signal \counter_next1_carry__5_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__5_n_3\ : STD_LOGIC;
  signal \counter_next1_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \counter_next1_carry__6_n_2\ : STD_LOGIC;
  signal \counter_next1_carry__6_n_3\ : STD_LOGIC;
  signal counter_next1_carry_i_1_n_0 : STD_LOGIC;
  signal counter_next1_carry_i_2_n_0 : STD_LOGIC;
  signal counter_next1_carry_i_3_n_0 : STD_LOGIC;
  signal counter_next1_carry_i_4_n_0 : STD_LOGIC;
  signal counter_next1_carry_n_0 : STD_LOGIC;
  signal counter_next1_carry_n_1 : STD_LOGIC;
  signal counter_next1_carry_n_2 : STD_LOGIC;
  signal counter_next1_carry_n_3 : STD_LOGIC;
  signal \counter_output[31]_i_2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \cycle[0]_i_1_n_0\ : STD_LOGIC;
  signal \cycle[0]_i_2_n_0\ : STD_LOGIC;
  signal \cycle[0]_i_4_n_0\ : STD_LOGIC;
  signal cycle_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cycle_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \cycle_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \cycle_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal state : STD_LOGIC;
  signal state_i_1_n_0 : STD_LOGIC;
  signal \state_next1__6_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry__0_n_1\ : STD_LOGIC;
  signal \state_next1__6_carry__0_n_2\ : STD_LOGIC;
  signal \state_next1__6_carry__0_n_3\ : STD_LOGIC;
  signal \state_next1__6_carry_i_1_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_2_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_3_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_4_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_5_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_6_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_7_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_i_8_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_n_0\ : STD_LOGIC;
  signal \state_next1__6_carry_n_1\ : STD_LOGIC;
  signal \state_next1__6_carry_n_2\ : STD_LOGIC;
  signal \state_next1__6_carry_n_3\ : STD_LOGIC;
  signal \state_next1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \state_next1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \state_next1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \state_next1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \state_next1_carry__0_n_1\ : STD_LOGIC;
  signal \state_next1_carry__0_n_2\ : STD_LOGIC;
  signal \state_next1_carry__0_n_3\ : STD_LOGIC;
  signal state_next1_carry_i_1_n_0 : STD_LOGIC;
  signal state_next1_carry_i_2_n_0 : STD_LOGIC;
  signal state_next1_carry_i_3_n_0 : STD_LOGIC;
  signal state_next1_carry_i_4_n_0 : STD_LOGIC;
  signal state_next1_carry_i_5_n_0 : STD_LOGIC;
  signal state_next1_carry_i_6_n_0 : STD_LOGIC;
  signal state_next1_carry_n_0 : STD_LOGIC;
  signal state_next1_carry_n_1 : STD_LOGIC;
  signal state_next1_carry_n_2 : STD_LOGIC;
  signal state_next1_carry_n_3 : STD_LOGIC;
  signal NLW_counter_next0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_next0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_next0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_next0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_next1_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_next1_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cycle_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_state_next1__6_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_state_next1__6_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_state_next1__6_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_state_next1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_state_next1_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_state_next1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of counter_next0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \counter_next0_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \counter_next0_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \counter_next0_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of counter_next1_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_next1_carry__6\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cycle_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \state_next1__6_carry\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \state_next1__6_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of state_next1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \state_next1_carry__0\ : label is 11;
begin
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_2_n_0\
    );
counter_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter_next0_carry_n_0,
      CO(2) => counter_next0_carry_n_1,
      CO(1) => counter_next0_carry_n_2,
      CO(0) => counter_next0_carry_n_3,
      CYINIT => '1',
      DI(3) => counter_next0_carry_i_1_n_0,
      DI(2) => counter_next0_carry_i_2_n_0,
      DI(1) => counter_next0_carry_i_3_n_0,
      DI(0) => counter_next0_carry_i_4_n_0,
      O(3 downto 0) => NLW_counter_next0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => counter_next0_carry_i_5_n_0,
      S(2) => counter_next0_carry_i_6_n_0,
      S(1) => counter_next0_carry_i_7_n_0,
      S(0) => counter_next0_carry_i_8_n_0
    );
\counter_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter_next0_carry_n_0,
      CO(3) => \counter_next0_carry__0_n_0\,
      CO(2) => \counter_next0_carry__0_n_1\,
      CO(1) => \counter_next0_carry__0_n_2\,
      CO(0) => \counter_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \counter_next0_carry__0_i_1_n_0\,
      DI(2) => \counter_next0_carry__0_i_2_n_0\,
      DI(1) => \counter_next0_carry__0_i_3_n_0\,
      DI(0) => \counter_next0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_counter_next0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \counter_next0_carry__0_i_5_n_0\,
      S(2) => \counter_next0_carry__0_i_6_n_0\,
      S(1) => \counter_next0_carry__0_i_7_n_0\,
      S(0) => \counter_next0_carry__0_i_8_n_0\
    );
\counter_next0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(14),
      I1 => counter_next1(14),
      I2 => counter_next1(15),
      I3 => cycle_reg(15),
      O => \counter_next0_carry__0_i_1_n_0\
    );
\counter_next0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(12),
      I1 => counter_next1(12),
      I2 => counter_next1(13),
      I3 => cycle_reg(13),
      O => \counter_next0_carry__0_i_2_n_0\
    );
\counter_next0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(10),
      I1 => counter_next1(10),
      I2 => counter_next1(11),
      I3 => cycle_reg(11),
      O => \counter_next0_carry__0_i_3_n_0\
    );
\counter_next0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(8),
      I1 => counter_next1(8),
      I2 => counter_next1(9),
      I3 => cycle_reg(9),
      O => \counter_next0_carry__0_i_4_n_0\
    );
\counter_next0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(14),
      I1 => counter_next1(14),
      I2 => cycle_reg(15),
      I3 => counter_next1(15),
      O => \counter_next0_carry__0_i_5_n_0\
    );
\counter_next0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(12),
      I1 => counter_next1(12),
      I2 => cycle_reg(13),
      I3 => counter_next1(13),
      O => \counter_next0_carry__0_i_6_n_0\
    );
\counter_next0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(10),
      I1 => counter_next1(10),
      I2 => cycle_reg(11),
      I3 => counter_next1(11),
      O => \counter_next0_carry__0_i_7_n_0\
    );
\counter_next0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(8),
      I1 => counter_next1(8),
      I2 => cycle_reg(9),
      I3 => counter_next1(9),
      O => \counter_next0_carry__0_i_8_n_0\
    );
\counter_next0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next0_carry__0_n_0\,
      CO(3) => \counter_next0_carry__1_n_0\,
      CO(2) => \counter_next0_carry__1_n_1\,
      CO(1) => \counter_next0_carry__1_n_2\,
      CO(0) => \counter_next0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \counter_next0_carry__1_i_1_n_0\,
      DI(2) => \counter_next0_carry__1_i_2_n_0\,
      DI(1) => \counter_next0_carry__1_i_3_n_0\,
      DI(0) => \counter_next0_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_counter_next0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \counter_next0_carry__1_i_5_n_0\,
      S(2) => \counter_next0_carry__1_i_6_n_0\,
      S(1) => \counter_next0_carry__1_i_7_n_0\,
      S(0) => \counter_next0_carry__1_i_8_n_0\
    );
\counter_next0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(22),
      I1 => counter_next1(22),
      I2 => counter_next1(23),
      I3 => cycle_reg(23),
      O => \counter_next0_carry__1_i_1_n_0\
    );
\counter_next0_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(20),
      I1 => counter_next1(20),
      I2 => counter_next1(21),
      I3 => cycle_reg(21),
      O => \counter_next0_carry__1_i_2_n_0\
    );
\counter_next0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(18),
      I1 => counter_next1(18),
      I2 => counter_next1(19),
      I3 => cycle_reg(19),
      O => \counter_next0_carry__1_i_3_n_0\
    );
\counter_next0_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(16),
      I1 => counter_next1(16),
      I2 => counter_next1(17),
      I3 => cycle_reg(17),
      O => \counter_next0_carry__1_i_4_n_0\
    );
\counter_next0_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(22),
      I1 => counter_next1(22),
      I2 => cycle_reg(23),
      I3 => counter_next1(23),
      O => \counter_next0_carry__1_i_5_n_0\
    );
\counter_next0_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(20),
      I1 => counter_next1(20),
      I2 => cycle_reg(21),
      I3 => counter_next1(21),
      O => \counter_next0_carry__1_i_6_n_0\
    );
\counter_next0_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(18),
      I1 => counter_next1(18),
      I2 => cycle_reg(19),
      I3 => counter_next1(19),
      O => \counter_next0_carry__1_i_7_n_0\
    );
\counter_next0_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(16),
      I1 => counter_next1(16),
      I2 => cycle_reg(17),
      I3 => counter_next1(17),
      O => \counter_next0_carry__1_i_8_n_0\
    );
\counter_next0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next0_carry__1_n_0\,
      CO(3) => \counter_next0_carry__2_n_0\,
      CO(2) => \counter_next0_carry__2_n_1\,
      CO(1) => \counter_next0_carry__2_n_2\,
      CO(0) => \counter_next0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \counter_next0_carry__2_i_1_n_0\,
      DI(2) => \counter_next0_carry__2_i_2_n_0\,
      DI(1) => \counter_next0_carry__2_i_3_n_0\,
      DI(0) => \counter_next0_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_counter_next0_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \counter_next0_carry__2_i_5_n_0\,
      S(2) => \counter_next0_carry__2_i_6_n_0\,
      S(1) => \counter_next0_carry__2_i_7_n_0\,
      S(0) => \counter_next0_carry__2_i_8_n_0\
    );
\counter_next0_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(30),
      I1 => counter_next1(30),
      I2 => counter_next1(31),
      I3 => cycle_reg(31),
      O => \counter_next0_carry__2_i_1_n_0\
    );
\counter_next0_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(28),
      I1 => counter_next1(28),
      I2 => counter_next1(29),
      I3 => cycle_reg(29),
      O => \counter_next0_carry__2_i_2_n_0\
    );
\counter_next0_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(26),
      I1 => counter_next1(26),
      I2 => counter_next1(27),
      I3 => cycle_reg(27),
      O => \counter_next0_carry__2_i_3_n_0\
    );
\counter_next0_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(24),
      I1 => counter_next1(24),
      I2 => counter_next1(25),
      I3 => cycle_reg(25),
      O => \counter_next0_carry__2_i_4_n_0\
    );
\counter_next0_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(30),
      I1 => counter_next1(30),
      I2 => cycle_reg(31),
      I3 => counter_next1(31),
      O => \counter_next0_carry__2_i_5_n_0\
    );
\counter_next0_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(28),
      I1 => counter_next1(28),
      I2 => cycle_reg(29),
      I3 => counter_next1(29),
      O => \counter_next0_carry__2_i_6_n_0\
    );
\counter_next0_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(26),
      I1 => counter_next1(26),
      I2 => cycle_reg(27),
      I3 => counter_next1(27),
      O => \counter_next0_carry__2_i_7_n_0\
    );
\counter_next0_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(24),
      I1 => counter_next1(24),
      I2 => cycle_reg(25),
      I3 => counter_next1(25),
      O => \counter_next0_carry__2_i_8_n_0\
    );
counter_next0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(6),
      I1 => counter_next1(6),
      I2 => counter_next1(7),
      I3 => cycle_reg(7),
      O => counter_next0_carry_i_1_n_0
    );
counter_next0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(4),
      I1 => counter_next1(4),
      I2 => counter_next1(5),
      I3 => cycle_reg(5),
      O => counter_next0_carry_i_2_n_0
    );
counter_next0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cycle_reg(2),
      I1 => counter_next1(2),
      I2 => counter_next1(3),
      I3 => cycle_reg(3),
      O => counter_next0_carry_i_3_n_0
    );
counter_next0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F08"
    )
        port map (
      I0 => Ncycles(0),
      I1 => cycle_reg(0),
      I2 => counter_next1(1),
      I3 => cycle_reg(1),
      O => counter_next0_carry_i_4_n_0
    );
counter_next0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(6),
      I1 => counter_next1(6),
      I2 => cycle_reg(7),
      I3 => counter_next1(7),
      O => counter_next0_carry_i_5_n_0
    );
counter_next0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(4),
      I1 => counter_next1(4),
      I2 => cycle_reg(5),
      I3 => counter_next1(5),
      O => counter_next0_carry_i_6_n_0
    );
counter_next0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_reg(2),
      I1 => counter_next1(2),
      I2 => cycle_reg(3),
      I3 => counter_next1(3),
      O => counter_next0_carry_i_7_n_0
    );
counter_next0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => cycle_reg(0),
      I1 => Ncycles(0),
      I2 => cycle_reg(1),
      I3 => counter_next1(1),
      O => counter_next0_carry_i_8_n_0
    );
counter_next1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter_next1_carry_n_0,
      CO(2) => counter_next1_carry_n_1,
      CO(1) => counter_next1_carry_n_2,
      CO(0) => counter_next1_carry_n_3,
      CYINIT => Ncycles(0),
      DI(3 downto 0) => Ncycles(4 downto 1),
      O(3 downto 0) => counter_next1(4 downto 1),
      S(3) => counter_next1_carry_i_1_n_0,
      S(2) => counter_next1_carry_i_2_n_0,
      S(1) => counter_next1_carry_i_3_n_0,
      S(0) => counter_next1_carry_i_4_n_0
    );
\counter_next1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter_next1_carry_n_0,
      CO(3) => \counter_next1_carry__0_n_0\,
      CO(2) => \counter_next1_carry__0_n_1\,
      CO(1) => \counter_next1_carry__0_n_2\,
      CO(0) => \counter_next1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(8 downto 5),
      O(3 downto 0) => counter_next1(8 downto 5),
      S(3) => \counter_next1_carry__0_i_1_n_0\,
      S(2) => \counter_next1_carry__0_i_2_n_0\,
      S(1) => \counter_next1_carry__0_i_3_n_0\,
      S(0) => \counter_next1_carry__0_i_4_n_0\
    );
\counter_next1_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(8),
      O => \counter_next1_carry__0_i_1_n_0\
    );
\counter_next1_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(7),
      O => \counter_next1_carry__0_i_2_n_0\
    );
\counter_next1_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(6),
      O => \counter_next1_carry__0_i_3_n_0\
    );
\counter_next1_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(5),
      O => \counter_next1_carry__0_i_4_n_0\
    );
\counter_next1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__0_n_0\,
      CO(3) => \counter_next1_carry__1_n_0\,
      CO(2) => \counter_next1_carry__1_n_1\,
      CO(1) => \counter_next1_carry__1_n_2\,
      CO(0) => \counter_next1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(12 downto 9),
      O(3 downto 0) => counter_next1(12 downto 9),
      S(3) => \counter_next1_carry__1_i_1_n_0\,
      S(2) => \counter_next1_carry__1_i_2_n_0\,
      S(1) => \counter_next1_carry__1_i_3_n_0\,
      S(0) => \counter_next1_carry__1_i_4_n_0\
    );
\counter_next1_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(12),
      O => \counter_next1_carry__1_i_1_n_0\
    );
\counter_next1_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(11),
      O => \counter_next1_carry__1_i_2_n_0\
    );
\counter_next1_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(10),
      O => \counter_next1_carry__1_i_3_n_0\
    );
\counter_next1_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(9),
      O => \counter_next1_carry__1_i_4_n_0\
    );
\counter_next1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__1_n_0\,
      CO(3) => \counter_next1_carry__2_n_0\,
      CO(2) => \counter_next1_carry__2_n_1\,
      CO(1) => \counter_next1_carry__2_n_2\,
      CO(0) => \counter_next1_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(16 downto 13),
      O(3 downto 0) => counter_next1(16 downto 13),
      S(3) => \counter_next1_carry__2_i_1_n_0\,
      S(2) => \counter_next1_carry__2_i_2_n_0\,
      S(1) => \counter_next1_carry__2_i_3_n_0\,
      S(0) => \counter_next1_carry__2_i_4_n_0\
    );
\counter_next1_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(16),
      O => \counter_next1_carry__2_i_1_n_0\
    );
\counter_next1_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(15),
      O => \counter_next1_carry__2_i_2_n_0\
    );
\counter_next1_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(14),
      O => \counter_next1_carry__2_i_3_n_0\
    );
\counter_next1_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(13),
      O => \counter_next1_carry__2_i_4_n_0\
    );
\counter_next1_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__2_n_0\,
      CO(3) => \counter_next1_carry__3_n_0\,
      CO(2) => \counter_next1_carry__3_n_1\,
      CO(1) => \counter_next1_carry__3_n_2\,
      CO(0) => \counter_next1_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(20 downto 17),
      O(3 downto 0) => counter_next1(20 downto 17),
      S(3) => \counter_next1_carry__3_i_1_n_0\,
      S(2) => \counter_next1_carry__3_i_2_n_0\,
      S(1) => \counter_next1_carry__3_i_3_n_0\,
      S(0) => \counter_next1_carry__3_i_4_n_0\
    );
\counter_next1_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(20),
      O => \counter_next1_carry__3_i_1_n_0\
    );
\counter_next1_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(19),
      O => \counter_next1_carry__3_i_2_n_0\
    );
\counter_next1_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(18),
      O => \counter_next1_carry__3_i_3_n_0\
    );
\counter_next1_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(17),
      O => \counter_next1_carry__3_i_4_n_0\
    );
\counter_next1_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__3_n_0\,
      CO(3) => \counter_next1_carry__4_n_0\,
      CO(2) => \counter_next1_carry__4_n_1\,
      CO(1) => \counter_next1_carry__4_n_2\,
      CO(0) => \counter_next1_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(24 downto 21),
      O(3 downto 0) => counter_next1(24 downto 21),
      S(3) => \counter_next1_carry__4_i_1_n_0\,
      S(2) => \counter_next1_carry__4_i_2_n_0\,
      S(1) => \counter_next1_carry__4_i_3_n_0\,
      S(0) => \counter_next1_carry__4_i_4_n_0\
    );
\counter_next1_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(24),
      O => \counter_next1_carry__4_i_1_n_0\
    );
\counter_next1_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(23),
      O => \counter_next1_carry__4_i_2_n_0\
    );
\counter_next1_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(22),
      O => \counter_next1_carry__4_i_3_n_0\
    );
\counter_next1_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(21),
      O => \counter_next1_carry__4_i_4_n_0\
    );
\counter_next1_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__4_n_0\,
      CO(3) => \counter_next1_carry__5_n_0\,
      CO(2) => \counter_next1_carry__5_n_1\,
      CO(1) => \counter_next1_carry__5_n_2\,
      CO(0) => \counter_next1_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Ncycles(28 downto 25),
      O(3 downto 0) => counter_next1(28 downto 25),
      S(3) => \counter_next1_carry__5_i_1_n_0\,
      S(2) => \counter_next1_carry__5_i_2_n_0\,
      S(1) => \counter_next1_carry__5_i_3_n_0\,
      S(0) => \counter_next1_carry__5_i_4_n_0\
    );
\counter_next1_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(28),
      O => \counter_next1_carry__5_i_1_n_0\
    );
\counter_next1_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(27),
      O => \counter_next1_carry__5_i_2_n_0\
    );
\counter_next1_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(26),
      O => \counter_next1_carry__5_i_3_n_0\
    );
\counter_next1_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(25),
      O => \counter_next1_carry__5_i_4_n_0\
    );
\counter_next1_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_next1_carry__5_n_0\,
      CO(3 downto 2) => \NLW_counter_next1_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_next1_carry__6_n_2\,
      CO(0) => \counter_next1_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => Ncycles(30 downto 29),
      O(3) => \NLW_counter_next1_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => counter_next1(31 downto 29),
      S(3) => '0',
      S(2) => \counter_next1_carry__6_i_1_n_0\,
      S(1) => \counter_next1_carry__6_i_2_n_0\,
      S(0) => \counter_next1_carry__6_i_3_n_0\
    );
\counter_next1_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(31),
      O => \counter_next1_carry__6_i_1_n_0\
    );
\counter_next1_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(30),
      O => \counter_next1_carry__6_i_2_n_0\
    );
\counter_next1_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(29),
      O => \counter_next1_carry__6_i_3_n_0\
    );
counter_next1_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(4),
      O => counter_next1_carry_i_1_n_0
    );
counter_next1_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(3),
      O => counter_next1_carry_i_2_n_0
    );
counter_next1_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(2),
      O => counter_next1_carry_i_3_n_0
    );
counter_next1_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ncycles(1),
      O => counter_next1_carry_i_4_n_0
    );
\counter_output[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst,
      O => p_0_in
    );
\counter_output[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => state,
      I1 => \state_next1_carry__0_n_1\,
      I2 => \counter_next0_carry__2_n_0\,
      O => \counter_output[31]_i_2_n_0\
    );
\counter_output_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(0),
      Q => counter_output(0),
      R => p_0_in
    );
\counter_output_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(10),
      Q => counter_output(10),
      R => p_0_in
    );
\counter_output_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(11),
      Q => counter_output(11),
      R => p_0_in
    );
\counter_output_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(12),
      Q => counter_output(12),
      R => p_0_in
    );
\counter_output_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(13),
      Q => counter_output(13),
      R => p_0_in
    );
\counter_output_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(14),
      Q => counter_output(14),
      R => p_0_in
    );
\counter_output_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(15),
      Q => counter_output(15),
      R => p_0_in
    );
\counter_output_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(16),
      Q => counter_output(16),
      R => p_0_in
    );
\counter_output_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(17),
      Q => counter_output(17),
      R => p_0_in
    );
\counter_output_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(18),
      Q => counter_output(18),
      R => p_0_in
    );
\counter_output_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(19),
      Q => counter_output(19),
      R => p_0_in
    );
\counter_output_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(1),
      Q => counter_output(1),
      R => p_0_in
    );
\counter_output_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(20),
      Q => counter_output(20),
      R => p_0_in
    );
\counter_output_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(21),
      Q => counter_output(21),
      R => p_0_in
    );
\counter_output_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(22),
      Q => counter_output(22),
      R => p_0_in
    );
\counter_output_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(23),
      Q => counter_output(23),
      R => p_0_in
    );
\counter_output_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(24),
      Q => counter_output(24),
      R => p_0_in
    );
\counter_output_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(25),
      Q => counter_output(25),
      R => p_0_in
    );
\counter_output_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(26),
      Q => counter_output(26),
      R => p_0_in
    );
\counter_output_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(27),
      Q => counter_output(27),
      R => p_0_in
    );
\counter_output_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(28),
      Q => counter_output(28),
      R => p_0_in
    );
\counter_output_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(29),
      Q => counter_output(29),
      R => p_0_in
    );
\counter_output_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(2),
      Q => counter_output(2),
      R => p_0_in
    );
\counter_output_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(30),
      Q => counter_output(30),
      R => p_0_in
    );
\counter_output_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(31),
      Q => counter_output(31),
      R => p_0_in
    );
\counter_output_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(3),
      Q => counter_output(3),
      R => p_0_in
    );
\counter_output_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(4),
      Q => counter_output(4),
      R => p_0_in
    );
\counter_output_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(5),
      Q => counter_output(5),
      R => p_0_in
    );
\counter_output_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(6),
      Q => counter_output(6),
      R => p_0_in
    );
\counter_output_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(7),
      Q => counter_output(7),
      R => p_0_in
    );
\counter_output_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(8),
      Q => counter_output(8),
      R => p_0_in
    );
\counter_output_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter_output[31]_i_2_n_0\,
      D => counter_reg(9),
      Q => counter_output(9),
      R => p_0_in
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_7\,
      Q => counter_reg(0),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_6\,
      Q => counter_reg(1),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_5\,
      Q => counter_reg(2),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_4\,
      Q => counter_reg(3),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => \cycle[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => \cycle[0]_i_1_n_0\
    );
\cycle[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => \counter_next0_carry__2_n_0\,
      I1 => \state_next1_carry__0_n_1\,
      I2 => state,
      I3 => rst,
      O => \cycle[0]_i_1_n_0\
    );
\cycle[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state_next1_carry__0_n_1\,
      I1 => state,
      O => \cycle[0]_i_2_n_0\
    );
\cycle[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cycle_reg(0),
      O => \cycle[0]_i_4_n_0\
    );
\cycle_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[0]_i_3_n_7\,
      Q => cycle_reg(0),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cycle_reg[0]_i_3_n_0\,
      CO(2) => \cycle_reg[0]_i_3_n_1\,
      CO(1) => \cycle_reg[0]_i_3_n_2\,
      CO(0) => \cycle_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \cycle_reg[0]_i_3_n_4\,
      O(2) => \cycle_reg[0]_i_3_n_5\,
      O(1) => \cycle_reg[0]_i_3_n_6\,
      O(0) => \cycle_reg[0]_i_3_n_7\,
      S(3 downto 1) => cycle_reg(3 downto 1),
      S(0) => \cycle[0]_i_4_n_0\
    );
\cycle_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[8]_i_1_n_5\,
      Q => cycle_reg(10),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[8]_i_1_n_4\,
      Q => cycle_reg(11),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[12]_i_1_n_7\,
      Q => cycle_reg(12),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[8]_i_1_n_0\,
      CO(3) => \cycle_reg[12]_i_1_n_0\,
      CO(2) => \cycle_reg[12]_i_1_n_1\,
      CO(1) => \cycle_reg[12]_i_1_n_2\,
      CO(0) => \cycle_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[12]_i_1_n_4\,
      O(2) => \cycle_reg[12]_i_1_n_5\,
      O(1) => \cycle_reg[12]_i_1_n_6\,
      O(0) => \cycle_reg[12]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(15 downto 12)
    );
\cycle_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[12]_i_1_n_6\,
      Q => cycle_reg(13),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[12]_i_1_n_5\,
      Q => cycle_reg(14),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[12]_i_1_n_4\,
      Q => cycle_reg(15),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[16]_i_1_n_7\,
      Q => cycle_reg(16),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[12]_i_1_n_0\,
      CO(3) => \cycle_reg[16]_i_1_n_0\,
      CO(2) => \cycle_reg[16]_i_1_n_1\,
      CO(1) => \cycle_reg[16]_i_1_n_2\,
      CO(0) => \cycle_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[16]_i_1_n_4\,
      O(2) => \cycle_reg[16]_i_1_n_5\,
      O(1) => \cycle_reg[16]_i_1_n_6\,
      O(0) => \cycle_reg[16]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(19 downto 16)
    );
\cycle_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[16]_i_1_n_6\,
      Q => cycle_reg(17),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[16]_i_1_n_5\,
      Q => cycle_reg(18),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[16]_i_1_n_4\,
      Q => cycle_reg(19),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[0]_i_3_n_6\,
      Q => cycle_reg(1),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[20]_i_1_n_7\,
      Q => cycle_reg(20),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[16]_i_1_n_0\,
      CO(3) => \cycle_reg[20]_i_1_n_0\,
      CO(2) => \cycle_reg[20]_i_1_n_1\,
      CO(1) => \cycle_reg[20]_i_1_n_2\,
      CO(0) => \cycle_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[20]_i_1_n_4\,
      O(2) => \cycle_reg[20]_i_1_n_5\,
      O(1) => \cycle_reg[20]_i_1_n_6\,
      O(0) => \cycle_reg[20]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(23 downto 20)
    );
\cycle_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[20]_i_1_n_6\,
      Q => cycle_reg(21),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[20]_i_1_n_5\,
      Q => cycle_reg(22),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[20]_i_1_n_4\,
      Q => cycle_reg(23),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[24]_i_1_n_7\,
      Q => cycle_reg(24),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[20]_i_1_n_0\,
      CO(3) => \cycle_reg[24]_i_1_n_0\,
      CO(2) => \cycle_reg[24]_i_1_n_1\,
      CO(1) => \cycle_reg[24]_i_1_n_2\,
      CO(0) => \cycle_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[24]_i_1_n_4\,
      O(2) => \cycle_reg[24]_i_1_n_5\,
      O(1) => \cycle_reg[24]_i_1_n_6\,
      O(0) => \cycle_reg[24]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(27 downto 24)
    );
\cycle_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[24]_i_1_n_6\,
      Q => cycle_reg(25),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[24]_i_1_n_5\,
      Q => cycle_reg(26),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[24]_i_1_n_4\,
      Q => cycle_reg(27),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[28]_i_1_n_7\,
      Q => cycle_reg(28),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[24]_i_1_n_0\,
      CO(3) => \NLW_cycle_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \cycle_reg[28]_i_1_n_1\,
      CO(1) => \cycle_reg[28]_i_1_n_2\,
      CO(0) => \cycle_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[28]_i_1_n_4\,
      O(2) => \cycle_reg[28]_i_1_n_5\,
      O(1) => \cycle_reg[28]_i_1_n_6\,
      O(0) => \cycle_reg[28]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(31 downto 28)
    );
\cycle_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[28]_i_1_n_6\,
      Q => cycle_reg(29),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[0]_i_3_n_5\,
      Q => cycle_reg(2),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[28]_i_1_n_5\,
      Q => cycle_reg(30),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[28]_i_1_n_4\,
      Q => cycle_reg(31),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[0]_i_3_n_4\,
      Q => cycle_reg(3),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[4]_i_1_n_7\,
      Q => cycle_reg(4),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[0]_i_3_n_0\,
      CO(3) => \cycle_reg[4]_i_1_n_0\,
      CO(2) => \cycle_reg[4]_i_1_n_1\,
      CO(1) => \cycle_reg[4]_i_1_n_2\,
      CO(0) => \cycle_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[4]_i_1_n_4\,
      O(2) => \cycle_reg[4]_i_1_n_5\,
      O(1) => \cycle_reg[4]_i_1_n_6\,
      O(0) => \cycle_reg[4]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(7 downto 4)
    );
\cycle_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[4]_i_1_n_6\,
      Q => cycle_reg(5),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[4]_i_1_n_5\,
      Q => cycle_reg(6),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[4]_i_1_n_4\,
      Q => cycle_reg(7),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[8]_i_1_n_7\,
      Q => cycle_reg(8),
      R => \cycle[0]_i_1_n_0\
    );
\cycle_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_reg[4]_i_1_n_0\,
      CO(3) => \cycle_reg[8]_i_1_n_0\,
      CO(2) => \cycle_reg[8]_i_1_n_1\,
      CO(1) => \cycle_reg[8]_i_1_n_2\,
      CO(0) => \cycle_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cycle_reg[8]_i_1_n_4\,
      O(2) => \cycle_reg[8]_i_1_n_5\,
      O(1) => \cycle_reg[8]_i_1_n_6\,
      O(0) => \cycle_reg[8]_i_1_n_7\,
      S(3 downto 0) => cycle_reg(11 downto 8)
    );
\cycle_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \cycle[0]_i_2_n_0\,
      D => \cycle_reg[8]_i_1_n_6\,
      Q => cycle_reg(9),
      R => \cycle[0]_i_1_n_0\
    );
state_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => state,
      I1 => \state_next1__6_carry__0_n_1\,
      I2 => \state_next1_carry__0_n_1\,
      I3 => rst,
      O => state_i_1_n_0
    );
\state_next1__6_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \state_next1__6_carry_n_0\,
      CO(2) => \state_next1__6_carry_n_1\,
      CO(1) => \state_next1__6_carry_n_2\,
      CO(0) => \state_next1__6_carry_n_3\,
      CYINIT => '0',
      DI(3) => \state_next1__6_carry_i_1_n_0\,
      DI(2) => \state_next1__6_carry_i_2_n_0\,
      DI(1) => \state_next1__6_carry_i_3_n_0\,
      DI(0) => \state_next1__6_carry_i_4_n_0\,
      O(3 downto 0) => \NLW_state_next1__6_carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \state_next1__6_carry_i_5_n_0\,
      S(2) => \state_next1__6_carry_i_6_n_0\,
      S(1) => \state_next1__6_carry_i_7_n_0\,
      S(0) => \state_next1__6_carry_i_8_n_0\
    );
\state_next1__6_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \state_next1__6_carry_n_0\,
      CO(3) => \NLW_state_next1__6_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \state_next1__6_carry__0_n_1\,
      CO(1) => \state_next1__6_carry__0_n_2\,
      CO(0) => \state_next1__6_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \state_next1__6_carry__0_i_1_n_0\,
      DI(1) => \state_next1__6_carry__0_i_2_n_0\,
      DI(0) => \state_next1__6_carry__0_i_3_n_0\,
      O(3 downto 0) => \NLW_state_next1__6_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \state_next1__6_carry__0_i_4_n_0\,
      S(1) => \state_next1__6_carry__0_i_5_n_0\,
      S(0) => \state_next1__6_carry__0_i_6_n_0\
    );
\state_next1__6_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(13),
      I1 => S_AXIS_IN_tdata(12),
      O => \state_next1__6_carry__0_i_1_n_0\
    );
\state_next1__6_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => S_AXIS_IN_tdata(10),
      I1 => S_AXIS_IN_tdata(11),
      O => \state_next1__6_carry__0_i_2_n_0\
    );
\state_next1__6_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => S_AXIS_IN_tdata(8),
      I1 => S_AXIS_IN_tdata(9),
      O => \state_next1__6_carry__0_i_3_n_0\
    );
\state_next1__6_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(12),
      I1 => S_AXIS_IN_tdata(13),
      O => \state_next1__6_carry__0_i_4_n_0\
    );
\state_next1__6_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(10),
      I1 => S_AXIS_IN_tdata(11),
      O => \state_next1__6_carry__0_i_5_n_0\
    );
\state_next1__6_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(8),
      I1 => S_AXIS_IN_tdata(9),
      O => \state_next1__6_carry__0_i_6_n_0\
    );
\state_next1__6_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(6),
      I1 => S_AXIS_IN_tdata(7),
      O => \state_next1__6_carry_i_1_n_0\
    );
\state_next1__6_carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(5),
      O => \state_next1__6_carry_i_2_n_0\
    );
\state_next1__6_carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(3),
      O => \state_next1__6_carry_i_3_n_0\
    );
\state_next1__6_carry_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(1),
      O => \state_next1__6_carry_i_4_n_0\
    );
\state_next1__6_carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(6),
      I1 => S_AXIS_IN_tdata(7),
      O => \state_next1__6_carry_i_5_n_0\
    );
\state_next1__6_carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(5),
      I1 => S_AXIS_IN_tdata(4),
      O => \state_next1__6_carry_i_6_n_0\
    );
\state_next1__6_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(3),
      I1 => S_AXIS_IN_tdata(2),
      O => \state_next1__6_carry_i_7_n_0\
    );
\state_next1__6_carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(1),
      I1 => S_AXIS_IN_tdata(0),
      O => \state_next1__6_carry_i_8_n_0\
    );
state_next1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => state_next1_carry_n_0,
      CO(2) => state_next1_carry_n_1,
      CO(1) => state_next1_carry_n_2,
      CO(0) => state_next1_carry_n_3,
      CYINIT => '0',
      DI(3) => state_next1_carry_i_1_n_0,
      DI(2) => S_AXIS_IN_tdata(5),
      DI(1) => '0',
      DI(0) => state_next1_carry_i_2_n_0,
      O(3 downto 0) => NLW_state_next1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => state_next1_carry_i_3_n_0,
      S(2) => state_next1_carry_i_4_n_0,
      S(1) => state_next1_carry_i_5_n_0,
      S(0) => state_next1_carry_i_6_n_0
    );
\state_next1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => state_next1_carry_n_0,
      CO(3) => \NLW_state_next1_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \state_next1_carry__0_n_1\,
      CO(1) => \state_next1_carry__0_n_2\,
      CO(0) => \state_next1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \state_next1_carry__0_i_1_n_0\,
      DI(1 downto 0) => B"00",
      O(3 downto 0) => \NLW_state_next1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \state_next1_carry__0_i_2_n_0\,
      S(1) => \state_next1_carry__0_i_3_n_0\,
      S(0) => \state_next1_carry__0_i_4_n_0\
    );
\state_next1_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(13),
      O => \state_next1_carry__0_i_1_n_0\
    );
\state_next1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(12),
      I1 => S_AXIS_IN_tdata(13),
      O => \state_next1_carry__0_i_2_n_0\
    );
\state_next1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(10),
      I1 => S_AXIS_IN_tdata(11),
      O => \state_next1_carry__0_i_3_n_0\
    );
\state_next1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(8),
      I1 => S_AXIS_IN_tdata(9),
      O => \state_next1_carry__0_i_4_n_0\
    );
state_next1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(6),
      I1 => S_AXIS_IN_tdata(7),
      O => state_next1_carry_i_1_n_0
    );
state_next1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S_AXIS_IN_tdata(0),
      I1 => S_AXIS_IN_tdata(1),
      O => state_next1_carry_i_2_n_0
    );
state_next1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(7),
      I1 => S_AXIS_IN_tdata(6),
      O => state_next1_carry_i_3_n_0
    );
state_next1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXIS_IN_tdata(4),
      I1 => S_AXIS_IN_tdata(5),
      O => state_next1_carry_i_4_n_0
    );
state_next1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXIS_IN_tdata(2),
      I1 => S_AXIS_IN_tdata(3),
      O => state_next1_carry_i_5_n_0
    );
state_next1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXIS_IN_tdata(0),
      I1 => S_AXIS_IN_tdata(1),
      O => state_next1_carry_i_6_n_0
    );
state_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => state_i_1_n_0,
      Q => state,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    S_AXIS_IN_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_IN_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    Ncycles : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_OUT_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_OUT_tvalid : out STD_LOGIC;
    counter_output : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_frequency_counter_0_0,frequency_counter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "frequency_counter,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axis_in_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axis_in_tvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXIS_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_OUT TVALID";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of M_AXIS_OUT_tvalid : signal is "XIL_INTERFACENAME M_AXIS_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXIS_IN_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_IN TVALID";
  attribute X_INTERFACE_PARAMETER of S_AXIS_IN_tvalid : signal is "XIL_INTERFACENAME S_AXIS_IN, FREQ_HZ 125000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF M_AXIS_OUT:S_AXIS_IN, ASSOCIATED_RESET rst, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_AXIS_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_OUT TDATA";
  attribute X_INTERFACE_INFO of S_AXIS_IN_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_IN TDATA";
  attribute X_INTERFACE_PARAMETER of S_AXIS_IN_tdata : signal is "FREQ_HZ 125000000";
begin
  M_AXIS_OUT_tdata(31) <= \<const0>\;
  M_AXIS_OUT_tdata(30) <= \<const0>\;
  M_AXIS_OUT_tdata(29) <= \<const0>\;
  M_AXIS_OUT_tdata(28) <= \<const0>\;
  M_AXIS_OUT_tdata(27) <= \<const0>\;
  M_AXIS_OUT_tdata(26) <= \<const0>\;
  M_AXIS_OUT_tdata(25) <= \<const0>\;
  M_AXIS_OUT_tdata(24) <= \<const0>\;
  M_AXIS_OUT_tdata(23) <= \<const0>\;
  M_AXIS_OUT_tdata(22) <= \<const0>\;
  M_AXIS_OUT_tdata(21) <= \<const0>\;
  M_AXIS_OUT_tdata(20) <= \<const0>\;
  M_AXIS_OUT_tdata(19) <= \<const0>\;
  M_AXIS_OUT_tdata(18) <= \<const0>\;
  M_AXIS_OUT_tdata(17) <= \<const0>\;
  M_AXIS_OUT_tdata(16) <= \<const0>\;
  M_AXIS_OUT_tdata(15) <= \<const0>\;
  M_AXIS_OUT_tdata(14) <= \<const0>\;
  M_AXIS_OUT_tdata(13 downto 0) <= \^s_axis_in_tdata\(13 downto 0);
  M_AXIS_OUT_tvalid <= \^s_axis_in_tvalid\;
  \^s_axis_in_tdata\(13 downto 0) <= S_AXIS_IN_tdata(13 downto 0);
  \^s_axis_in_tvalid\ <= S_AXIS_IN_tvalid;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_counter
     port map (
      Ncycles(31 downto 0) => Ncycles(31 downto 0),
      S_AXIS_IN_tdata(13 downto 0) => \^s_axis_in_tdata\(13 downto 0),
      clk => clk,
      counter_output(31 downto 0) => counter_output(31 downto 0),
      rst => rst
    );
end STRUCTURE;
