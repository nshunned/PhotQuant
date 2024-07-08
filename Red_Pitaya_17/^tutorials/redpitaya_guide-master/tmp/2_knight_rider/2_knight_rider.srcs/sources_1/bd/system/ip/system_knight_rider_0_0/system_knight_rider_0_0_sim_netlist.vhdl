-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Wed Mar 20 16:08:20 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/2_knight_rider/2_knight_rider.srcs/sources_1/bd/system/ip/system_knight_rider_0_0/system_knight_rider_0_0_sim_netlist.vhdl
-- Design      : system_knight_rider_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_knight_rider_0_0_knight_rider is
  port (
    led_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_knight_rider_0_0_knight_rider : entity is "knight_rider";
end system_knight_rider_0_0_knight_rider;

architecture STRUCTURE of system_knight_rider_0_0_knight_rider is
  signal \^led_out\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal leds : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal position_reg : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \position_reg_n_0_[0]\ : STD_LOGIC;
  signal \position_reg_n_0_[1]\ : STD_LOGIC;
  signal \position_reg_n_0_[2]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \leds[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \leds[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \leds[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \leds[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \leds[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \leds[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \leds[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \leds[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \leds[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \leds[9]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \position[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \position[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \position[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \position[3]_i_1\ : label is "soft_lutpair0";
begin
  led_out(7 downto 0) <= \^led_out\(7 downto 0);
\leds[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => position_reg(3),
      I1 => \^led_out\(0),
      O => p_0_in(0)
    );
\leds[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(1),
      I1 => position_reg(3),
      I2 => leds(0),
      O => p_0_in(1)
    );
\leds[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(2),
      I1 => position_reg(3),
      I2 => \^led_out\(0),
      O => p_0_in(2)
    );
\leds[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(3),
      I1 => position_reg(3),
      I2 => \^led_out\(1),
      O => p_0_in(3)
    );
\leds[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(4),
      I1 => position_reg(3),
      I2 => \^led_out\(2),
      O => p_0_in(4)
    );
\leds[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(5),
      I1 => position_reg(3),
      I2 => \^led_out\(3),
      O => p_0_in(5)
    );
\leds[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(6),
      I1 => position_reg(3),
      I2 => \^led_out\(4),
      O => p_0_in(6)
    );
\leds[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^led_out\(7),
      I1 => position_reg(3),
      I2 => \^led_out\(5),
      O => p_0_in(7)
    );
\leds[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => leds(9),
      I1 => position_reg(3),
      I2 => \^led_out\(6),
      O => p_0_in(8)
    );
\leds[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^led_out\(7),
      I1 => position_reg(3),
      O => p_0_in(9)
    );
\leds_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(0),
      Q => leds(0),
      R => '0'
    );
\leds_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      Q => \^led_out\(0),
      R => '0'
    );
\leds_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(2),
      Q => \^led_out\(1),
      R => '0'
    );
\leds_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(3),
      Q => \^led_out\(2),
      R => '0'
    );
\leds_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      Q => \^led_out\(3),
      R => '0'
    );
\leds_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(5),
      Q => \^led_out\(4),
      R => '0'
    );
\leds_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(6),
      Q => \^led_out\(5),
      R => '0'
    );
\leds_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(7),
      Q => \^led_out\(6),
      R => '0'
    );
\leds_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(8),
      Q => \^led_out\(7),
      R => '0'
    );
\leds_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(9),
      Q => leds(9),
      R => '0'
    );
\position[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \position_reg_n_0_[0]\,
      O => \p_0_in__0\(0)
    );
\position[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \position_reg_n_0_[0]\,
      I1 => \position_reg_n_0_[1]\,
      O => \p_0_in__0\(1)
    );
\position[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \position_reg_n_0_[0]\,
      I1 => \position_reg_n_0_[1]\,
      I2 => \position_reg_n_0_[2]\,
      O => \p_0_in__0\(2)
    );
\position[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \position_reg_n_0_[1]\,
      I1 => \position_reg_n_0_[0]\,
      I2 => \position_reg_n_0_[2]\,
      I3 => position_reg(3),
      O => \p_0_in__0\(3)
    );
\position_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \position_reg_n_0_[0]\,
      R => '0'
    );
\position_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \position_reg_n_0_[1]\,
      R => '0'
    );
\position_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \position_reg_n_0_[2]\,
      R => '0'
    );
\position_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => position_reg(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_knight_rider_0_0 is
  port (
    clk : in STD_LOGIC;
    led_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_knight_rider_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_knight_rider_0_0 : entity is "system_knight_rider_0_0,knight_rider,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_knight_rider_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_knight_rider_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_knight_rider_0_0 : entity is "knight_rider,Vivado 2020.1";
end system_knight_rider_0_0;

architecture STRUCTURE of system_knight_rider_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
begin
inst: entity work.system_knight_rider_0_0_knight_rider
     port map (
      clk => clk,
      led_out(7 downto 0) => led_out(7 downto 0)
    );
end STRUCTURE;
