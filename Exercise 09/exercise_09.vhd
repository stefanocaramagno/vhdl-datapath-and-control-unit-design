-- LIBRARY
library IEEE;

-- PACKAGE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

-- ENTITY
Entity DP is
-- si definiscono le porte di ingresso e di uscita
Port(clk, sel, OP: in std_logic;
     WA, WR: in std_logic;
     I: in std_logic_vector(15 downto 0);
     R: out std_logic_vector(15 downto 0)
);
end DP;

-- ARCHITECTURE
architecture beh of DP is

-- si definiscono i segnali
signal A, B, ALU, AluRis, Ris: std_logic_vector(15 downto 0);

begin
    -- si definiscono le operazioni e la logica
    B <= Ris when sel = '0';
    B <= I when sel = '1';
       
    ALU <= A + B when OP = '0'; 
    ALU <= A and B when OP = '1';
    
    AluRis <= ALU; 
    
    -- si definisce il process
    process(clk)
    begin
        -- si verifica il fronte di discesa del clock
        if clk'event and clk='0' then

            if WA = '1' then A <= I;
            end if; 

            if WR = '1' then Ris <= AluRis;
            end if;
                         
        end if;
    end process;
end beh;