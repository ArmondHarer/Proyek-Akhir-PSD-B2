LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RotorAndReflector_tb IS
END ENTITY;

ARCHITECTURE rtl OF RotorAndReflector_tb IS
    COMPONENT RotorAndReflector IS
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
    END COMPONENT;
    SIGNAL INP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_RIGHT : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_MID : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_LEFT : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REFLECTOR : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_LEFT : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_MID : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    UUT : RotorAndReflector
    PORT MAP(
        input => INP,
        outputRotorRight => OUTP_ROTOR_RIGHT,
        outputRotorMid => OUTP_ROTOR_MID,
        outputRotorLeft => OUTP_ROTOR_LEFT,
        outputReflector => OUTP_REFLECTOR,
        outputRevRotorLeft => OUTP_REV_ROTOR_LEFT,
        outputRevRotorMid => OUTP_REV_ROTOR_MID,
        output => OUTP
    );

    tb_proc : PROCESS
    BEGIN
        -- String "MAKAN"
        -- INP <= "01001101";
        -- WAIT FOR 10 ns;
        -- INP <= "01000001";
        -- WAIT FOR 10 ns;
        -- INP <= "01001011";
        -- WAIT FOR 10 ns;
        -- INP <= "01000001";
        -- WAIT FOR 10 ns;
        -- INP <= "01001110";
        -- WAIT FOR 10 ns;
        -- String "CVLDG"
        INP <= "01000100";
        WAIT FOR 10 ns;
        INP <= "01001101";
        WAIT FOR 10 ns;
        INP <= "01000010";
        WAIT FOR 10 ns;
        INP <= "01001010";
        WAIT FOR 10 ns;
        INP <= "01001000";
        WAIT FOR 10 ns;

        -- WAIT FOR 10 ns;
        -- FOR i IN 65 TO 90 LOOP
        --     REPORT "i=" & INTEGER'image(i);
        --     INP <= STD_LOGIC_VECTOR(to_unsigned(i, INP'length));
        --     WAIT FOR 10 ns;
        -- END LOOP;
        WAIT;
    END PROCESS;
END ARCHITECTURE;