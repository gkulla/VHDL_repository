library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY Csc21100_1bit_add_sub IS
port ( a, b, cin : in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_1bit_add_sub;

Architecture Behaviour OF Csc21100_1bit_add_sub IS
Begin
	   -- sum <=  (not a and not b and cin) or
        --                (not a and b and not cin) or
        --                (a and not b and not cin) or
        --                (a and b and cin);

        --cout <= (not a and b and cin) or
        --                (a and not b and cin) or
        --                (a and b and not cin) or
        --                (a and b and cin);
        --sum   <= ((a xor b) xor cin);
		--cout  <= ((a and b) or (cin and (a xor b)));
		-- sum <= (a xor b) xor cin;
        -- cout <= (a and (b or cin)) or (cin and b);
        sum <= (a xor b) xor cin;
        cout <= (a and cin) or (b and cin) or (a and b);

END Behaviour;
-----------------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY Csc21100_4bit_add_sub IS
port ( a3, b3  : in std_logic_vector(3 downto 0);
          cin  : in std_logic;
          sum3 : out std_logic_vector(3 downto 0);
      overflow : out std_logic
      );
END Csc21100_4bit_add_sub;

Architecture Behaviour OF Csc21100_4bit_add_sub IS
COMPONENT Csc21100_1bit_add_sub
	  port ( a, b, cin : in std_logic;
             sum, cout : out std_logic
            );
END COMPONENT;

Signal sig, temp: std_logic_vector(3 downto 0);

Begin
	PROCESS(cin)
	BEGIN
		IF (cin = '1')
			then temp <= ((not (b3)));
			Else
			temp <= b3;
		end IF;
	END PROCESS;
Csc_Bit_Adder0: Csc21100_1bit_add_sub PORT MAP(a3(0), temp(0), cin, sum3(0), sig(0));
Csc_Bit_Adder1: Csc21100_1bit_add_sub PORT MAP(a3(1), temp(1), sig(0), sum3(1), sig(1));
Csc_Bit_Adder2: Csc21100_1bit_add_sub PORT MAP(a3(2), temp(2), sig(1), sum3(2), sig(2));
Csc_Bit_Adder3: Csc21100_1bit_add_sub PORT MAP(a3(3), temp(3), sig(2), sum3(3), sig(3));	
overflow <= sig(3);
  
END Behaviour;
