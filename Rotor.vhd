LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- USE work.EnigmaConstants.ALL;
USE work.EnigmaTypes.ALL;

ENTITY Rotor IS
	GENERIC (
		initialPos : INTEGER := 25;
		notchPos : INTEGER := 0;
		firstRotor : STD_LOGIC := '1'
	);
	PORT (
		rotor_type : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		direction : IN STD_LOGIC; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
		--Input and outputs are in ASCII binary
		letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Rotor;

ARCHITECTURE rtl OF Rotor IS
	TYPE ARR_26 IS ARRAY (25 DOWNTO 0) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	CONSTANT ROTOR_A : ROTOR_CONFIG := (
		-- "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
		"01000101", "01001011", "01001101", "01000110", "01001100", "01000111", "01000100",
		"01010001", "01010110", "01011010", "01001110", "01010100", "01001111", "01010111",
		"01011001", "01001000", "01011000", "01010101", "01010011", "01010000", "01000001",
		"01001001", "01000010", "01010010", "01000011", "01001010"
	);
	CONSTANT ROTOR_B : ROTOR_CONFIG := (
		-- "AJDKSIRUXBLHWTMCQGZNPYFVOE"
		"01000001", "01001010", "01000100", "01001011", "01010011", "01001001", "01010010",
		"01010101", "01011000", "01000010", "01001100", "01001000", "01010111", "01010100",
		"01001101", "01000011", "01010001", "01000111", "01011010", "01001110", "01010000",
		"01011001", "01000110", "01010110", "01001111", "01000101"
	);
	CONSTANT ROTOR_C : ROTOR_CONFIG := (
		"01000010", "01000100", "01000110", "01001000", "01001010", "01001100", "01000011",
		"01010000", "01010010", "01010100", "01011000", "01010110", "01011010", "01001110",
		"01011001", "01000101", "01001001", "01010111", "01000111", "01000001", "01001011",
		"01001101", "01010101", "01010011", "01010001", "01001111"
	);
	CONSTANT ALPHABETS : ALPHABET_IN_BITS := (
		"01000001", "01000010", "01000011", "01000100", "01000101", "01000110", "01000111",
		"01001000", "01001001", "01001010", "01001011", "01001100", "01001101", "01001110",
		"01001111", "01010000", "01010001", "01010010", "01010011", "01010100", "01010101",
		"01010110", "01010111", "01011000", "01011001", "01011010" -- A to Z
	);
BEGIN
	PROCESS (letterIn)
	BEGIN
		-- Initialize output
		letterOut <= (OTHERS => '0');
		-- If direction in forward
		IF direction = '0' THEN
			IF rotor_type = "00" THEN
				CASE letterIn IS
					WHEN ALPHABETS(0) => letterOut <= ROTOR_A(0);
					WHEN ALPHABETS(1) => letterOut <= ROTOR_A(1);
					WHEN ALPHABETS(2) => letterOut <= ROTOR_A(2);
					WHEN ALPHABETS(3) => letterOut <= ROTOR_A(3);
					WHEN ALPHABETS(4) => letterOut <= ROTOR_A(4);
					WHEN ALPHABETS(5) => letterOut <= ROTOR_A(5);
					WHEN ALPHABETS(6) => letterOut <= ROTOR_A(6);
					WHEN ALPHABETS(7) => letterOut <= ROTOR_A(7);
					WHEN ALPHABETS(8) => letterOut <= ROTOR_A(8);
					WHEN ALPHABETS(9) => letterOut <= ROTOR_A(9);
					WHEN ALPHABETS(10) => letterOut <= ROTOR_A(10);
					WHEN ALPHABETS(11) => letterOut <= ROTOR_A(11);
					WHEN ALPHABETS(12) => letterOut <= ROTOR_A(12);
					WHEN ALPHABETS(13) => letterOut <= ROTOR_A(13);
					WHEN ALPHABETS(14) => letterOut <= ROTOR_A(14);
					WHEN ALPHABETS(15) => letterOut <= ROTOR_A(15);
					WHEN ALPHABETS(16) => letterOut <= ROTOR_A(16);
					WHEN ALPHABETS(17) => letterOut <= ROTOR_A(17);
					WHEN ALPHABETS(18) => letterOut <= ROTOR_A(18);
					WHEN ALPHABETS(19) => letterOut <= ROTOR_A(19);
					WHEN ALPHABETS(20) => letterOut <= ROTOR_A(20);
					WHEN ALPHABETS(21) => letterOut <= ROTOR_A(21);
					WHEN ALPHABETS(22) => letterOut <= ROTOR_A(22);
					WHEN ALPHABETS(23) => letterOut <= ROTOR_A(23);
					WHEN ALPHABETS(24) => letterOut <= ROTOR_A(24);
					WHEN ALPHABETS(25) => letterOut <= ROTOR_A(25);
					WHEN OTHERS => letterOut <= ROTOR_A(0);
				END CASE;
			ELSIF rotor_type = "01" THEN
				CASE letterIn IS
					WHEN ALPHABETS(0) => letterOut <= ROTOR_B(0);
					WHEN ALPHABETS(1) => letterOut <= ROTOR_B(1);
					WHEN ALPHABETS(2) => letterOut <= ROTOR_B(2);
					WHEN ALPHABETS(3) => letterOut <= ROTOR_B(3);
					WHEN ALPHABETS(4) => letterOut <= ROTOR_B(4);
					WHEN ALPHABETS(5) => letterOut <= ROTOR_B(5);
					WHEN ALPHABETS(6) => letterOut <= ROTOR_B(6);
					WHEN ALPHABETS(7) => letterOut <= ROTOR_B(7);
					WHEN ALPHABETS(8) => letterOut <= ROTOR_B(8);
					WHEN ALPHABETS(9) => letterOut <= ROTOR_B(9);
					WHEN ALPHABETS(10) => letterOut <= ROTOR_B(10);
					WHEN ALPHABETS(11) => letterOut <= ROTOR_B(11);
					WHEN ALPHABETS(12) => letterOut <= ROTOR_B(12);
					WHEN ALPHABETS(13) => letterOut <= ROTOR_B(13);
					WHEN ALPHABETS(14) => letterOut <= ROTOR_B(14);
					WHEN ALPHABETS(15) => letterOut <= ROTOR_B(15);
					WHEN ALPHABETS(16) => letterOut <= ROTOR_B(16);
					WHEN ALPHABETS(17) => letterOut <= ROTOR_B(17);
					WHEN ALPHABETS(18) => letterOut <= ROTOR_B(18);
					WHEN ALPHABETS(19) => letterOut <= ROTOR_B(19);
					WHEN ALPHABETS(20) => letterOut <= ROTOR_B(20);
					WHEN ALPHABETS(21) => letterOut <= ROTOR_B(21);
					WHEN ALPHABETS(22) => letterOut <= ROTOR_B(22);
					WHEN ALPHABETS(23) => letterOut <= ROTOR_B(23);
					WHEN ALPHABETS(24) => letterOut <= ROTOR_B(24);
					WHEN ALPHABETS(25) => letterOut <= ROTOR_B(25);
					WHEN OTHERS => letterOut <= ROTOR_B(0);
				END CASE;
			ELSIF rotor_type = "10" THEN
				CASE letterIn IS
					WHEN ALPHABETS(0) => letterOut <= ROTOR_C(0);
					WHEN ALPHABETS(1) => letterOut <= ROTOR_C(1);
					WHEN ALPHABETS(2) => letterOut <= ROTOR_C(2);
					WHEN ALPHABETS(3) => letterOut <= ROTOR_C(3);
					WHEN ALPHABETS(4) => letterOut <= ROTOR_C(4);
					WHEN ALPHABETS(5) => letterOut <= ROTOR_C(5);
					WHEN ALPHABETS(6) => letterOut <= ROTOR_C(6);
					WHEN ALPHABETS(7) => letterOut <= ROTOR_C(7);
					WHEN ALPHABETS(8) => letterOut <= ROTOR_C(8);
					WHEN ALPHABETS(9) => letterOut <= ROTOR_C(9);
					WHEN ALPHABETS(10) => letterOut <= ROTOR_C(10);
					WHEN ALPHABETS(11) => letterOut <= ROTOR_C(11);
					WHEN ALPHABETS(12) => letterOut <= ROTOR_C(12);
					WHEN ALPHABETS(13) => letterOut <= ROTOR_C(13);
					WHEN ALPHABETS(14) => letterOut <= ROTOR_C(14);
					WHEN ALPHABETS(15) => letterOut <= ROTOR_C(15);
					WHEN ALPHABETS(16) => letterOut <= ROTOR_C(16);
					WHEN ALPHABETS(17) => letterOut <= ROTOR_C(17);
					WHEN ALPHABETS(18) => letterOut <= ROTOR_C(18);
					WHEN ALPHABETS(19) => letterOut <= ROTOR_C(19);
					WHEN ALPHABETS(20) => letterOut <= ROTOR_C(20);
					WHEN ALPHABETS(21) => letterOut <= ROTOR_C(21);
					WHEN ALPHABETS(22) => letterOut <= ROTOR_C(22);
					WHEN ALPHABETS(23) => letterOut <= ROTOR_C(23);
					WHEN ALPHABETS(24) => letterOut <= ROTOR_C(24);
					WHEN ALPHABETS(25) => letterOut <= ROTOR_C(25);
					WHEN OTHERS => letterOut <= ROTOR_C(0);
				END CASE;
			END IF;
			-- If direction is backwards
		ELSE
			IF rotor_type = "00" THEN
				CASE letterIn IS
					WHEN ROTOR_A(0) => letterOut <= ALPHABETS(0);
					WHEN ROTOR_A(1) => letterOut <= ALPHABETS(1);
					WHEN ROTOR_A(2) => letterOut <= ALPHABETS(2);
					WHEN ROTOR_A(3) => letterOut <= ALPHABETS(3);
					WHEN ROTOR_A(4) => letterOut <= ALPHABETS(4);
					WHEN ROTOR_A(5) => letterOut <= ALPHABETS(5);
					WHEN ROTOR_A(6) => letterOut <= ALPHABETS(6);
					WHEN ROTOR_A(7) => letterOut <= ALPHABETS(7);
					WHEN ROTOR_A(8) => letterOut <= ALPHABETS(8);
					WHEN ROTOR_A(9) => letterOut <= ALPHABETS(9);
					WHEN ROTOR_A(10) => letterOut <= ALPHABETS(10);
					WHEN ROTOR_A(11) => letterOut <= ALPHABETS(11);
					WHEN ROTOR_A(12) => letterOut <= ALPHABETS(12);
					WHEN ROTOR_A(13) => letterOut <= ALPHABETS(13);
					WHEN ROTOR_A(14) => letterOut <= ALPHABETS(14);
					WHEN ROTOR_A(15) => letterOut <= ALPHABETS(15);
					WHEN ROTOR_A(16) => letterOut <= ALPHABETS(16);
					WHEN ROTOR_A(17) => letterOut <= ALPHABETS(17);
					WHEN ROTOR_A(18) => letterOut <= ALPHABETS(18);
					WHEN ROTOR_A(19) => letterOut <= ALPHABETS(19);
					WHEN ROTOR_A(20) => letterOut <= ALPHABETS(20);
					WHEN ROTOR_A(21) => letterOut <= ALPHABETS(21);
					WHEN ROTOR_A(22) => letterOut <= ALPHABETS(22);
					WHEN ROTOR_A(23) => letterOut <= ALPHABETS(23);
					WHEN ROTOR_A(24) => letterOut <= ALPHABETS(24);
					WHEN ROTOR_A(25) => letterOut <= ALPHABETS(25);
					WHEN OTHERS => letterOut <= ALPHABETS(0);
				END CASE;
			ELSIF rotor_type = "01" THEN
				CASE letterIn IS
					WHEN ROTOR_B(0) => letterOut <= ALPHABETS(0);
					WHEN ROTOR_B(1) => letterOut <= ALPHABETS(1);
					WHEN ROTOR_B(2) => letterOut <= ALPHABETS(2);
					WHEN ROTOR_B(3) => letterOut <= ALPHABETS(3);
					WHEN ROTOR_B(4) => letterOut <= ALPHABETS(4);
					WHEN ROTOR_B(5) => letterOut <= ALPHABETS(5);
					WHEN ROTOR_B(6) => letterOut <= ALPHABETS(6);
					WHEN ROTOR_B(7) => letterOut <= ALPHABETS(7);
					WHEN ROTOR_B(8) => letterOut <= ALPHABETS(8);
					WHEN ROTOR_B(9) => letterOut <= ALPHABETS(9);
					WHEN ROTOR_B(10) => letterOut <= ALPHABETS(10);
					WHEN ROTOR_B(11) => letterOut <= ALPHABETS(11);
					WHEN ROTOR_B(12) => letterOut <= ALPHABETS(12);
					WHEN ROTOR_B(13) => letterOut <= ALPHABETS(13);
					WHEN ROTOR_B(14) => letterOut <= ALPHABETS(14);
					WHEN ROTOR_B(15) => letterOut <= ALPHABETS(15);
					WHEN ROTOR_B(16) => letterOut <= ALPHABETS(16);
					WHEN ROTOR_B(17) => letterOut <= ALPHABETS(17);
					WHEN ROTOR_B(18) => letterOut <= ALPHABETS(18);
					WHEN ROTOR_B(19) => letterOut <= ALPHABETS(19);
					WHEN ROTOR_B(20) => letterOut <= ALPHABETS(20);
					WHEN ROTOR_B(21) => letterOut <= ALPHABETS(21);
					WHEN ROTOR_B(22) => letterOut <= ALPHABETS(22);
					WHEN ROTOR_B(23) => letterOut <= ALPHABETS(23);
					WHEN ROTOR_B(24) => letterOut <= ALPHABETS(24);
					WHEN ROTOR_B(25) => letterOut <= ALPHABETS(25);
					WHEN OTHERS => letterOut <= ALPHABETS(0);
				END CASE;
			ELSIF rotor_type = "10" THEN
				CASE letterIn IS
					WHEN ROTOR_C(0) => letterOut <= ALPHABETS(0);
					WHEN ROTOR_C(1) => letterOut <= ALPHABETS(1);
					WHEN ROTOR_C(2) => letterOut <= ALPHABETS(2);
					WHEN ROTOR_C(3) => letterOut <= ALPHABETS(3);
					WHEN ROTOR_C(4) => letterOut <= ALPHABETS(4);
					WHEN ROTOR_C(5) => letterOut <= ALPHABETS(5);
					WHEN ROTOR_C(6) => letterOut <= ALPHABETS(6);
					WHEN ROTOR_C(7) => letterOut <= ALPHABETS(7);
					WHEN ROTOR_C(8) => letterOut <= ALPHABETS(8);
					WHEN ROTOR_C(9) => letterOut <= ALPHABETS(9);
					WHEN ROTOR_C(10) => letterOut <= ALPHABETS(10);
					WHEN ROTOR_C(11) => letterOut <= ALPHABETS(11);
					WHEN ROTOR_C(12) => letterOut <= ALPHABETS(12);
					WHEN ROTOR_C(13) => letterOut <= ALPHABETS(13);
					WHEN ROTOR_C(14) => letterOut <= ALPHABETS(14);
					WHEN ROTOR_C(15) => letterOut <= ALPHABETS(15);
					WHEN ROTOR_C(16) => letterOut <= ALPHABETS(16);
					WHEN ROTOR_C(17) => letterOut <= ALPHABETS(17);
					WHEN ROTOR_C(18) => letterOut <= ALPHABETS(18);
					WHEN ROTOR_C(19) => letterOut <= ALPHABETS(19);
					WHEN ROTOR_C(20) => letterOut <= ALPHABETS(20);
					WHEN ROTOR_C(21) => letterOut <= ALPHABETS(21);
					WHEN ROTOR_C(22) => letterOut <= ALPHABETS(22);
					WHEN ROTOR_C(23) => letterOut <= ALPHABETS(23);
					WHEN ROTOR_C(24) => letterOut <= ALPHABETS(24);
					WHEN ROTOR_C(25) => letterOut <= ALPHABETS(25);
					WHEN OTHERS => letterOut <= ALPHABETS(0);
				END CASE;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE rtl;