-- LIBRERIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

-- ENTITY
Entity DP is
-- si definiscono le porte di ingresso e di uscita
Port(clk, selA, op: in std_logic;
     WRA, WRB: in std_logic;
     Din: in std_logic_vector(7 downto 0);
     R: out std_logic_vector(7 downto 0) );
End DP;
    
-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal A, B, ALURis, somma, sottrazione: std_logic_vector(7 downto 0);

begin
        -- si definiscono le operazioni
        somma <= A + B;
        sottrazione <= A - B;
        
        ALURis <= somma when op='0';
        ALURis <= sottrazione when op='1';
    
        -- si definisce il process
        process(clk)
        begin
            -- si definisce il fronte di discesa del clock
            if clk'event and clk='0' then
         
                if WRA='1' then 
                    if  selA = '0' then A <= Din;
                    else A <= ALURis;   
                    end if;     
                end if;
                
                if WRB='1' then B <= Din;
                end if;     
                           
            end if;
        end process;
end beh;
