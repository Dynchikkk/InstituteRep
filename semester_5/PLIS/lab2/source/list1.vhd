library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list1 is
    Port (clk, x1, x2, x3 : in  STD_LOGIC; 
           y : out  STD_LOGIC);

end list1;

architecture Behavioral of list1 is
begin
process (clk) begin     
  if clk='1' and clk'event then  
     y <= ((not x1) and (not x2)) or (x1 and x2 and (not x3)) or ((not x1) and x2 and (not x3));
  end if; 
end process; 
end Behavioral;