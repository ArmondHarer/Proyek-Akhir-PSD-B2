LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE EnigmaTypes IS
    TYPE ROTOR_CONFIG IS ARRAY (25 DOWNTO 0) OF INTEGER RANGE 0 TO 25;
    TYPE PLUGBOARD_CONFIG IS ARRAY (25 downto 0) OF std_logic_vector (7 downto 0);
END EnigmaTypes;