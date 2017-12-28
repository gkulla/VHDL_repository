library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY JK_ff IS
port ( J, K, Clk  : in std_logic;
       Q, notQ: buffer std_logic
      );
END JK_ff;

Architecture Struct OF JK_ff IS
	COMPONENT Positive_D_ff IS
		port ( D, Clk  : in std_logic;
			   Q, notQ: buffer std_logic
			  );
	END COMPONENT;

SIGNAL sD,sClk, sQ, snotQ: std_logic;
Begin
sD <= (J and notQ)or((not K) and Q);
sClk <= Clk;

MS_D_ff0: Positive_D_ff PORT MAP(sD, sClk, sQ, snotQ);
Q <= sQ;
notQ <= snotQ;
END Struct;