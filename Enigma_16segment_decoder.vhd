library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Enigma_16segment_decoder is
    port (
        D : in std_logic_vector(7 downto 0);
        Segment_out : out std_logic_vector(15 downto 0)
    );
end entity Enigma_16segment_decoder;

architecture behavioral of Enigma_16segment_decoder is
    
begin
    process (D) is 
    begin
    Segment_out <= (OTHERS => '0');
    case D is
    when "01000001" => Segment_out <= "1000100011001111";  --A
    when "01000010" => Segment_out <= "0010101000111111";  --B
    when "01000011" => Segment_out <= "0000000011110011";  --C
    when "01000100" => Segment_out <= "0010001000111111";  --D
    when "01000101" => Segment_out <= "1000000011110011";  --E
    when "01000110" => Segment_out <= "1000000011000011";  --F
    when "01000111" => Segment_out <= "0000100011111011";  --G
    when "01001000" => Segment_out <= "1000100011001100";  --H
    when "01001001" => Segment_out <= "0010001000110011";  --I
    when "01001010" => Segment_out <= "0000000001111100";  --J
    when "01001011" => Segment_out <= "1001010011000000";  --K
    when "01001100" => Segment_out <= "0000000011110000";  --L
    when "01001101" => Segment_out <= "0000010111001100";  --M
    when "01001110" => Segment_out <= "0001000111001100";  --N
    when "01001111" => Segment_out <= "0000000011111111";  --O
    when "01010000" => Segment_out <= "1000100011000111";  --P
    when "01010001" => Segment_out <= "0001000011111111";  --Q
    when "01010010" => Segment_out <= "1001100011000111";  --R
    when "01010011" => Segment_out <= "1000100010111011";  --S
    when "01010100" => Segment_out <= "0010001000000011";  --T
    when "01010101" => Segment_out <= "0000000011111100";  --U
    when "01010110" => Segment_out <= "0100010011000000";  --V
    when "01010111" => Segment_out <= "0101000011001100";  --W
    when "01011000" => Segment_out <= "0101010100000000";  --X
    when "01011001" => Segment_out <= "1000100010111100";  --Y
    when "01011010" => Segment_out <= "0100010000110011";  --Z
    end case;
end process;
    
    
end architecture behavioral;