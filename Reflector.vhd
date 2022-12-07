library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Reflector is
    Port ( clk : in std_logic;
        turnNext : in std_logic;
        direction: in std_logic; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
        isPressed : in std_logic;
        notchPos : in std_logic;
        rotorPos: in integer;
        --Input and outputs are in ASCII binary
        letterin : inout std_logic_vector(7 downto 0);
        letterout : inout std_logic_vector(7 downto 0));
end rotor1;


architecture rtl of rotor1 is

    
begin
    



    process (isPressed)
    begin
        if direction = '1' then  
            case letterin is
                --IN    ABCDEFGHIJKLMNOPQRSTUVWXYZ
                --OUT   EJMZALYXVBWFCRQUONTSPIKHGD
            
                when "01000001" => letterout <= "01000101"; 
                when "01000010" => letterout <= "01001010";
                when "01000011" => letterout <= "01001101";
                when "01000100" => letterout <= "01011010";
                when "01000101" => letterout <= "01000001";
                when "01000110" => letterout <= "01001100";
                when "01000111" => letterout <= "01011001";
                when "01001000" => letterout <= "01011000";
                when "01001001" => letterout <= "01010110";
                when "01001010" => letterout <= "01000010";
                when "01001011" => letterout <= "01010111";
                when "01001100" => letterout <= "01000110";
                when "01001101" => letterout <= "01000011";
                when "01001110" => letterout <= "01010010";
                when "01001111" => letterout <= "01010001";
                when "01010000" => letterout <= "01010101";
                when "01010001" => letterout <= "01001111";
                when "01010010" => letterout <= "01001110";
                when "01010011" => letterout <= "01010100";
                when "01010100" => letterout <= "01010011";
                when "01010101" => letterout <= "01010000";
                when "01010110" => letterout <= "01001001";
                when "01010111" => letterout <= "01001011";
                when "01011000" => letterout <= "01001000";
                when "01011001" => letterout <= "01000111";
                when "01011010" => letterout <= "01000100";
                when others => report "Out of bounds" severity failure;
            end case;
        
            
    end process;
      
            



    
end architecture rtl;


