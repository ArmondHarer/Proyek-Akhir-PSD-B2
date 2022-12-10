# Final Project PSD B2 - Enigma Machine Reimplementation on VHDL


## Background


An Enigma Machine is one of the most sophisticated encryption machines in the 20th century. It was commonly used during World War II by the German Military to send an encrypted message to one another without the enemies being able to know what the message actually contains. This encryption was then cracked by Allied forces thanks to earlier decryption attempts by Poland under the leadership of mathematician Marian Rejewski in the early 1930s. However, there weren’t any notable developments until Bletchley Park, a secret British intelligence facility, discovered a breakthrough thanks to the Bombe machine, a machine which can decrypt Enigma text faster than it would take an average human 

Our project aims to recreate the functionality of the Enigma machine using VHDL, a hardware description language used to design and simulate digital systems. VHDL allows us to accurately model the Enigma's rotors and reflectors, as well as its plugboard for additional encryption. By reimplementing the Enigma in VHDL, we hope to gain a better understanding of how it worked and how it was eventually broken.



Our design is based on this [Python](https://www.101computing.net/enigma/) source code. 

## How it works
When user enters the input it will pass a several component, the first one is the plugboard. The plugboard allowed the user to connect pairs of letters, so that when one letter was entered, the signal would go through the plugboard component and be replaced with the pair letter that is configured in the configuration file before passing through the rotors and the electrical circuit. After that the signal would go through the rotor array to scramble the signal further before arriving in the reflector which reflects the signal back to the rotor array from the opposite side. Finally, the signal go through the plugboard once more and can be read directly or passed to an encoder which can be displayed on a 16-segment display.

## How to use
Our design works by receiving binary ASCII input signal in form of `std_logic_vector(7 downto 0)` represented by the . The program then pass it towards the entire mechanism and ended in 16-Segment display encoder which can be displayed in 16-Segment display. User can also change the enigma configuration by modifying the constants located in `EnigmaConstants.vhd`.

## Testing
We validated our design by using a testbench file that generates A to Z alphabet that will be passed to the input. Our design is considered successful if the input and the output match in pairs.

## Result
Our testing result shows that the input and output are indeed matched in pairs, that means our design works as we intended it to. Below is the simulation result.
![Top level testbench simulation](assets/enigma-tb.jpg)