library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity counter8 is
    generic(n:natural:=8);	
	port(clock:in STD_LOGIC;
	   reset_n:in STD_LOGIC;
	         Q:out STD_LOGIC_VECTOR(n-1 downto 0)
	    );
end counter8;

architecture rtl8 of counter8 is
	COMPONENT counter is
		generic(n:natural:=4);	
		port(clock:in STD_LOGIC;
		   reset_n:in STD_LOGIC;
				 Q:out STD_LOGIC_VECTOR(n-1 downto 0)
			);
	end COMPONENT;
SIGNAL sQ: STD_LOGIC_VECTOR(7 downto 0);
begin
counter8_0: counter generic map(n=>8) port map (clock, reset_n, sQ);
Q<=sQ;
end rtl8;















