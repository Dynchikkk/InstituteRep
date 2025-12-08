LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb1 IS END tb1;

ARCHITECTURE behavior OF tb1 IS 
    COMPONENT picoblaze_top PORT(
        clk : IN std_logic;
        in1 : IN std_logic_vector(7 downto 0);
        in2 : IN std_logic_vector(7 downto 0);
        out1 : OUT std_logic_vector(7 downto 0);
        out2 : OUT std_logic_vector(7 downto 0);
        out3 : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    signal clk : std_logic := '0';
    signal in1, in2 : std_logic_vector(7 downto 0) := (others => '0');
    signal out1, out2, out3 : std_logic_vector(7 downto 0);
   constant clk_period : time := 10 ns;
 
BEGIN
 
   u1: picoblaze_top PORT MAP ( clk => clk,   in1 => in1,	in2 => in2,   out1 => out1, out2 => out2, out3 => out3);

   clk_process :process
   begin
		clk <= '0';		wait for clk_period/2;
		clk <= '1';		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      wait for 10 ns;	
	
	
	in1 <= x"02";
	in2 <= x"03";
	wait for 200 ns;

	in1 <= x"0A";
	in2 <= x"14";
	wait for 200 ns;
		
      wait;
   end process;

END;
