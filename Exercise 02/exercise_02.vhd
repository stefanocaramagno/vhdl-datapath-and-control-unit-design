-- LIBRARY
library ieee;

-- PACKAGE
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- ENTITY
entity Datapath is
-- si definiscono le porte di ingresso e di uscita
port (clk, WA,WB,WR, Sel: in std_logic;
      Din: in std_logic_vector(7 downto 0);
      R: out std_logic);
end Datapath;

-- ARCHITECTURE
architecture behavioral of Datapath is

-- si definiscono i segnali
signal A, B, Val: std_logic_vector(7 downto 0);
signal Ris: std_logic;

begin
    -- si definiscono le operazioni
	Val <= A when sel = '0' else B;
	Ris <= '1' when Val < Din else '0';

	-- si definisce il process
	process(clk)
	begin
		-- si verifica il fronte di discesa del clock
		if clk='0' and clk'event then

			if WA='1' then A <= Din;
			end if;

			if WB='1' then B <= Din;
			end if;

			if WR='1' then R <= Ris;
			end if;

		end if;
	end process;
end behavioral;