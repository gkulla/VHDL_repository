library IEEE;
use IEEE.std_logic_1164.all;

ENTITY decoder_enable IS
port ( a : in std_logic_vector(1 downto 0);
       en: in std_logic;
       f : out std_logic_vector(3 downto 0)
      );
END decoder_enable;

Architecture Behav OF decoder_enable IS
BEGIN
	Process(en, a)
		Begin
		f <= "0000";
			IF(en = '1') then
					 CASE a IS
						 when "00"   => f <= "0001"; --not a(1) and not a(0);
						 when "01"   => f <= "0010"; --not a(1) and  a(0);
						 when "10"   => f <= "0100"; --  a(1) and not a(0);
						 when "11"   => f <= "1000"; --a(1) and  a(0);
						 when others => f <= "0000";
					 END CASE;
			END IF;
	END PROCESS;
END Behav;