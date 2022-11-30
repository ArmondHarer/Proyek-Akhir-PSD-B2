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
        
        "1010000001110000" when (D = "01100001") else  --a
        "1010000011100000" when (D = "01100010") else  --b
        "1000000001100000" when (D = "01100011") else  --c
        "0010100000011100" when (D = "01100100") else  --d
        "1100000001100000" when (D = "01100101") else  --e
        "1010101000000010" when (D = "01100110") else  --f
        "1010001010100001" when (D = "01100111") else  --g
        "1010000011000000" when (D = "01101000") else  --h
        "0010000000000000" when (D = "01101001") else  --i
        "0010001001100000" when (D = "01101010") else  --j
        "0011011000000000" when (D = "01101011") else  --k
        "0000000011000000" when (D = "01101100") else  --l
        "1010100001001000" when (D = "01101101") else  --m
        "1010000001000000" when (D = "01101110") else  --n
        "1010000001100000" when (D = "01101111") else  --o
        "1000001011000001" when (D = "01110000") else  --p
        "1010001010000001" when (D = "01110001") else  --q
        "1000000001000000" when (D = "01110010") else  --r
        "1010000010100001" when (D = "01110011") else  --s
        "1000000011100000" when (D = "01110100") else  --t
        "0010000001100000" when (D = "01110101") else  --u
        "0100000001000000" when (D = "01110110") else  --v
        "0101000001001000" when (D = "01110111") else  --w
        "0101010100000000" when (D = "01111000") else  --x
        "0000101000011100" when (D = "01111001") else  --y
        "1100000000100000" when (D = "01111010") else  --z
    
        "0000000000000000";
    
    
end architecture behavioral;