-- LIBRARY
library ieee;

-- PACKAGE
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- ENTITY
entity DP is
-- si definiscono le porte di ingresso e di uscita
port(clk, sel: in std_logic;
     WRA, WRB, WRR: in std_logic;
     Din: in std_logic_vector(15 downto 0);
     R: out std_logic_vector(15 downto 0));
end DP;

-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal A, B, Ris, somma: std_logic_vector(15 downto 0);

begin
    -- si definiscono le operazioni
    somma <= A + B;
    
	-- si definisce il process
	process(clk)
	begin
		-- si verifica il fronte di discesa del clock
		if clk='0' and clk'event then

			if WRR='1' then R <= somma;
			end if;

			if WRA='1' then 
			     if sel= '0' then A <= Din;
			     else A <= somma;
			end if;

			if WRB='1' then B <= Din;
			end if;

		end if;
	 end process;
end beh;