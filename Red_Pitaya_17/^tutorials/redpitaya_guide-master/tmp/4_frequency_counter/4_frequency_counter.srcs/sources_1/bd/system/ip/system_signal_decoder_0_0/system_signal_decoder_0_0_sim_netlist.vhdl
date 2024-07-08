-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 21 14:35:31 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_signal_decoder_0_0/system_signal_decoder_0_0_sim_netlist.vhdl
-- Design      : system_signal_decoder_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_signal_decoder_0_0_signal_decoder is
  port (
    led_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_signal_decoder_0_0_signal_decoder : entity is "signal_decoder";
end system_signal_decoder_0_0_signal_decoder;

architecture STRUCTURE of system_signal_decoder_0_0_signal_decoder is
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \led_out[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \led_out[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \led_out[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \led_out[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \led_out[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \led_out[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \led_out[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \led_out[7]_i_2\ : label is "soft_lutpair3";
begin
\led_out[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXIS_tdata(1),
      I1 => S_AXIS_tdata(0),
      I2 => S_AXIS_tdata(2),
      O => p_1_in(0)
    );
\led_out[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => S_AXIS_tdata(0),
      I1 => S_AXIS_tdata(1),
      I2 => S_AXIS_tdata(2),
      O => p_1_in(1)
    );
\led_out[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => S_AXIS_tdata(2),
      I1 => S_AXIS_tdata(0),
      I2 => S_AXIS_tdata(1),
      O => p_1_in(2)
    );
\led_out[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => S_AXIS_tdata(2),
      I1 => S_AXIS_tdata(0),
      I2 => S_AXIS_tdata(1),
      O => p_1_in(3)
    );
\led_out[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => S_AXIS_tdata(1),
      I1 => S_AXIS_tdata(2),
      I2 => S_AXIS_tdata(0),
      O => p_1_in(4)
    );
\led_out[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXIS_tdata(1),
      I1 => S_AXIS_tdata(2),
      I2 => S_AXIS_tdata(0),
      O => p_1_in(5)
    );
\led_out[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXIS_tdata(2),
      I1 => S_AXIS_tdata(0),
      I2 => S_AXIS_tdata(1),
      O => p_1_in(6)
    );
\led_out[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst,
      O => p_0_in
    );
\led_out[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => S_AXIS_tdata(0),
      I1 => S_AXIS_tdata(2),
      I2 => S_AXIS_tdata(1),
      O => p_1_in(7)
    );
\led_out_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(0),
      Q => led_out(0),
      S => p_0_in
    );
\led_out_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(1),
      Q => led_out(1),
      S => p_0_in
    );
\led_out_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(2),
      Q => led_out(2),
      S => p_0_in
    );
\led_out_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(3),
      Q => led_out(3),
      S => p_0_in
    );
\led_out_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(4),
      Q => led_out(4),
      S => p_0_in
    );
\led_out_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(5),
      Q => led_out(5),
      S => p_0_in
    );
\led_out_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(6),
      Q => led_out(6),
      S => p_0_in
    );
\led_out_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => p_1_in(7),
      Q => led_out(7),
      S => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_signal_decoder_0_0 is
  port (
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    led_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_signal_decoder_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_signal_decoder_0_0 : entity is "system_signal_decoder_0_0,signal_decoder,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_signal_decoder_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_signal_decoder_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_signal_decoder_0_0 : entity is "signal_decoder,Vivado 2020.1";
end system_signal_decoder_0_0;

architecture STRUCTURE of system_signal_decoder_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of S_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of S_AXIS_tvalid : signal is "XIL_INTERFACENAME S_AXIS, FREQ_HZ 125000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF S_AXIS, ASSOCIATED_RESET rst, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_axis_red_pitaya_adc_0_0_adc_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of S_AXIS_tdata : signal is "FREQ_HZ 125000000";
begin
inst: entity work.system_signal_decoder_0_0_signal_decoder
     port map (
      S_AXIS_tdata(2 downto 0) => S_AXIS_tdata(9 downto 7),
      clk => clk,
      led_out(7 downto 0) => led_out(7 downto 0),
      rst => rst
    );
end STRUCTURE;
