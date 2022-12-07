library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Plugboard is
    port (
        clk   : in std_logic;
        readwrite : in std_logic;

        letter_in  : in  std_logic_vector(7 downto 0); 
        letter_write  : in  std_logic_vector(7 downto 0);
		letter_out : out std_logic_vector(7 downto 0)
    );
end entity Plugboard;

architecture Behavioral of Plugboard is
        type Alphabet is array (0 to 25) of std_logic_vector (7 downto 0);
        signal Letter : Alphabet := (
                                    "01000001", "01000010", "01000011", "01000100", "01000101", "01000110", "01000111",
                                    "01001000", "01001001", "01001010", "01001011", "01001100", "01001101", "01001110",
                                    "01001111", "01010000", "01010001", "01010010", "01010011", "01010100", "01010101",
                                    "01010110", "01010111", "01011000", "01011001", "01011010" -- A to Z
                                    );
begin

    plugboard : process(clk, readwrite, Letter, letter_in)
	begin
		
		if (rising_edge(clk)) then
			if (readWrite = '1') then
				Letter(to_integer(unsigned(letter_in))) <= letter_write;
			end if;
		end if;
		
		letter_out <= Letter(to_integer(unsigned(letter_in)));
	end process;
    

end architecture;