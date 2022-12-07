LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE work.EnigmaTypes.ALL;

PACKAGE EnigmaConstants IS
    CONSTANT ROTOR_A : ROTOR_CONFIG := (
        69, 75, 77, 70, 76, 71, 68, 81, 86, 90,
        78, 84, 79, 87, 89, 72, 88, 85, 83, 80,
        65, 73, 66, 82, 67, 74
    );

    CONSTANT ROTOR_B : ROTOR_CONFIG := (
        65, 74, 68, 75, 83, 73, 82, 85, 88, 66,
        76, 72, 87, 84, 77, 67, 81, 71, 90, 78,
        80, 89, 70, 86, 79, 69
    );

    CONSTANT ROTOR_C : ROTOR_CONFIG := (
        66, 68, 70, 72, 74, 76, 67, 80, 82, 84,
        88, 86, 90, 78, 89, 69, 73, 87, 71, 65,
        75, 77, 85, 83, 81, 79
    );

    -- a -> c b -> d
    -- [c, d, a, b]
    -- D -> 68 % 65 = 3
    -- map[3] = 66

END EnigmaConstants;