LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Reflector IS
    PORT (
        --Input and outputs are in ASCII binary
        letterin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        letterout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Reflector;
ARCHITECTURE rtl OF Reflector IS
BEGIN
    PROCESS (letterin)
    BEGIN

        CASE letterin IS
                --IN    ABCDEFGHIJKLMNOPQRSTUVWXYZ
                --OUT   EJMZALYXVBWFCRQUONTSPIKHGD

            WHEN "01000001" => letterout <= "01000101";
            WHEN "01000010" => letterout <= "01001010";
            WHEN "01000011" => letterout <= "01001101";
            WHEN "01000100" => letterout <= "01011010";
            WHEN "01000101" => letterout <= "01000001";
            WHEN "01000110" => letterout <= "01001100";
            WHEN "01000111" => letterout <= "01011001";
            WHEN "01001000" => letterout <= "01011000";
            WHEN "01001001" => letterout <= "01010110";
            WHEN "01001010" => letterout <= "01000010";
            WHEN "01001011" => letterout <= "01010111";
            WHEN "01001100" => letterout <= "01000110";
            WHEN "01001101" => letterout <= "01000011";
            WHEN "01001110" => letterout <= "01010010";
            WHEN "01001111" => letterout <= "01010001";
            WHEN "01010000" => letterout <= "01010101";
            WHEN "01010001" => letterout <= "01001111";
            WHEN "01010010" => letterout <= "01001110";
            WHEN "01010011" => letterout <= "01010100";
            WHEN "01010100" => letterout <= "01010011";
            WHEN "01010101" => letterout <= "01010000";
            WHEN "01010110" => letterout <= "01001001";
            WHEN "01010111" => letterout <= "01001011";
            WHEN "01011000" => letterout <= "01001000";
            WHEN "01011001" => letterout <= "01000111";
            WHEN "01011010" => letterout <= "01000100";
            WHEN OTHERS => REPORT "Out of bounds" SEVERITY failure;
        END CASE;
    END PROCESS;
END ARCHITECTURE rtl;