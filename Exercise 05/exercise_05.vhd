-- LIBRARY
library ieee;

-- PACKAGE
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- ENTITY
entity CU is
-- si definiscono le porte di ingresso e di uscita
port(clk, start: in std_logic;
     Op,ready: in std_logic; 
     stato: out integer range 0 to 4);
end CU;

-- ARCHITECTURE
architecture beh of CU is 

-- si definiscono i segnali
signal st: integer range 0 to 4;

begin

    stato <= st;
    
    -- si definisce il process
	process(clk)
	begin
		-- si verifica il fronte di discesa del clock
	 	if clk'event and clk='0' then 

		    case st is
		    	
            -- 0
		    when 0 => if start = '0' then st <= 0;
				  else st <= 1;
				  end if;
			
			-- 1
			when 1 => if ready = '0' then st <= 1;
			      else st <= 2;
			      end if;
			
			-- 2
			when 2 => if Op = '0' then st <= 4;
			      else st <= 3;
			      end if;
			
			-- 3
			when 3 => if ready = '0' then st <= 3;
			     else st <= 4;
			     end if;
			
			-- 4
			when 4 => st <= 0;		

			end case;
			
		end if; 
	end process;	
end beh;