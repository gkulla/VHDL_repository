library ieee;
use ieee.STD_LOGIC_1164.ALL;


entity Seg_Dispaly16 is
  port( input: in std_logic_vector(15 downto 0);
        out1: out std_logic_vector(6 downto 0);
        out2: out std_logic_vector(6 downto 0);
        out3: out std_logic_vector(6 downto 0);
        out4: out std_logic_vector(6 downto 0)
       );      
end Seg_Dispaly16;

architecture struct of Seg_Dispaly16 is
  signal sout1 : std_logic_vector(6 downto 0);
  signal sout2 : std_logic_vector(6 downto 0);
  signal sout3 : std_logic_vector(6 downto 0);
  signal sout4 : std_logic_vector(6 downto 0);
  
begin
  process(input(3 downto 0)) is
    begin
  case input(3 downto 0) is
  
  when "0000"=>sout1<="1111110";
  when "0001"=>sout1<="0110000";
  when "0010"=>sout1<="1101101";
  when "0011"=>sout1<="1111001";
  when "0100"=>sout1<="0110011";
  when "0101"=>sout1<="1011011";
  when "0110"=>sout1<="1011111";
  when "0111"=>sout1<="1110000";
  when "1000"=>sout1<="1111111";
  when "1001"=>sout1<="1111011";
  when "1010"=>sout1<="1110111";
  when "1011"=>sout1<="0011111";
  when "1100"=>sout1<="0001101";
  when "1101"=>sout1<="0111101";
  when "1110"=>sout1<="1001111";
  when "1111"=>sout1<="1000111";
  when others=>sout1<="0000001";
end case;
end process;

  process(input(7 downto 4)) is
    begin
  case input(7 downto 4) is
  
  when "0000"=>sout2<="1111110";
  when "0001"=>sout2<="0110000";
  when "0010"=>sout2<="1101101";
  when "0011"=>sout2<="1111001";
  when "0100"=>sout2<="0110011";
  when "0101"=>sout2<="1011011";
  when "0110"=>sout2<="1011111";
  when "0111"=>sout2<="1110000";
  when "1000"=>sout2<="1111111";
  when "1001"=>sout2<="1111011";
  when "1010"=>sout2<="1110111";
  when "1011"=>sout2<="0011111";
  when "1100"=>sout2<="0001101";
  when "1101"=>sout2<="0111101";
  when "1110"=>sout2<="1001111";
  when "1111"=>sout2<="1000111";
  when others=>sout2<="0000001";
end case;
end process;

  process(input(11 downto 8)) is
    begin
  case input(11 downto 8) is
  
  when "0000"=>sout3<="1111110";
  when "0001"=>sout3<="0110000";
  when "0010"=>sout3<="1101101";
  when "0011"=>sout3<="1111001";
  when "0100"=>sout3<="0110011";
  when "0101"=>sout3<="1011011";
  when "0110"=>sout3<="1011111";
  when "0111"=>sout3<="1110000";
  when "1000"=>sout3<="1111111";
  when "1001"=>sout3<="1111011";
  when "1010"=>sout3<="1110111";
  when "1011"=>sout3<="0011111";
  when "1100"=>sout3<="0001101";
  when "1101"=>sout3<="0111101";
  when "1110"=>sout3<="1001111";
  when "1111"=>sout3<="1000111";
  when others=>sout3<="0000001";
end case;
end process;

  process(input(15 downto 12)) is
    begin
  case input(15 downto 12) is
  
  when "0000"=>sout4<="1111110";
  when "0001"=>sout4<="0110000";
  when "0010"=>sout4<="1101101";
  when "0011"=>sout4<="1111001";
  when "0100"=>sout4<="0110011";
  when "0101"=>sout4<="1011011";
  when "0110"=>sout4<="1011111";
  when "0111"=>sout4<="1110000";
  when "1000"=>sout4<="1111111";
  when "1001"=>sout4<="1111011";
  when "1010"=>sout4<="1110111";
  when "1011"=>sout4<="0011111";
  when "1100"=>sout4<="0001101";
  when "1101"=>sout4<="0111101";
  when "1110"=>sout4<="1001111";
  when "1111"=>sout4<="1000111";
  when others=>sout4<="0000001";
end case;
end process;

out1 <= not sout1;
out2 <= not sout2;
out3 <= not sout3;
out4 <= not sout4;
END struct;