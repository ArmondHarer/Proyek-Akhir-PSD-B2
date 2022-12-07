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
	SIGNAL currInput : INTEGER;
	SIGNAL currOutput : INTEGER;
	SIGNAL currState : STATE_TYPES := rotate;
	SIGNAL offset : INTEGER := initialPos MOD 26;
	CONSTANT ROTOR_MAPPING : ROTOR_CONFIG := rotor_map;
	CONSTANT ALPHABETS : ALPHABET_IN_BITS := (
		"01000001", "01000010", "01000011", "01000100", "01000101", "01000110", "01000111",
		"01001000", "01001001", "01001010", "01001011", "01001100", "01001101", "01001110",
		"01001111", "01010000", "01010001", "01010010", "01010011", "01010100", "01010101",
		"01010110", "01010111", "01011000", "01011001", "01011010" -- A to Z
	);
BEGIN
	PROCESS (letterIn)
	BEGIN
		--IN    ABCDEFGHIJKLMNOPQRSTUVWXY
		--OUT   EKMFLGDQVZNTOWYHXUSPAIBRCJ
		IF direction = '0' THEN
			CASE letterIn IS
				WHEN ALPHABETS(0) => currOutput <= rotor_map(0);
				WHEN ALPHABETS(1) => currOutput <= rotor_map(1);
				WHEN ALPHABETS(2) => currOutput <= rotor_map(2);
				WHEN ALPHABETS(3) => currOutput <= rotor_map(3);
				WHEN ALPHABETS(4) => currOutput <= rotor_map(4);
				WHEN ALPHABETS(5) => currOutput <= rotor_map(5);
				WHEN ALPHABETS(6) => currOutput <= rotor_map(6);
				WHEN ALPHABETS(7) => currOutput <= rotor_map(7);
				WHEN ALPHABETS(8) => currOutput <= rotor_map(8);
				WHEN ALPHABETS(9) => currOutput <= rotor_map(9);
				WHEN ALPHABETS(10) => currOutput <= rotor_map(10);
				WHEN ALPHABETS(11) => currOutput <= rotor_map(11);
				WHEN ALPHABETS(12) => currOutput <= rotor_map(12);
				WHEN ALPHABETS(13) => currOutput <= rotor_map(13);
				WHEN ALPHABETS(14) => currOutput <= rotor_map(14);
				WHEN ALPHABETS(15) => currOutput <= rotor_map(15);
				WHEN ALPHABETS(16) => currOutput <= rotor_map(16);
				WHEN ALPHABETS(17) => currOutput <= rotor_map(17);
				WHEN ALPHABETS(18) => currOutput <= rotor_map(18);
				WHEN ALPHABETS(19) => currOutput <= rotor_map(19);
				WHEN ALPHABETS(20) => currOutput <= rotor_map(20);
				WHEN ALPHABETS(21) => currOutput <= rotor_map(21);
				WHEN ALPHABETS(22) => currOutput <= rotor_map(22);
				WHEN ALPHABETS(23) => currOutput <= rotor_map(23);
				WHEN ALPHABETS(24) => currOutput <= rotor_map(24);
				WHEN ALPHABETS(25) => currOutput <= rotor_map(25);
				WHEN OTHERS => REPORT "Out of bounds" SEVERITY failure;
			END CASE;
			letterOut <= STD_LOGIC_VECTOR(to_unsigned(currOutput, letterOut'length));

		ELSIF direction = '1' THEN
			currInput <= to_integer(signed(letterIn));
			CASE currInput IS
				WHEN ROTOR_MAPPING(0) => letterOut <= ALPHABETS(0);
				WHEN ROTOR_MAPPING(1) => letterOut <= ALPHABETS(1);
				WHEN ROTOR_MAPPING(2) => letterOut <= ALPHABETS(2);
				WHEN ROTOR_MAPPING(3) => letterOut <= ALPHABETS(3);
				WHEN ROTOR_MAPPING(4) => letterOut <= ALPHABETS(4);
				WHEN ROTOR_MAPPING(5) => letterOut <= ALPHABETS(5);
				WHEN ROTOR_MAPPING(6) => letterOut <= ALPHABETS(6);
				WHEN ROTOR_MAPPING(7) => letterOut <= ALPHABETS(7);
				WHEN ROTOR_MAPPING(8) => letterOut <= ALPHABETS(8);
				WHEN ROTOR_MAPPING(9) => letterOut <= ALPHABETS(9);
				WHEN ROTOR_MAPPING(10) => letterOut <= ALPHABETS(10);
				WHEN ROTOR_MAPPING(11) => letterOut <= ALPHABETS(11);
				WHEN ROTOR_MAPPING(12) => letterOut <= ALPHABETS(12);
				WHEN ROTOR_MAPPING(13) => letterOut <= ALPHABETS(13);
				WHEN ROTOR_MAPPING(14) => letterOut <= ALPHABETS(14);
				WHEN ROTOR_MAPPING(15) => letterOut <= ALPHABETS(15);
				WHEN ROTOR_MAPPING(16) => letterOut <= ALPHABETS(16);
				WHEN ROTOR_MAPPING(17) => letterOut <= ALPHABETS(17);
				WHEN ROTOR_MAPPING(18) => letterOut <= ALPHABETS(18);
				WHEN ROTOR_MAPPING(19) => letterOut <= ALPHABETS(19);
				WHEN ROTOR_MAPPING(20) => letterOut <= ALPHABETS(20);
				WHEN ROTOR_MAPPING(21) => letterOut <= ALPHABETS(21);
				WHEN ROTOR_MAPPING(22) => letterOut <= ALPHABETS(22);
				WHEN ROTOR_MAPPING(23) => letterOut <= ALPHABETS(23);
				WHEN ROTOR_MAPPING(24) => letterOut <= ALPHABETS(24);
				WHEN ROTOR_MAPPING(25) => letterOut <= ALPHABETS(25);
				WHEN OTHERS => REPORT "Out of bounds" SEVERITY failure;
			END CASE;
		END IF;

	END PROCESS;
END ARCHITECTURE rtl;