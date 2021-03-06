library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity Display is
  port( A, B, C, D : in std_logic;
                 f : out std_logic_vector(6 downto 0);
                sf : out std_logic_vector(6 downto 0)
        );   
end Display;

architecture struct of Display is
signal sig_output1 : std_logic_vector(6 downto 0);
signal sig_output2 : std_logic_vector(6 downto 0);

BEGIN
--F0 = A'  + B' C' ;
--F1 = 1;
--F2 = 1;
--F3 = A'  + B' C' ;
--F4 = A'  + B' C' ;
--F5 = A'  + B' C' ;
--F6 = 0;
sig_output2(0) <= (not A)or(not B and not C) ;
sig_output2(1) <= '1';
sig_output2(2) <= '1';
sig_output2(3) <= (not A)or(not B and not C);
sig_output2(4) <= (not A)or(not B and not C);
sig_output2(5) <= (not A)or(not B and not C);
sig_output2(6) <= '0';
-------------------------------------------------------------------
--F0 = A' C  + A C'  + B D + B' D';
--F1 = B'  + A C'  + A D' + C' D' + A' C D;
--F2 = D + A B'  + B C  + A' C' ;
--F3 = A C'  + B' D' + A' B' C  + A B D + B C' D + A' C D';
--F4 = B' D' + A' C D' + A C' D';
--F5 = A B C  + A' B C'  + A B' C'  + A C D' + B C D' + B' C' D';
--F6 = A B  + A C'  + B C'  + A' B' C  + A' C D';
sig_output1(0) <=(not A and C)or(A and not C)or(B and D)or(not B and not D);
sig_output1(1) <=(not B)or(A and not C)or(A and not D)or(not C and not D)or(not A and C and D);
sig_output1(2) <= D or(A and not B)or(B and C)or(not A and not C); 
sig_output1(3) <=(A and not C)or(not B and not D)or(not A and not B and C)or(A and B and D)or(B and not C and D)or(not A and C and not D);
sig_output1(4) <=(not B and not D)or(not A and C and not D)or(A and not C and not D);
sig_output1(5) <= (A and B and C)or(not A and B and not C)or(A and not B and not C)or(A and C and not D)or(B and C and not D)or(not B and not C and not D);
sig_output1(6) <= (A and B)or(A and not C)or(B and not C)or(not A and not B and C)or(not A and C and not D);


f  <= NOT sig_output1;
sf  <= NOT sig_output2;
END struct;					