-- LIBRARIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- ENTITY
Entity CU is
-- si definiscono le porte di ingresso e di uscita
Port(clk, start: in std_logic;
     Op: in std_logic_vector(1 downto 0); 
     stato: out std_logic_vector(2 downto 0) 
     );
End CU;

-- ARCHITECTURE
architecture beh of CU is
    -- si definiscono i segnali
    signal st: std_logic_vector(2 downto 0);
begin
    -- si definiscono le operazioni
    stato <= st;
    
    -- si definisce il process
    process(clk)
    begin
    
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then
        
            case st is
            
                when "000" => if start='0' then st<="000";
                              else st<="001";
                              end if;
                              
                when "001" => if Op="0" then st<="010";
                              else st<="011";        
                              end if;
                              
                when "010" => st<="100";
                              
                when "100" => st<="101";                  
        
                when "101" => st<="000";
                
                when "011" => if Op="0" then st<="101";
                              else st<="000";        
                              end if;
                              
                end case;
        end if;
    end process;
end beh;
