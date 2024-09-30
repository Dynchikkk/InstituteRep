library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list3 is
	 Port (
        A1    : in  STD_LOGIC;
        A0    : in  STD_LOGIC;
        D    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end list3;

architecture Behavioral of list3 is
begin
process (A0, A1) begin     
	D(0) <= (not A1) and (not A0);
	D(1) <= (not A1) and A0;
	D(2) <= A1 and (not A0);
	D(3) <= A1 and A0;
end process;
end Behavioral; 