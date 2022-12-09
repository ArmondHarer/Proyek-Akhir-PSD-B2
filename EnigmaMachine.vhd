library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE work.EnigmaTypes.ALL;
USE work.EnigmaConstants.ALL;

entity EnigmaMachine is
    port (
        CLK: IN STD_LOGIC;
        letter_in: IN STD_LOGIC_VECTOR(7 downto 0);
        readWrite: IN std_logic;
        plugboard_write: IN STD_LOGIC_VECTOR(7 downto 0);
        letter_out: OUT std_logic_vector(7 DOWNTO 0);
        Segment_out : out std_logic_vector(15 downto 0);
        error: OUT std_logic

    );
end entity EnigmaMachine;

architecture rtl of EnigmaMachine is
    COMPONENT Keyboard IS
    port (
        CLK: IN std_logic;
        Data_in: IN std_logic_vector(7 downto 0);
        
        Data_out: OUT std_logic_vector(7 downto 0);
        error: OUT std_logic
        
    );
    END component;

    COMPONENT Enigma_16segment_decoder IS
    port (
        D : in std_logic_vector(7 downto 0);
        Segment_out : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;

    COMPONENT Plugboard IS
    port (
        clk   : in std_logic;
        readwrite : in std_logic;

        letter_in  : in  std_logic_vector(7 downto 0); 
        letter_write  : in  std_logic_vector(7 downto 0);
		letter_out : out std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    COMPONENT RotorAndReflector IS
        PORT (
            input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            --output_rotor : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    signal bufferKeyboardOutput: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal bufferPlugboardOutput: STD_LOGIC_VECTOR(7 downto 0);
    signal bufferRotorAndReflectorOutput: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
    data_input: Keyboard 
        port map(CLK => CLK, data_in => data_input, Data_out => bufferKeyboardOutput);
    plugboard_input: Plugboard 
        port map(clk => CLK, readWrite => readWrite, letter_in => bufferKeyboardOutput, letter_write => plugboard_write, letter_out => bufferPlugboardOutput);
    rotorAndReflector_input: RotorAndReflector
        port map(bufferPlugboardOutput, bufferRotorAndReflectorOutput);
    Sixteen_Segment_input: Enigma_16segment_decoder
        port map(D => bufferRotorAndReflectorOutput, Segment_out);
    
    letter_out <= bufferRotorAndReflectorOutput;
    
end architecture rtl;