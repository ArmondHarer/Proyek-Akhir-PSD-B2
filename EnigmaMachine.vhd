library IEEE;
use IEEE.std_logic_1164.all;

entity EnigmaMachine is
    port (
        --input
        CLK: IN STD_LOGIC;
        letter_in: IN STD_LOGIC_VECTOR(7 downto 0);
        --output
        letter_out: OUT std_logic_vector(7 DOWNTO 0);
        Segment_out : out std_logic_vector(15 downto 0);
        error: OUT std_logic

    );
end entity EnigmaMachine;

architecture rtl of EnigmaMachine is
    --Keyboard component declaration
    COMPONENT Keyboard IS
    port (
        CLK: IN std_logic;
        Data_in: IN std_logic_vector(7 downto 0);
        
        Data_out: OUT std_logic_vector(7 downto 0);
        error: OUT std_logic
        
    );
    END component;
    --16 Segment decoder component declaration
    COMPONENT Enigma_16segment_decoder IS
    port (
        D : in std_logic_vector(7 downto 0);
        Segment_out : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    --Plugboard component declaration
    COMPONENT Plugboard IS
    port (
        letter_in  : in  std_logic_vector(7 downto 0); 
		letter_out : out std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    --Rotor and Reflector component declaration
    COMPONENT RotorAndReflector IS
        PORT (
            input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
    --state definiton
    type state_type is (INPUT, SCRAMBLE, OUTPUT);

    --signal declaration
	signal presentState, nextState : state_type;
    signal bufferKeyboardOutput: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal bufferFirstPlugboardOutput: STD_LOGIC_VECTOR(7 downto 0);
    signal bufferRotorAndReflectorOutput: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal bufferSecondPlugboardOutput: STD_LOGIC_VECTOR(7 downto 0);
    signal bufferSegmentOut: STD_LOGIC_VECTOR(15 downto 0);

begin
    --synchronous process
    sync_proc: process(clk, nextState)
    begin
        if(rising_edge(clk)) then presentState <= nextState;
        end if;
    end process sync_proc;
    
    --Keyboard port mapping
    data_input: Keyboard 
        port map(CLK => CLK, data_in => letter_in, Data_out => bufferKeyboardOutput, error => error);

    --first plugboard port mapping
    first_plugboard_input: Plugboard 
        port map(letter_in => bufferKeyboardOutput, letter_out => bufferFirstPlugboardOutput);

    --Rotor and Reflector port mapping
    rotorAndReflector_input: RotorAndReflector
        port map(input => bufferFirstPlugboardOutput, output => bufferRotorAndReflectorOutput);

    --second plugboard port mapping
    second_plugboard_input: Plugboard
        port map(letter_in => bufferRotorAndReflectorOutput, letter_out => bufferSecondPlugboardOutput);

    --16 Segment decoder port mapping
    Sixteen_Segment_input: Enigma_16segment_decoder
        port map(D => bufferRotorAndReflectorOutput, Segment_out => bufferSegmentOut);
    
    --combinatorial process
    comb_proc: process(presentState, error)
    begin 
        case presentState is
            when INPUT => 
                --error handling checking
                if error = '1' then nextState <= INPUT;
                elsif error = '0' then nextState <= SCRAMBLE;
                end if;

            when SCRAMBLE =>
                nextState <= OUTPUT;

            when OUTPUT =>
                letter_out <= bufferSecondPlugboardOutput;
                Segment_out <= bufferSegmentOut;
                nextState <= INPUT;

        end case;
    end process comb_proc;
    
    
end architecture rtl;