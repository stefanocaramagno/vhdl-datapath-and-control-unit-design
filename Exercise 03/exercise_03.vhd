-- LIBRARY
library ieee;

-- PACKAGE
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- ENTITY
entity CU is
-- si definiscono le porte di ingresso e di uscita
port(clk, start: in std_logic;
     Op, ready: in std_logic;
     stato: out std_logic_vector(2 downto 0) 
);

end CU;

-- ARCHITECTURE
architecture beh of CU is

-- si definiscono i segnali
signal st: std_logic_vector(2 downto 0);

begin

	stato <= st;
	
	-- si definisce il process
	process(clk)
	begin
		-- si verifica il fronte di discesa del clock
	 	if clk'event and clk='0' then 

		    case st is
		    	
            -- 000
		    when "000" => if start = '1' then st <= "000";
				  else st <= "000";
				  end if;
			
			-- 001
			when "001" => if ready = '0' then st <= "001";
			      else st <= "010";
			      end if;
			
			-- 010	
			when "010" => if Op = '0' then st <= "100";
			      else st <= "011";
			      end if;
			
			-- 100
			when "100" => st <= "101";
			
			-- 011
			when "011" => st <= "000";
			
			-- 101
			when "101" => st <= "000";			

			end case;
			
		end if; 
	end process;	
end beh;