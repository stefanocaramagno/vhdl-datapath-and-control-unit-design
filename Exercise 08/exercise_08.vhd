-- LIBRARY
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- ENTITY
Entity DP is
-- si definiscono le porte di ingresso e di uscita
Port(clk, reset,op: in std_logic;
     WRA,WRB: in std_logic; 
     Din: in std_logic_vector(7 downto 0);
     R: out std_logic_vector(7 downto 0) 
);
End DP;

-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal ALURis, A, B: std_logic_vector(7 downto 0);

begin
    -- si definiscono le operazioni
    ALURis <= A + B when op = '0';
    ALURis <= A or B when op = '1';
    
    -- si definisce il proces
    process(clk)
    begin
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then
            
            if WRA = '1' then 
                if reset='0' then A <= "00000000";
                else A <= ALURis;
                end if;
            end if;
            
            if WRB = '1' then B <= Din;
            end if;
               
        end if;
    end process;
end beh;
