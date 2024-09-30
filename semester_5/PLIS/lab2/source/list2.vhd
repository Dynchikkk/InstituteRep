library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list2 is
	 Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end list2;

architecture Behavioral of list2 is
begin
    process (A, B, Cin)
    begin
        S <= A XOR B XOR Cin;
        Cout <= (A AND B) OR ((A XOR B) AND Cin);
    end process;
end Behavioral;

