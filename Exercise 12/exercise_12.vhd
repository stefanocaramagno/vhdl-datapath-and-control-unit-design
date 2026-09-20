-- LIBRARY
library ieee;

-- PACKAGE
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- ENTITY
entity CU is
-- si definiscono le porte di ingresso e di uscita
port(code: in std_logic;
     state: in std_logic_vector(1 downto 0);
     ExeA, ExeB, WriteA, WriteB, WriteR: out std_logic);
end CU;

-- ARCHITECTURE
architecture beh of CU is

begin
	ExeA <= '1' when state = "01" and code = '0' else '0';
	ExeB <= '1' when state = "01" and code = '1' else '0';
	WriteA <= '1' when state = "00" and code = '0' else '0';
    WriteB <= '1' when state = "00" and code = '1' else '0';
	WriteR <= '1' when state = "11" else '0';

end beh;

