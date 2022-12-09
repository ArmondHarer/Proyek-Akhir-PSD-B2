LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RotorAndReflector IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputRotorRight : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputRotorMid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputRotorLeft : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputReflector : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputRevRotorLeft : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        outputRevRotorMid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF RotorAndReflector IS
    SIGNAL rotorBufferRight : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rotorBufferMid : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rotorBufferLeft : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL reflectorBuffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferRight : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferMid : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferLeft : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    -- Rightmost rotor component
    rotor_right : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '1')
        PORT MAP(rotor_type => "00", direction => '0', letterIn => input, letterOut => rotorBufferRight);
    outputRotorRight <= rotorBufferRight;

    -- Middle rotor component
    rotor_middle : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '0')
        PORT MAP(rotor_type => "01", direction => '0', letterIn => rotorBufferRight, letterOut => rotorBufferMid);
    outputRotorMid <= rotorBufferMid;

    -- Left rotor component
    rotor_left : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '0')
        PORT MAP(rotor_type => "10", direction => '0', letterIn => rotorBufferMid, letterOut => rotorBufferLeft);
    outputRotorLeft <= rotorBufferLeft;

    -- The reflector component
    reflector_unit : ENTITY work.Reflector
        PORT MAP(letterin => rotorBufferLeft, letterout => reflectorBuffer);
    outputReflector <= reflectorBuffer;

    -- Reverse left rotor component
    rev_rotor_left : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '0')
        PORT MAP(rotor_type => "10", direction => '1', letterIn => reflectorBuffer, letterOut => revRotorBufferLeft);
    outputRevRotorLeft <= revRotorBufferLeft;

    -- Reverse middle rotor component
    rev_rotor_middle : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '0')
        PORT MAP(rotor_type => "01", direction => '1', letterIn => revRotorBufferLeft, letterOut => revRotorBufferMid);
    outputRevRotorMid <= revRotorBufferMid;

    -- Reverse rightmost rotor component
    rev_rotor_right : ENTITY work.Rotor
        GENERIC MAP(initialPos => 1, notchPos => 0, firstRotor => '1')
        PORT MAP(rotor_type => "00", direction => '1', letterIn => revRotorBufferMid, letterOut => revRotorBufferRight);
    output <= revRotorBufferRight;
END ARCHITECTURE;