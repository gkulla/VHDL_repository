library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FSM IS
port ( Clk,Rst, w : in std_logic;
                z : out std_logic;
    current_state : out std_logic_vector(8 downto 0)
      );
END FSM;

Architecture Struct OF FSM IS
TYPE State_type is (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D: State_type;
BEGIN
    
    PROCESS(w, Clk, Rst)
	BEGIN
	IF Clk'event and Clk = '1' then
		IF Rst='1' then Y_D <= A;
	    ELSE
			CASE Y_D IS
				WHEN A => IF(w='0') THEN Y_D<=B;
					   ELSE Y_D<=F;
					   END IF;
				WHEN B => IF(w='1') THEN Y_D<=F;
					   ELSIF(w='0') THEN Y_D<=C;
					   END IF;
				WHEN C => IF(w='0') THEN Y_D<=D;
					   ELSE Y_D<=F;
					   END IF;
				WHEN D => IF(w='0') THEN Y_D<=E;
					   ELSE Y_D<=F;
					   END IF;
				WHEN E => IF(w='0') THEN Y_D<=E;
					   ELSE Y_D<=F;
					   END IF;
				WHEN F => IF(w='0') THEN Y_D<=B;
					   ELSE Y_D<=G;
					   END IF;
				WHEN G => IF(w='0') THEN Y_D<=B;
					   ELSE Y_D<=H;
					   END IF;
				WHEN H => IF(w='0') THEN Y_D<=B;
					   ELSE Y_D<=I;
					   END IF;
				WHEN I => IF(w='0') THEN Y_D<=B;
					   ELSE Y_D<=I;
					   END IF;
				WHEN OTHERS => NULL;
			END CASE;
		  END IF;
	  END IF;
	END PROCESS;
	
	PROCESS(Y_D)
	BEGIN
	CASE Y_D IS
		WHEN A =>current_state<="000000001";
		WHEN B =>current_state<="000000010";
		WHEN C =>current_state<="000000100";
		WHEN D =>current_state<="000001000";
		WHEN E =>current_state<="000010000";
		WHEN F =>current_state<="000100000";
		WHEN G =>current_state<="001000000";
		WHEN H =>current_state<="010000000";
		WHEN I =>current_state<="100000000";
		WHEN OTHERS =>current_state<="000000000";
	END CASE;
	END PROCESS;
	
   z <= '1' when (Y_D = E and w='0') else
        '1' when (Y_D = I and w='1') else
        '0';
	
END Struct;