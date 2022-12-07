LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;

ENTITY RotorAndReflector IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF RotorAndReflector IS
    COMPONENT Rotor IS
        GENERIC (
            initialPos : INTEGER := 25;
            notchPos : INTEGER := 0;
            firstRotor : STD_LOGIC := '1'
        );
        PORT (
            rotor_map : IN ROTOR_CONFIG;
            direction : IN STD_LOGIC; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
            --Input and outputs are in ASCII binary
            letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT Reflector IS
        PORT (
            --Input and outputs are in ASCII binary
            letterin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            letterout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL reflectorBuffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    rotor_right : Rotor
    GENERIC MAP(1, 0, '1')
    PORT MAP(rotor_map => ROTOR_A, direction => 1, letterIn => input, letterOut => reflectorBuffer);

    reflector_unit : Reflector
    PORT MAP(letterin => reflectorBuffer, letterout => output);

END ARCHITECTURE;