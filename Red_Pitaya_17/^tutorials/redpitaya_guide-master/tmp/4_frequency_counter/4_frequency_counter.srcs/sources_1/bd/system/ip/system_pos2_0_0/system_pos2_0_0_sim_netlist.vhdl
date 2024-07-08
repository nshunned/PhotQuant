-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 21 14:35:02 2024
-- Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_pos2_0_0/system_pos2_0_0_sim_netlist.vhdl
-- Design      : system_pos2_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pos2_0_0_pow2 is
  port (
    N : out STD_LOGIC_VECTOR ( 31 downto 0 );
    log2N : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_pos2_0_0_pow2 : entity is "pow2";
end system_pos2_0_0_pow2;

architecture STRUCTURE of system_pos2_0_0_pow2 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \N[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \N[10]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \N[11]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \N[12]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \N[13]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \N[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \N[15]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \N[16]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \N[17]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \N[18]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \N[19]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \N[1]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \N[20]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \N[21]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \N[22]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \N[23]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \N[24]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \N[25]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \N[26]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \N[27]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \N[28]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \N[29]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \N[2]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \N[30]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \N[31]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \N[3]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \N[4]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \N[5]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \N[6]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \N[7]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \N[8]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \N[9]_INST_0\ : label is "soft_lutpair13";
begin
\N[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(0)
    );
\N[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(10)
    );
\N[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(11)
    );
\N[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(12)
    );
\N[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(13)
    );
\N[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(14)
    );
\N[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(15)
    );
\N[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(16)
    );
\N[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(17)
    );
\N[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(18)
    );
\N[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(19)
    );
\N[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(1)
    );
\N[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(20)
    );
\N[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(21)
    );
\N[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(22)
    );
\N[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => log2N(4),
      I1 => log2N(3),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(23)
    );
\N[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(24)
    );
\N[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(25)
    );
\N[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(26)
    );
\N[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(27)
    );
\N[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(28)
    );
\N[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(29)
    );
\N[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(2)
    );
\N[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(30)
    );
\N[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(31)
    );
\N[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(3)
    );
\N[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(4)
    );
\N[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(5)
    );
\N[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(6)
    );
\N[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(7)
    );
\N[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(1),
      I3 => log2N(0),
      I4 => log2N(2),
      O => N(8)
    );
\N[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => log2N(3),
      I1 => log2N(4),
      I2 => log2N(0),
      I3 => log2N(1),
      I4 => log2N(2),
      O => N(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pos2_0_0 is
  port (
    log2N : in STD_LOGIC_VECTOR ( 4 downto 0 );
    N : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_pos2_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_pos2_0_0 : entity is "system_pos2_0_0,pow2,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_pos2_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_pos2_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_pos2_0_0 : entity is "pow2,Vivado 2020.1";
end system_pos2_0_0;

architecture STRUCTURE of system_pos2_0_0 is
begin
inst: entity work.system_pos2_0_0_pow2
     port map (
      N(31 downto 0) => N(31 downto 0),
      log2N(4 downto 0) => log2N(4 downto 0)
    );
end STRUCTURE;
