library IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity COUNT10 is
   port ( CLK: in std_logic;
          COUNT: out integer
         );
   end COUNT10;
   
architecture behav_COUNT of COUNT10 is
begin
 
  P_COUNT: process
 
   variable intern_value: integer :=0; 
   begin 
     COUNT <= intern_value;
      
        wait until rising_edge(CLK);
        intern_value:=(intern_value + 1) mod 10;
        COUNT <= intern_value;
     
end PROCESS P_COUNT;
end behav_COUNT;