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
     selA, selB, writeA, writeB, writeR: out std_logic);
end CU;

-- ARCHITECTURE
architecture beh of CU is

begin
    
    selA <= '1' when 
        (state = "00" and code = '0') or
        (state = "01" and code = '0') or
        (state = "10" and code = '0') or
        (state = "11" and code = '0')
        else '0';
        
    selB <= '1' when 
        (state = "00" and code = '0') or
        (state = "01" and code = '0') or
        (state = "10" and code = '0') or
        (state = "11" and code = '0')
        else '0'; 
    
    writeA <= '1' when 
        (state = "00" and code = '1') or
        (state = "10" and code = '0') 
        else '0';

    writeB <= '1' when 
        (state = "01" and code = '0') or
        (state = "10" and code = '1')
        else '0';
        
    writeR <= '1' when 
        (state = "01" and code = '1') or
        (state = "11") 
        else '0';
        
end beh;



