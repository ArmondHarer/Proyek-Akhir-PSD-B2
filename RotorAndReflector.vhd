LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RotorAndReflector IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output_rotor : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF RotorAndReflector IS
    SIGNAL reflectorBuffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    -- Rightmost rotor component
    rotor_right : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '1')
        PORT MAP(rotor_type => "00", direction => '1', letterIn => input, letterOut => reflectorBuffer);
    -- Save output from first rotor to output_rotor
    output_rotor <= reflectorBuffer;
    -- The reflector component
    reflector_unit : ENTITY work.Reflector
        PORT MAP(letterin => reflectorBuffer, letterout => output);

END ARCHITECTURE;