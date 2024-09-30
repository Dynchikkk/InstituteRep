library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list13 is
    Port (clk, x1, x2, x3 : in  STD_LOGIC; 
           y : out  STD_LOGIC);

end list13;

architecture Behavioral of list13 is
signal z1, z2, z3 : STD_LOGIC;
begin
process (clk) begin     
  if clk='1' and clk'event then
	  z1 <= x1; z2 <= x2; z3 <= x3;
     y <= ((not z1) and (not z2)) or (z1 and z2 and (not z3)) or ((not z1) and z2 and (not z3));
  end if; 
end process; 
end Behavioral;