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
    SIGNAL INP_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_RIGHT_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_MID_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_LEFT_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REFLECTOR_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_LEFT_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_MID_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_enc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    
    SIGNAL INP_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_RIGHT_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_MID_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR_LEFT_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REFLECTOR_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_LEFT_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_REV_ROTOR_MID_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    UUT_ENCRYPT : RotorAndReflector
    PORT MAP(
        input => INP_enc,
        outputRotorRight => OUTP_ROTOR_RIGHT_enc,
        outputRotorMid => OUTP_ROTOR_MID_enc,
        outputRotorLeft => OUTP_ROTOR_LEFT_enc,
        outputReflector => OUTP_REFLECTOR_enc,
        outputRevRotorLeft => OUTP_REV_ROTOR_LEFT_enc,
        outputRevRotorMid => OUTP_REV_ROTOR_MID_enc,
        output => OUTP_enc
    );

    UUT_DECRYPT : RotorAndReflector
    PORT MAP(
        input => INP_dec,
        outputRotorRight => OUTP_ROTOR_RIGHT_dec,
        outputRotorMid => OUTP_ROTOR_MID_dec,
        outputRotorLeft => OUTP_ROTOR_LEFT_dec,
        outputReflector => OUTP_REFLECTOR_dec,
        outputRevRotorLeft => OUTP_REV_ROTOR_LEFT_dec,
        outputRevRotorMid => OUTP_REV_ROTOR_MID_dec,
        output => OUTP_dec
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
        INP_enc <= "01000101";
        WAIT FOR 10 ns;

        INP_dec <= OUTP_enc;
        INP_enc <= "01001110";
        WAIT FOR 10 ns;

        INP_dec <= OUTP_enc;    
        INP_enc <= "01001001";
        WAIT FOR 10 ns;

        INP_dec <= OUTP_enc;
        INP_enc <= "01000111";   
        WAIT FOR 10 ns;
        
        INP_dec <= OUTP_enc;
        INP_enc <= "01001101";        
        WAIT FOR 10 ns;

        INP_dec <= OUTP_enc;
        INP_enc <= "01000001";
        WAIT FOR 10 ns;
        INP_dec <= OUTP_enc;
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