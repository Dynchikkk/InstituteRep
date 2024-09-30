library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list22 is
	 Port (
        A    : in  STD_LOGIC_VECTOR(1 downto 0);						
        B    : in  STD_LOGIC_VECTOR(1 downto 0);
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR(1 downto 0);
        Cout : out STD_LOGIC
    );
end list22;

architecture Behavioral of list22 is
	signal C0 : STD_LOGIC;
begin
	-- Младший разряд
	process (A, B, Cin)
    begin
        S(0) <= A(0) XOR B(0) XOR Cin;
        C0 <= (A(0) AND B(0)) OR (Cin AND (A(0) XOR B(0)));
    end process;

    -- Старший разряд
    process (A, B, C0)
    begin
        S(1) <= A(1) XOR B(1) XOR C0;
        Cout <= (A(1) AND B(1)) OR (C0 AND (A(1) XOR B(1)));
    end process;
end Behavioral;
