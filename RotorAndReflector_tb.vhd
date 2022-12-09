LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RotorAndReflector_tb IS
END ENTITY;

ARCHITECTURE rtl OF RotorAndReflector_tb IS
    COMPONENT RotorAndReflector IS
        PORT (
            input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            output_rotor : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL INP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    UUT : RotorAndReflector
    PORT MAP(input => INP, output_rotor => OUTP_ROTOR, output => OUTP);

    tb_proc : PROCESS
        VARIABLE TEMP_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
        -- VARIABLE INP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
        -- VARIABLE OUTP_ROTOR : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
        -- VARIABLE OUTP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        INP <= "01001011";
        WAIT FOR 10 ps;
        FOR i IN 65 TO 90 LOOP
            REPORT "i=" & INTEGER'image(i);
            INP <= STD_LOGIC_VECTOR(to_unsigned(i, INP'length));
            TEMP_OUT := OUTP_ROTOR;
            WAIT FOR 10 ps;
        END LOOP;
        WAIT;
    END PROCESS;
END ARCHITECTURE;