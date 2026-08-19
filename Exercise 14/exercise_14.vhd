-- LIBRERIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

-- ENTITY
Entity CU is
Port(clk, start: in std_logic;
     Op, ready: in std_logic;
     conta: in integer range 0 to 2;
     stato: out integer range 0 to 4);
End CU;

-- ARCHITECTURE
Architecture beh of CU is

-- si definiscono i segnali
signal st: integer range 0 to 4;

begin
    stato <= st;
    
    -- si definisce il process
    process(clk)
    begin
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then
        
            case st is
    
                -- 0
                when 0 => if start = '0' then st <= 0;
                    else st <= 1;
                    end if;

                -- 1
                when 1 => if Op = '0' then st <= 2;
                    else st <= 3;
                    end if;

                -- 2
                when 2 => st <= 4;
     
                -- 3
                when 3 => if conta < 2 then st <= 0;
                    else st <= 3;
                    end if;     
                    
                -- 4
                when 4 => if ready = '0' then st <= 4;
                    else st <= 0;
                    end if;                                
                            
            end case;
        end if;
    end process;
end beh;
