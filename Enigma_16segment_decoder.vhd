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
    Segment_out <= 
        "1000100011001111" when (D = "01000001") else  --A
        "0010101000111111" when (D = "01000010") else  --B
        "0000000011110011" when (D = "01000011") else  --C
        "0010001000111111" when (D = "01000100") else  --D
        "1000000011110011" when (D = "01000101") else  --E
        "1000000011000011" when (D = "01000110") else  --F
        "0000100011111011" when (D = "01000111") else  --G
        "1000100011001100" when (D = "01001000") else  --H
        "0010001000110011" when (D = "01001001") else  --I
        "0000000001111100" when (D = "01001010") else  --J
        "1001010011000000" when (D = "01001011") else  --K
        "0000000011110000" when (D = "01001100") else  --L
        "0000010111001100" when (D = "01001101") else  --M
        "0001000111001100" when (D = "01001110") else  --N
        "0000000011111111" when (D = "01001111") else  --O
        "1000100011000111" when (D = "01010000") else  --P
        "0001000011111111" when (D = "01010001") else  --Q
        "1001100011000111" when (D = "01010010") else  --R
        "1000100010111011" when (D = "01010011") else  --S
        "0010001000000011" when (D = "01010100") else  --T
        "0000000011111100" when (D = "01010101") else  --U
        "0100010011000000" when (D = "01010110") else  --V
        "0101000011001100" when (D = "01010111") else  --W
        "0101010100000000" when (D = "01011000") else  --X
        "1000100010111100" when (D = "01011001") else  --Y
        "0100010000110011" when (D = "01011010") else  --Z
        "0000000000000000";
    
    
end architecture behavioral;