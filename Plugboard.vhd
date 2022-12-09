library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.EnigmaConstants.all;

entity Plugboard is
    port (
        clk   : in std_logic;
        readwrite : in std_logic;
        letter_in  : in  std_logic_vector(7 downto 0); 
	    
	letter_out : out std_logic_vector(7 downto 0)
    );
end entity Plugboard;

architecture Behavioral of Plugboard is
        signal indexnum : integer;
begin

    plugboard : process(clk, readwrite, letter_in)
	begin
		indexnum <= to_integer(std_logic_vector(letter_in)) mod 65;
		letter_out <= PLUGBOARD(indexnum);
	end process;
    

end architecture;
