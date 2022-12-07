LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Rotor IS
	GENERIC (
		initialPos : INTEGER := 25;
		notchPos : INTEGER := 0;
		firstRotor : STD_LOGIC := '1'
	);
	PORT (
		clk : IN STD_LOGIC;
		direction : IN STD_LOGIC; --0 untuk kanan ke kiri, 1 untuk kiri ke kanan
		--Input and outputs are in ASCII binary
		letterIn : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		letterOut : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Rotor;
ARCHITECTURE rtl OF Rotor IS
	TYPE STATE_TYPES IS (rotate, waitForInput, scramble);
	SIGNAL currInput : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL currState : STATE_TYPES := rotate;
	SIGNAL offset : INTEGER := to_integer(unsigned(initialPos)) MOD 26;
BEGIN
	-- if rotor1 -> always rotate : letterIn <= STD_LOGIC_VECTOR(to_integer(letterIn) + 1 % 65);
	-- if not rotor1 -> rotate if rotor in pos n-1 is in notch
	-- 
	-- 
	PROCESS (letterIn)
	BEGIN
		IF currState = waitForInput THEN
			-- currInput converted to integer mod 26, so A-Z is 0-25
			currInput <= to_integer(unsigned(letterIn)) MOD 26;
			currState <= scramble;
		END IF;
	END PROCESS;

	PROCESS (currState)
	BEGIN
		CASE currState IS
			WHEN scramble =>
				-- Scramble the input based on the current offset and 

				-- Move to next state after scrambling
				currState <= rotate;
			WHEN rotate =>
				-- If it is the first rotor always rotate after input
				IF firstRotor = '1' THEN
					offset <= offset + 1;
				END IF;
				-- Move to next state after rotating
				currState <= waitForInput;
		END CASE;
		letterOut <= STD_LOGIC_VECTOR(to_unsigned(currInput, letterOut'LENGTH));
	END PROCESS;

END ARCHITECTURE rtl;