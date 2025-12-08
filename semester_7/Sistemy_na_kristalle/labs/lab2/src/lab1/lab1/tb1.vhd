LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb1 IS END tb1;
 
ARCHITECTURE behavior OF tb1 IS 
     COMPONENT picoblaze_top   PORT(
         clk : IN  std_logic;
         sw : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(7 downto 0) := (others => '0');
   signal led : std_logic_vector(7 downto 0);
   constant clk_period : time := 10 ns;
 
BEGIN
 
   u1: picoblaze_top PORT MAP ( clk => clk,   sw => sw,   led => led  );

   clk_process :process
   begin
		clk <= '0';		wait for clk_period/2;
		clk <= '1';		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      wait for 0 ns;	
      sw <= x"01"; wait for 90 ns;
      sw <= x"02"; wait for 80 ns;
      sw <= x"03"; wait for 80 ns;
      sw <= x"04"; wait for 80 ns;
      sw <= x"05"; wait for 80 ns;
      sw <= x"06"; wait for 90 ns;
      sw <= x"07"; wait for 90 ns;
      sw <= x"08"; wait for 90 ns;
      sw <= x"09"; wait for 90 ns;
      wait;
   end process;

END;
