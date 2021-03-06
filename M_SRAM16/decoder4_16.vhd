library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY decoder4_16 IS
port ( input  : in std_logic_vector(3 downto 0);
       out1,out2,out3,out4,out5,out6,out7,out8,
       out9,out10,out11,out12,out13,out14,out15, out16: out std_logic
      );
END decoder4_16;

Architecture Struct OF decoder4_16 IS

SIGNAL s : std_logic_vector(15 downto 0);
Begin
  PROCESS(input)
  BEGIN
	 CASE input IS
		 WHEN "0000" => s <= "0000000000000001";
		 WHEN "0001" => s <= "0000000000000010";
		 WHEN "0010" => s <= "0000000000000100";
		 WHEN "0011" => s <= "0000000000001000";
		 WHEN "0100" => s <= "0000000000010000";
		 WHEN "0101" => s <= "0000000000100000";
		 WHEN "0110" => s <= "0000000001000000";
		 WHEN "0111" => s <= "0000000010000000";
		 WHEN "1000" => s <= "0000000100000000";
		 WHEN "1001" => s <= "0000001000000000";
		 WHEN "1010" => s <= "0000010000000000";
		 WHEN "1011" => s <= "0000100000000000";
		 WHEN "1100" => s <= "0001000000000000";
		 WHEN "1101" => s <= "0010000000000000";
		 WHEN "1110" => s <= "0100000000000000";
		 WHEN "1111" => s <= "1000000000000000";
		 WHEN OTHERS => s <= "0000000000000000";
     END CASE;
  END PROCESS;
  
  out1 <= s(0);
  out2 <= s(1);
  out3 <= s(2);
  out4 <= s(3);
  out5 <= s(4);
  out6 <= s(5);
  out7 <= s(6);
  out8 <= s(7);
  out9 <= s(8);
  out10 <= s(9);
  out11 <= s(10);
  out12 <= s(11);
  out13 <= s(12);
  out14 <= s(13);
  out15 <= s(14);
  out16 <= s(15);
END Struct;