-- LIBRERIE
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

-- ENTITY
Entity DP is
-- si definiscono le porte di ingresso di uscita
Port(clk: std_logic;
     WRA, WRB: in std_logic;
     OP: in std_logic_vector(1 downto 0);
     Di: in std_logic_vector(15 downto 0);
     R: out std_logic_vector(15 downto 0)
);
End DP;

-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal Ris, ALU, A, B: std_logic_vector(15 downto 0);

begin
    -- si definiscono le operazioni
    ALU <= A + Di when OP = "00";
    ALU <= A + B when OP = "01";
    ALU <= A or Di when OP = "10";
    
    Ris <= ALU;
    
    -- si definisce il process
    process(clk)
        begin
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then
        
            if WRA = '1' then A <= Di;
            end if;
            
            if WRA = '1' then B <= Ris;
            end if;
        
        end if;
    end process;
end beh;
