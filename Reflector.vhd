LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_textio.ALL;

USE work.EnigmaTypes.ALL;

ENTITY Reflector IS
    PORT (
        --Input and outputs are in ASCII binary
        letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Reflector;
ARCHITECTURE rtl OF Reflector IS
    CONSTANT REFLECTOR_MAP : ROTOR_CONFIG := REFLECTOR_PAIR_MAP;
BEGIN
    PROCESS (letterIn)
    BEGIN
        letterOut <= (OTHERS => '0');
        letterToInt <= to_integer(unsigned(letterIn));
        CASE letterIn IS
                --IN    ABCDEFGHIJKLMNOPQRSTUVWXYZ
                --OUT   EJMZALYXVBWFCRQUONTSPIKHGD
            WHEN "01000001" => letterOut <= "01000101";
            WHEN "01000010" => letterOut <= "01001010";
            WHEN "01000011" => letterOut <= "01001101";
            WHEN "01000100" => letterOut <= "01011010";
            WHEN "01000101" => letterOut <= "01000001";
            WHEN "01000110" => letterOut <= "01001100";
            WHEN "01000111" => letterOut <= "01011001";
            WHEN "01001000" => letterOut <= "01011000";
            WHEN "01001001" => letterOut <= "01010110";
            WHEN "01001010" => letterOut <= "01000010";
            WHEN "01001011" => letterOut <= "01010111";
            WHEN "01001100" => letterOut <= "01000110";
            WHEN "01001101" => letterOut <= "01000011";
            WHEN "01001110" => letterOut <= "01010010";
            WHEN "01001111" => letterOut <= "01010001";
            WHEN "01010000" => letterOut <= "01010101";
            WHEN "01010001" => letterOut <= "01001111";
            WHEN "01010010" => letterOut <= "01001110";
            WHEN "01010011" => letterOut <= "01010100";
            WHEN "01010100" => letterOut <= "01010011";
            WHEN "01010101" => letterOut <= "01010000";
            WHEN "01010110" => letterOut <= "01001001";
            WHEN "01010111" => letterOut <= "01001011";
            WHEN "01011000" => letterOut <= "01001000";
            WHEN "01011001" => letterOut <= "01000111";
            WHEN "01011010" => letterOut <= "01000100";
            WHEN OTHERS => letterOut <= "01000001";
        END CASE;
    END PROCESS;
END ARCHITECTURE rtl;