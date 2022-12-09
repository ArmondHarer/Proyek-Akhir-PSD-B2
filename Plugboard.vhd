library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.EnigmaConstants.all;
USE work.EnigmaTypes.ALL;

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
        signal indexnum : integer;
        constant plugboardConst :PLUGBOARD_CONFIG := PLUGBOARDMAP;
begin

    digantibiargeror : process(clk)
	begin
        indexnum <= 1;
		indexnum <= to_integer(unsigned(letter_in)) mod 65;
		letter_out <= plugboardConst(indexnum);
	end process;
    

end architecture;
