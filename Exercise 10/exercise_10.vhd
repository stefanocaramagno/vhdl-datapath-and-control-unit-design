-- LIBRARY
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

-- ENTITY
entity DP is
-- si definiscono le porte di ingresso e d'uscita
Port(clk, WA, WR: in std_logic;
     OP: in std_logic_vector(1 downto 0);
     I: in std_logic_vector(15 downto 0);
     R: out std_logic_vector(15 downto 0)
);
end DP;

-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal A, ALU, Ris: std_logic_vector(15 downto 0);

begin
    -- si definiscono le operazioni
    ALU <= A + I when OP = "00";
    ALU <= A or I when OP = "01";
          
    ALU <= A when OP = "10" and A < I;  
         
    ALU <= I when OP = "10" and I < A;  
            
    ALU <= A and I when OP = "11";
    
    Ris <= ALU;
    
    -- si definisce il process
    process(clk)
        begin
            if clk'event and clk='0' then
            
                if WA = '1' then A <= I;
                end if;

                if WR = '1' then R <= Ris;
                end if;
                
             end if;
    end process;
end beh;
