LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Reflector IS
    PORT (
        clk : IN STD_LOGIC;
        isPressed : IN STD_LOGIC;
        --Input and outputs are in ASCII binary
        letterIn : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        letterOut : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl OF Reflector IS
BEGIN
    PROCESS (letterIn)
    BEGIN
        CASE letterIn IS
            WHEN "01000001" => letterOut <= "01000101";
            WHEN "01000010" => letterOut <= "01001011";
            WHEN "01000011" => letterOut <= "01001101";
            WHEN "01000100" => letterOut <= "01000110";
            WHEN "01000101" => letterOut <= "01001100";
            WHEN "01000110" => letterOut <= "01000111";
            WHEN "01000111" => letterOut <= "01000100";
            WHEN "01001000" => letterOut <= "01010001";
            WHEN "01001001" => letterOut <= "01010110";
            WHEN "01001010" => letterOut <= "01011010";
            WHEN "01001011" => letterOut <= "01001110";
            WHEN "01001100" => letterOut <= "01010100";
            WHEN "01001101" => letterOut <= "01001111";
            WHEN "01001110" => letterOut <= "01010111";
            WHEN "01001111" => letterOut <= "01011001";
            WHEN "01010000" => letterOut <= "01001000";
            WHEN "01010001" => letterOut <= "01011000";
            WHEN "01010010" => letterOut <= "01010101";
            WHEN "01010011" => letterOut <= "01010011";
            WHEN "01010100" => letterOut <= "01010000";
            WHEN "01010101" => letterOut <= "01000001";
            WHEN "01010110" => letterOut <= "01001001";
            WHEN "01010111" => letterOut <= "01000010";
            WHEN "01011000" => letterOut <= "01010010";
            WHEN "01011001" => letterOut <= "01000011";
            WHEN "01011010" => letterOut <= "01001010";
        END CASE;
    END PROCESS;
END ARCHITECTURE;