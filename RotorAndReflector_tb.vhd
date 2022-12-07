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
    SIGNAL OUTP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTP_ROTOR : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    UUT : RotorAndReflector
    PORT MAP(input => INP, output_rotor => OUTP_ROTOR, output => OUTP);

    tb_proc : PROCESS
    BEGIN
        INP <= "01000001";
        WAIT FOR 10 ps;
        INP <= "01000010";
        WAIT FOR 10 ps;
        INP <= "01000011";
        WAIT FOR 10 ps;
        INP <= "01000100";
        WAIT FOR 10 ps;
        WAIT;
    END PROCESS;
END ARCHITECTURE;