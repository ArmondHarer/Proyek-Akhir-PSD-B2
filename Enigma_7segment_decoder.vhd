library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Enigma_7segment_decoder is
    port (
        D : in std_logic_vector(4 downto 0);
        Segment_out : out std_logic_vector(4 downto 0)
    );
end entity Enigma_7segment_decoder;

architecture behavioral of Enigma_7segment_decoder is
    
begin
    Segment_out <= 
        "0001000" when (D = "00000") else  --A
        "0000011" when (D = "00001") else  --b
        "1000110" when (d = "00010") else  --C
        "0100001" when (D = "00011") else  --d
        "0000110" when (D = "00100") else  --E
        "0001110" when (D = "00101") else  --F
        "1000010" when (D = "00110") else  --G
        "0001011" when (D = "00111") else  --h
        "1001111" when (D = "01000") else  --I
        "1100001" when (D = "01001") else  --J
        "0001010" when (D = "01010") else  --k
        "1000111" when (D = "01011") else  --L
        "1101010" when (D = "01100") else  --M
        "1001000" when (D = "01101") else  --N
        "1000000" when (D = "01110") else  --O
        "0001100" when (D = "01111") else  --P
        "0011000" when (D = "10000") else  --q
        "0101111" when (D = "10001") else  --r
        "0010010" when (D = "10010") else  --S
        "0000111" when (D = "10011") else  --t
        "1000001" when (D = "10100") else  --U
        "1100011" when (D = "10101") else  --v
        "1010101" when (D = "10110") else  --w
        "0111001" when (D = "10111") else  --X
        "0010001" when (D = "11000") else  --y
        "0101101" when (D = "11001") else  --z					
        "1111111";
    
    
end architecture behavioral;

--  -a-
-- f   b
-- f   b
--  -g-
-- e   c
-- e   c
--  -d-	
