library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY MS_ff IS
port ( D, Clk  : in std_logic;
       Q        : out std_logic
      );
END MS_ff;

Architecture Struct OF MS_ff IS
	COMPONENT d_latch IS
		port ( D, Clk  : in std_logic;
			   Q, notQ: out std_logic
			  );
	END COMPONENT;

SIGNAL s_q, s_notq, sQ, snotQ, clock_sig, n_clock_sig: std_logic;
Begin

clock_sig <= Clk;
n_clock_sig <= not clock_sig ;

SRAM0: d_latch PORT MAP(D, n_clock_sig , s_q, s_notq);
SRAM1: d_latch PORT MAP(s_q, clock_sig , sQ, snotQ);
Q<= sQ;
	
END Struct;