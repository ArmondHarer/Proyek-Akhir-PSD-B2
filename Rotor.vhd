LIBRARY ieee;
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
		rotor_type : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		direction : IN STD_LOGIC; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
		--Input and outputs are in ASCII binary
		letterIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		letterOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Rotor;

ARCHITECTURE rtl OF Rotor IS
	CONSTANT ROTOR_A : ROTOR_CONFIG := ROTOR_A_MAP;
	CONSTANT ROTOR_B : ROTOR_CONFIG := ROTOR_B_MAP;
	CONSTANT ROTOR_C : ROTOR_CONFIG := ROTOR_C_MAP;
	CONSTANT ALPHABETS : ALPHABET_IN_BITS := ALPHABET_LETTERS;
	SIGNAL ROTOR_MAP : ROTOR_CONFIG;

BEGIN
	PROCESS (letterIn, ROTOR_MAP)
		VARIABLE offset : INTEGER RANGE 0 TO 25 := 0;
	BEGIN
		-- Initialize output
		letterOut <= (OTHERS => '0');
		IF rotor_type = "00" THEN
			ROTOR_MAP <= ROTOR_A;
		ELSIF rotor_type = "01" THEN
			ROTOR_MAP <= ROTOR_B;
		ELSIF rotor_type = "10" THEN
			ROTOR_MAP <= ROTOR_C;
		ELSE
			ROTOR_MAP <= ROTOR_A;
		END IF;

		-- If direction is '0' or forward
		IF direction = '0' THEN
			FOR idx IN 0 TO 25 LOOP
				IF letterIn = ALPHABETS(idx) THEN
					letterOut <= ROTOR_MAP((idx + offset) MOD 26);
				END IF;
			END LOOP;

			-- If direction is '1' or backwards
		ELSE
			FOR idx IN 0 TO 25 LOOP
				IF letterIn = ROTOR_MAP(idx) THEN
					letterOut <= ALPHABETS((idx + offset) MOD 26);
				END IF;
			END LOOP;
		END IF;

	END PROCESS;
END ARCHITECTURE rtl;