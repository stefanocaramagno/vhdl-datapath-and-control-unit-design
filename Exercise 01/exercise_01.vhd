-- LIBRERIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;

-- ENTITY
Entity DPath is
-- si definiscono le porte di ingresso e di uscita
Port(Din: in std_logic_vector(15 downto 0);
     OP: in std_logic;
     Clk,WI, WO: in std_logic;
     Ris: out std_logic_vector(15 downto 0)
);
End DPath;

-- ARCHITECTURE
architecture beh of DPath is

-- si definiscono i segnali
signal AluOut, A: std_logic_vector(15 downto 0);

begin
    -- si definiscono le operazioni
    AluOut <= A or Din when OP='0';
    AluOut <= A and Din when OP='1';
    
    -- si definisce il process
    process(clk)
    begin
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then
        
            if WI = '1' then A <= Din;
            end if;
            
            if WO = '1' then Ris <= AluOut;
            end if;
            
        end if;
    end process;
end beh;
