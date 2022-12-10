LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;

ENTITY Plugboard IS
    PORT (
        letter_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        letter_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY Plugboard;

ARCHITECTURE Behavioral OF Plugboard IS
    -- SIGNAL indexnum : INTEGER := 1;
    CONSTANT plugboardConst : PLUGBOARD_CONFIG := PLUGBOARDMAP;
BEGIN

    plugboard_proc : PROCESS (letter_in)
    BEGIN
        letter_out <= plugboardConst(to_integer(unsigned(letter_in)) MOD 65);
    END PROCESS;
END ARCHITECTURE;