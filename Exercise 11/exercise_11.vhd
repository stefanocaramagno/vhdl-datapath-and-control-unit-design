-- LIBRERIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;

-- ENTITY
Entity CU is
-- si definiscono le porte di ingresso e di uscita
Port(op: in std_logic;
     stato: in std_logic_vector(1 downto 0);
     Sel, Exel, Exe2, Write, Ready: out std_logic);
End CU;

-- ARCHITECTURE
Architecture beh of CU is
begin
    
    Sel <= '1' when 
        (stato = "01" and op = '1') or
        (stato = "10" and op = '1') 
        else '0';
        
    Exel <= '1' when stato = "10" else '0';
    
    Exe2 <= '1' when stato = "11" else '0';
    
    Write <= '1' when stato = "10" or stato "11" else '0';
    
    Ready <= '1' when stato = "00" else '0';
    
end beh;
