library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SRAM_16_EN IS
port ( D      : in std_logic_vector(15 downto 0);
       SC,WE,EN  : in std_logic;
       Q      : out std_logic_vector(15 downto 0)
      );
END SRAM_16_EN;

Architecture Struct OF SRAM_16_EN IS
	COMPONENT SRAM4 IS
		port( D      : in std_logic_vector(3 downto 0);
		      SC,WE  : in std_logic;
              Q      : out std_logic_vector(3 downto 0)
         );
	END COMPONENT;

SIGNAL s_SC, s_WE: std_logic;
SIGNAL sQ : std_logic_vector(15 downto 0);

Begin
s_SC <= SC;
s_WE<= WE and EN;

SRAM16_0: SRAM4 PORT MAP(D(3 downto 0), s_SC, s_WE, sQ(3 downto 0));
SRAM16_1: SRAM4 PORT MAP(D(7 downto 4), s_SC, s_WE, sQ(7 downto 4));
SRAM16_2: SRAM4 PORT MAP(D(11 downto 8), s_SC, s_WE, sQ(11 downto 8));
SRAM16_3: SRAM4 PORT MAP(D(15 downto 12), s_SC, s_WE, sQ(15 downto 12));
Q(0)<= sQ(0) when (s_SC = '1') else 'Z';
Q(1)<= sQ(1) when (s_SC = '1') else 'Z';
Q(2)<= sQ(2) when (s_SC = '1') else 'Z';
Q(3)<= sQ(3) when (s_SC = '1') else 'Z';
Q(4)<= sQ(4) when (s_SC = '1') else 'Z';
Q(5)<= sQ(5) when (s_SC = '1') else 'Z';
Q(6)<= sQ(6) when (s_SC = '1') else 'Z';
Q(7)<= sQ(7) when (s_SC = '1') else 'Z';
Q(8)<= sQ(8) when (s_SC = '1') else 'Z';
Q(9)<= sQ(9) when (s_SC = '1') else 'Z';
Q(10)<= sQ(10) when (s_SC = '1') else 'Z';
Q(11)<= sQ(11) when (s_SC = '1') else 'Z';
Q(12)<= sQ(12) when (s_SC = '1') else 'Z';
Q(13)<= sQ(13) when (s_SC = '1') else 'Z';
Q(14)<= sQ(14) when (s_SC = '1') else 'Z';
Q(15)<= sQ(15) when (s_SC = '1') else 'Z';

END Struct;