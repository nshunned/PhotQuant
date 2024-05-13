-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Jan  8 10:52:17 2024
-- Host        : alexei-jeip running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ red_pitaya_pll_mod_sim_netlist.vhdl
-- Design      : red_pitaya_pll_mod
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_red_pitaya_pll_mod_clk_wiz is
  port (
    clk_adc : out STD_LOGIC;
    clk_dac_1x : out STD_LOGIC;
    clk_dac_2x : out STD_LOGIC;
    clk_dac_2p : out STD_LOGIC;
    clk_src_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_red_pitaya_pll_mod_clk_wiz;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_red_pitaya_pll_mod_clk_wiz is
  signal clk_adc_red_pitaya_pll_mod : STD_LOGIC;
  signal clk_dac_1x_red_pitaya_pll_mod : STD_LOGIC;
  signal clk_dac_2p_red_pitaya_pll_mod : STD_LOGIC;
  signal clk_dac_2x_red_pitaya_pll_mod : STD_LOGIC;
  signal clk_in1_red_pitaya_pll_mod : STD_LOGIC;
  signal clk_src_out_red_pitaya_pll_mod : STD_LOGIC;
  signal clkfbout_buf_red_pitaya_pll_mod : STD_LOGIC;
  signal clkfbout_red_pitaya_pll_mod : STD_LOGIC;
  signal reset_high : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufgds : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufgds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufgds : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufgds : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_red_pitaya_pll_mod,
      O => clkfbout_buf_red_pitaya_pll_mod
    );
clkin1_ibufgds: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1_p,
      IB => clk_in1_n,
      O => clk_in1_red_pitaya_pll_mod
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_adc_red_pitaya_pll_mod,
      O => clk_adc
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_dac_1x_red_pitaya_pll_mod,
      O => clk_dac_1x
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_dac_2x_red_pitaya_pll_mod,
      O => clk_dac_2x
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_dac_2p_red_pitaya_pll_mod,
      O => clk_dac_2p
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_src_out_red_pitaya_pll_mod,
      O => clk_src_out
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 8,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 8.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 8,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 8,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 4,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 4,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => -45.000000,
      CLKOUT4_DIVIDE => 40,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_red_pitaya_pll_mod,
      CLKFBOUT => clkfbout_red_pitaya_pll_mod,
      CLKIN1 => clk_in1_red_pitaya_pll_mod,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => clk_adc_red_pitaya_pll_mod,
      CLKOUT1 => clk_dac_1x_red_pitaya_pll_mod,
      CLKOUT2 => clk_dac_2x_red_pitaya_pll_mod,
      CLKOUT3 => clk_dac_2p_red_pitaya_pll_mod,
      CLKOUT4 => clk_src_out_red_pitaya_pll_mod,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PWRDWN => '0',
      RST => reset_high
    );
plle2_adv_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => reset_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk_adc : out STD_LOGIC;
    clk_dac_1x : out STD_LOGIC;
    clk_dac_2x : out STD_LOGIC;
    clk_dac_2p : out STD_LOGIC;
    clk_src_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_red_pitaya_pll_mod_clk_wiz
     port map (
      clk_adc => clk_adc,
      clk_dac_1x => clk_dac_1x,
      clk_dac_2p => clk_dac_2p,
      clk_dac_2x => clk_dac_2x,
      clk_in1_n => clk_in1_n,
      clk_in1_p => clk_in1_p,
      clk_src_out => clk_src_out,
      locked => locked,
      resetn => resetn
    );
end STRUCTURE;
