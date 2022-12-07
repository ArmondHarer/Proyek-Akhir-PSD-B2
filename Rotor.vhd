LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;

ENTITY Rotor IS
	GENERIC (
		initialPos : INTEGER := 25;
		notchPos : INTEGER := 0;
		firstRotor : STD_LOGIC := '1'
	);
	PORT (
		rotor_map : IN ROTOR_CONFIG;
		direction : IN STD_LOGIC; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
		--Input and outputs are in ASCII binary
		letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Rotor;
ARCHITECTURE rtl OF Rotor IS
	TYPE STATE_TYPES IS (rotate, waitForInput, scramble);
	SIGNAL currInput : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL currState : STATE_TYPES := rotate;
	SIGNAL offset : INTEGER := to_integer(unsigned(initialPos)) MOD 26;
BEGIN
	PROCESS (letterIn)
	BEGIN
		--IN    ABCDEFGHIJKLMNOPQRSTUVWXY
		--OUT   EKMFLGDQVZNTOWYHXUSPAIBRCJ
		IF direction = '0' THEN
			CASE letterIn IS
				WHEN ALPHABET_LETTERS(0) => letterout <= rotor_map(0);
				WHEN ALPHABET_LETTERS(1) => letterout <= rotor_map(1);
				WHEN ALPHABET_LETTERS(2) => letterout <= rotor_map(2);
				WHEN ALPHABET_LETTERS(3) => letterout <= rotor_map(3);
				WHEN ALPHABET_LETTERS(4) => letterout <= rotor_map(4);
				WHEN ALPHABET_LETTERS(5) => letterout <= rotor_map(5);
				WHEN ALPHABET_LETTERS(6) => letterout <= rotor_map(6);
				WHEN ALPHABET_LETTERS(7) => letterout <= rotor_map(7);
				WHEN ALPHABET_LETTERS(8) => letterout <= rotor_map(8);
				WHEN ALPHABET_LETTERS(9) => letterout <= rotor_map(9);
				WHEN ALPHABET_LETTERS(10) => letterout <= rotor_map(10);
				WHEN ALPHABET_LETTERS(11) => letterout <= rotor_map(11);
				WHEN ALPHABET_LETTERS(12) => letterout <= rotor_map(12);
				WHEN ALPHABET_LETTERS(13) => letterout <= rotor_map(13);
				WHEN ALPHABET_LETTERS(14) => letterout <= rotor_map(14);
				WHEN ALPHABET_LETTERS(15) => letterout <= rotor_map(15);
				WHEN ALPHABET_LETTERS(16) => letterout <= rotor_map(16);
				WHEN ALPHABET_LETTERS(17) => letterout <= rotor_map(17);
				WHEN ALPHABET_LETTERS(18) => letterout <= rotor_map(18);
				WHEN ALPHABET_LETTERS(19) => letterout <= rotor_map(19);
				WHEN ALPHABET_LETTERS(20) => letterout <= rotor_map(20);
				WHEN ALPHABET_LETTERS(21) => letterout <= rotor_map(21);
				WHEN ALPHABET_LETTERS(22) => letterout <= rotor_map(22);
				WHEN ALPHABET_LETTERS(23) => letterout <= rotor_map(23);
				WHEN ALPHABET_LETTERS(24) => letterout <= rotor_map(24);
				WHEN ALPHABET_LETTERS(25) => letterout <= rotor_map(25);
				WHEN OTHERS => REPORT "Out of bounds" SEVERITY failure;
			END CASE;

		ELSIF direction = '1' THEN
			CASE letterIn IS
				WHEN rotor_map(0) => letterout <= ALPHABET_LETTERS(0);
				WHEN rotor_map(1) => letterout <= ALPHABET_LETTERS(1);
				WHEN rotor_map(2) => letterout <= ALPHABET_LETTERS(2);
				WHEN rotor_map(3) => letterout <= ALPHABET_LETTERS(3);
				WHEN rotor_map(4) => letterout <= ALPHABET_LETTERS(4);
				WHEN rotor_map(5) => letterout <= ALPHABET_LETTERS(5);
				WHEN rotor_map(6) => letterout <= ALPHABET_LETTERS(6);
				WHEN rotor_map(7) => letterout <= ALPHABET_LETTERS(7);
				WHEN rotor_map(8) => letterout <= ALPHABET_LETTERS(8);
				WHEN rotor_map(9) => letterout <= ALPHABET_LETTERS(9);
				WHEN rotor_map(10) => letterout <= ALPHABET_LETTERS(10);
				WHEN rotor_map(11) => letterout <= ALPHABET_LETTERS(11);
				WHEN rotor_map(12) => letterout <= ALPHABET_LETTERS(12);
				WHEN rotor_map(13) => letterout <= ALPHABET_LETTERS(13);
				WHEN rotor_map(14) => letterout <= ALPHABET_LETTERS(14);
				WHEN rotor_map(15) => letterout <= ALPHABET_LETTERS(15);
				WHEN rotor_map(16) => letterout <= ALPHABET_LETTERS(16);
				WHEN rotor_map(17) => letterout <= ALPHABET_LETTERS(17);
				WHEN rotor_map(18) => letterout <= ALPHABET_LETTERS(18);
				WHEN rotor_map(19) => letterout <= ALPHABET_LETTERS(19);
				WHEN rotor_map(20) => letterout <= ALPHABET_LETTERS(20);
				WHEN rotor_map(21) => letterout <= ALPHABET_LETTERS(21);
				WHEN rotor_map(22) => letterout <= ALPHABET_LETTERS(22);
				WHEN rotor_map(23) => letterout <= ALPHABET_LETTERS(23);
				WHEN rotor_map(24) => letterout <= ALPHABET_LETTERS(24);
				WHEN rotor_map(25) => letterout <= ALPHABET_LETTERS(25);
				WHEN OTHERS => REPORT "Out of bounds" SEVERITY failure;
			END CASE;
		END IF;

	END PROCESS;
END ARCHITECTURE rtl;