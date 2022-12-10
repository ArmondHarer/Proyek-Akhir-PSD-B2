LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;


entity Plugboard_tb is

end entity;

architecture tb of Plugboard_tb is


    component Plugboard is
        port (
            clk   : in std_logic;
        --readwrite : in std_logic;
        letter_in  : in  std_logic_vector(7 downto 0) := "01000001";
	    letter_out : out std_logic_vector(7 downto 0)
    
        );
    end COMPONENT;
    signal CLK: STD_LOGIC := '0';
    signal letter_in: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    --signal readWrite: std_logic := '0';
    --signal plugboard_write: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal letter_out: std_logic_vector(7 DOWNTO 0) := (others => '0');
   -- signal Segment_out : std_logic_vector(15 downto 0) := (others => '0');
    signal error: std_logic := '0';

    begin
        UUT : Plugboard port map (
            CLK => CLK,
            letter_in => letter_in,
            --readWrite => readWrite,
            --plugboard_write => plugboard_write,
            letter_out => letter_out
            --Segment_out => Segment_out,
            --error => error
        );

        tb_process : process 
        begin
            letter_in <= "01001011";
            WAIT FOR 50 ps;
            FOR i IN 65 TO 90 LOOP
                REPORT "i=" & INTEGER'image(i);
                letter_in <= STD_LOGIC_VECTOR(to_unsigned(i, letter_in'length));
                wait for 100 ps;
                letter_in <= letter_out;
                WAIT FOR 100 ps;
            END LOOP;
            assert false report "Simulation finished" severity failure;
        END PROCESS;
    

end tb ; -- arch