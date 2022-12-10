LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;


entity EnigmaMachine_tb is

end entity;

architecture tb of EnigmaMachine_tb is


    component EnigmaMachine is
        port (
            CLK: IN STD_LOGIC;
            letter_in: IN STD_LOGIC_VECTOR(7 downto 0);
            --readWrite: IN std_logic;
            --plugboard_write: IN STD_LOGIC_VECTOR(7 downto 0);
            letter_out: OUT std_logic_vector(7 DOWNTO 0);
            Segment_out : out std_logic_vector(15 downto 0);
            error: OUT std_logic
    
        );
    end COMPONENT;
    signal CLK: STD_LOGIC := '0';
    signal letter_in_encrypt: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal letter_in_decrypt: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal letter_out_encrypt: std_logic_vector(7 DOWNTO 0) := (others => '0');
    signal letter_out_decrypt: std_logic_vector(7 DOWNTO 0) := (others => '0');
    signal Segment_out_encrypt : std_logic_vector(15 downto 0) := (others => '0');
    signal Segment_out_decrypt : std_logic_vector(15 downto 0) := (others => '0');
    signal error: std_logic := '0';

    begin
        UUT_ENCRYPT : EnigmaMachine port map (
            CLK => CLK,
            letter_in => letter_in_encrypt,
            --readWrite => readWrite,
            --plugboard_write => plugboard_write,
            letter_out => letter_out_encrypt,
            Segment_out => Segment_out_encrypt,
            error => error
        );

        UUT_DECRYPT : EnigmaMachine port map (
            CLK => CLK,
            letter_in => letter_in_decrypt,
            --readWrite => readWrite,
            --plugboard_write => plugboard_write,
            letter_out => letter_out_decrypt,
            Segment_out => Segment_out_decrypt,
            error => error
        );

        tb_process : process 
        begin
            letter_in_encrypt <= "01001110";
            WAIT FOR 10 ns;

            letter_in_decrypt <= letter_out_encrypt;
            letter_in_encrypt <= "01000001";
            WAIT FOR 10 ns;
            
            letter_in_decrypt <= letter_out_encrypt;
            letter_in_encrypt <= "01010101";
            WAIT FOR 10 ns;

            letter_in_decrypt <= letter_out_encrypt;
            letter_in_encrypt <= "01000110";
            WAIT FOR 10 ns;

            letter_in_decrypt <= letter_out_encrypt;
            letter_in_encrypt <= "01000001";
            WAIT FOR 10 ns;

            letter_in_decrypt <= letter_out_encrypt;
            letter_in_encrypt <= "01001100";
            WAIT FOR 10 ns;

            letter_in_decrypt <= letter_out_encrypt;
            wait for 10 ns;

            assert false report "Simulation finished" severity failure;
        END PROCESS;
    

end tb ; -- arch