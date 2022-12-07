library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.alphabet.all;

entity InitializePB is
    port (
        enable       : in std_logic;
        clk 		 : in  std_logic;
		save 		 : in  std_logic;
		letter_in    : in  std_logic_vector(7 downto 0);

		memory_out   : out alphabet;
		done         : out std_logic
    );
end entity InitializePB;

architecture rtl of InitializePB is
    signal s_letter_count : unsigned(7 downto 0) := "01000001";
	signal counter : integer := 0;
    signal s_memory : alphabet;
begin
    setup_pb : process(enable, clk, save)
	begin
		if (rising_edge(clk)) then
			done <= '0';	
			
			if (enable = '1') then
				if (s_letter_count >= 56) then
					-- reached end of count
					done <= '1';
				elsif (save = '1') then	
					-- writeto plugboard
					s_memory(to_integer(unsigned(s_letter_count))) <= letter_in;
					s_letter_count <= s_letter_count + 1;
				end if;
			end if;	
		end if;
        memory_out <= s_memory;
	end process;
end architecture;