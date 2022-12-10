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
    COMPONENT rotor IS
        GENERIC (
            notchPos : INTEGER := 0;
            firstRotor : STD_LOGIC := '1';
            rotor_type : STD_LOGIC_VECTOR(1 DOWNTO 0);
            direction : STD_LOGIC --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
        );
        PORT (
            --Input and outputs are in ASCII binary
            letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            -- Curr position
            initialPos : IN INTEGER;
            lastPos : OUT INTEGER
        );
    END COMPONENT;
    SIGNAL rotorBufferRight : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rotorBufferMid : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rotorBufferLeft : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL reflectorBuffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferRight : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferMid : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL revRotorBufferLeft : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rightMotorPos : INTEGER;
    SIGNAL midMotorPos : INTEGER;
    SIGNAL leftMotorPos : INTEGER;
    SIGNAL revRightMotorPos : INTEGER := 0;
    SIGNAL revMidMotorPos : INTEGER := 0;
    SIGNAL revLeftMotorPos : INTEGER := 0;
BEGIN
    -- Rightmost rotor component
    rotor_right : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '1', rotor_type => "00", direction => '0')
    PORT MAP(letterIn => input, letterOut => rotorBufferRight, initialPos => revRightMotorPos, lastPos => rightMotorPos);
    outputRotorRight <= rotorBufferRight;

    -- Middle rotor component
    rotor_middle : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '0', rotor_type => "01", direction => '0')
    PORT MAP(letterIn => rotorBufferRight, letterOut => rotorBufferMid, initialPos => revMidMotorPos, lastPos => midMotorPos);
    outputRotorMid <= rotorBufferMid;

    -- Left rotor component
    rotor_left : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '0', rotor_type => "10", direction => '0')
    PORT MAP(letterIn => rotorBufferMid, letterOut => rotorBufferLeft, initialPos => revLeftMotorPos, lastPos => leftMotorPos);
    outputRotorLeft <= rotorBufferLeft;

    -- The reflector component
    reflector_unit : ENTITY work.Reflector
        PORT MAP(letterIn => rotorBufferLeft, letterOut => reflectorBuffer);
    outputReflector <= reflectorBuffer;

    -- Reverse left rotor component
    rev_rotor_left : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '0', rotor_type => "10", direction => '1')
    PORT MAP(letterIn => reflectorBuffer, letterOut => revRotorBufferLeft, initialPos => leftMotorPos, lastPos => revLeftMotorPos);
    outputRevRotorLeft <= revRotorBufferLeft;

    -- Reverse middle rotor component
    rev_rotor_middle : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '0', rotor_type => "01", direction => '1')
    PORT MAP(letterIn => revRotorBufferLeft, letterOut => revRotorBufferMid, initialPos => midMotorPos, lastPos => revMidMotorPos);
    outputRevRotorMid <= revRotorBufferMid;

    -- Reverse rightmost rotor component
    rev_rotor_right : Rotor
    GENERIC MAP(notchPos => 0, firstRotor => '1', rotor_type => "00", direction => '1')
    PORT MAP(letterIn => revRotorBufferMid, letterOut => revRotorBufferRight, initialPos => rightMotorPos, lastPos => revRightMotorPos);
    output <= revRotorBufferRight;
END ARCHITECTURE;