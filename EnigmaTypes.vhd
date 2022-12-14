LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE EnigmaTypes IS
    TYPE ROTOR_CONFIG IS ARRAY (0 TO 25) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
    TYPE ALPHABET_IN_BITS IS ARRAY (0 TO 25) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
    TYPE PLUGBOARD_CONFIG IS ARRAY (0 TO 25) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
END EnigmaTypes;