library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list4 is
	 Port (
        A1    : in  STD_LOGIC;
        A0    : in  STD_LOGIC;
		  S    : in  STD_LOGIC;
        Y : out  STD_LOGIC
    );
end list4;

architecture Behavioral of list4 is
begin
process (A0, A1, S) begin     
	Y <= (A0 and (not S)) or (A1 and S);
end process;
end Behavioral;