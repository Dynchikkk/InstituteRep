library IEEE;                    use IEEE.STD_LOGIC_1164.ALL;     
use IEEE.STD_LOGIC_ARITH.ALL;    use IEEE.STD_LOGIC_UNSIGNED.ALL; 
Library unisim;                  use unisim.Vcomponents.all;
 
entity p1_sp3e is  
  port( clk, reset: in std_logic; 
		  sw1: in std_logic_vector(3 downto 0);  
		  leds1: out std_logic_vector(7 downto 0)
		);
end p1_sp3e;   

architecture arh1 of p1_sp3e is

signal r8: std_logic_vector(7 downto 0):=x"00";
signal r4: std_logic_vector(3 downto 0):=x"0";

begin

process (clk) begin     --  f_clk=50 MGz
	if clk='1' and clk'event then  
		r4 <= sw1+1; r8<= r4 & r4;
	end if; 
end process; 
leds1 <= r8; 
END arh1; 
