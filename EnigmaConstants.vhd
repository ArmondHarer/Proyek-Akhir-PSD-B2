LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE work.EnigmaTypes.ALL;

PACKAGE EnigmaConstants IS
    CONSTANT ROTOR_A_MAP : ROTOR_CONFIG := (
        -- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        -- "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
        "01000101", "01001011", "01001101", "01000110", "01001100", "01000111", "01000100",
        "01010001", "01010110", "01011010", "01001110", "01010100", "01001111", "01010111",
        "01011001", "01001000", "01011000", "01010101", "01010011", "01010000", "01000001",
        "01001001", "01000010", "01010010", "01000011", "01001010"
    );

    CONSTANT ROTOR_B_MAP : ROTOR_CONFIG := (
        -- "AJDKSIRUXBLHWTMCQGZNPYFVOE"
        "01000001", "01001010", "01000100", "01001011", "01010011", "01001001", "01010010",
        "01010101", "01011000", "01000010", "01001100", "01001000", "01010111", "01010100",
        "01001101", "01000011", "01010001", "01000111", "01011010", "01001110", "01010000",
        "01011001", "01000110", "01010110", "01001111", "01000101"
    );

    CONSTANT ROTOR_C_MAP : ROTOR_CONFIG := (
        -- "BDFHJLCPRTXVZNYEIWGAKMUSQO"
        "01000010", "01000100", "01000110", "01001000", "01001010", "01001100", "01000011",
        "01010000", "01010010", "01010100", "01011000", "01010110", "01011010", "01001110",
        "01011001", "01000101", "01001001", "01010111", "01000111", "01000001", "01001011",
        "01001101", "01010101", "01010011", "01010001", "01001111"
    );
    CONSTANT REFLECTOR_PAIR_MAP : ROTOR_CONFIG := (
        --OUT   EJMZALYXVBWFCRQUONTSPIKHGD
        "01000101", "01001010", "01001101", "01011010", "01000001", "01001100", "01011001",
        "01011000", "01010110", "01000010", "01010111", "01000110", "01000011", "01010010",
        "01010001", "01010101", "01001111", "01001110", "01010100", "01010011", "01010000",
        "01001001", "01001011", "01001000", "01000111", "01000100"
    );

    CONSTANT PLUGBOARD : PLUGBOARD_CONFIG := (
        -- TSCEDMGHRJNZFKWVQIBAUPOYXL
        "01010100", "01010011", "01000011", "01000101", "01000100", "01001101", "01000111",
        "01001000", "01010010", "01001010", "01001110", "01011010", "01000110", "01001011",
        "01010111", "01010110", "01010001", "01001001", "01000010", "01000001", "01010101",
        "01010000", "01001111", "01011001", "01011000", "01001100"
    );
    CONSTANT ALPHABET_LETTERS : ALPHABET_IN_BITS := (
        -- A to Z
        "01000001", "01000010", "01000011", "01000100", "01000101", "01000110", "01000111",
        "01001000", "01001001", "01001010", "01001011", "01001100", "01001101", "01001110",
        "01001111", "01010000", "01010001", "01010010", "01010011", "01010100", "01010101",
        "01010110", "01010111", "01011000", "01011001", "01011010"
    );

END EnigmaConstants;