library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux_2_to_1 IS
port ( a, b, s : in std_logic;
             f : out std_logic
      );
END Mux_2_to_1;

Architecture Behaviour OF Mux_2_to_1 IS
Begin
 f <= (s and a) or ((not s) and b);
END Behaviour;

