library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity Keyboard is
    port (
        Data_in: IN std_logic_vector(7 downto 0);
        CLK: IN std_logic;
        Data_out: OUT std_logic_vector(7 downto 0);
        error: OUT std_logic
        
    );
end entity Keyboard;

architecture rtl of Keyboard is
    
begin
    process(CLK) is
    begin
        if(rising_edge(CLK)) then
            if(unsigned(Data_in) >= 65 and unsigned(Data_in) <= 90) then
                Data_out <= Data_in;
                error <= '0';
            else
                error <= '1';
                Data_out(7 downto 0) <= "00000000";
            end if;
        end if;
    end process;
    
end architecture rtl;