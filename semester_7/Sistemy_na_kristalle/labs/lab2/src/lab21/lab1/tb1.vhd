LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb1 IS END tb1;
 
ARCHITECTURE behavior OF tb1 IS 
     COMPONENT picoblaze_top   PORT(
         clk : IN  std_logic;
         sw : IN  std_logic_vector(7 downto 0);
			btn : IN  std_logic_vector(3 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(7 downto 0) := (others => '0');
	signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal led : std_logic_vector(7 downto 0);
   constant clk_period : time := 10 ns;
 
BEGIN
 
   u1: picoblaze_top PORT MAP ( clk => clk,   sw => sw,	btn => btn,   led => led  );

   clk_process :process
   begin
		clk <= '0';		wait for clk_period/2;
		clk <= '1';		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      wait for 50 ns;	
      sw <= x"04"; wait for 400 ns;
		sw <= x"14"; wait for 400 ns;
		sw <= x"34"; wait for 600 ns;
		sw <= x"54"; wait for 500 ns;
		sw <= x"9D"; wait for 500 ns;
		sw <= x"3C"; wait for 600 ns;
		sw <= x"4C"; wait for 600 ns;
		
		sw <= x"01"; wait for 90 ns;
		sw <= x"02"; wait for 80 ns;
		sw <= x"03"; wait for 80 ns;
		sw <= x"04"; wait for 80 ns;
		
		--sw <= x"05"; wait for 1 ns;
		
		--btn(3)<= '1'; wait for 80ns;	--нажата
		--btn(3)<= '0'; wait for 80ns;	--отжата
		
		--sw <= x"06"; wait for 90 ns;
		--sw <= x"07"; wait for 10 ns;
		
		--btn(1)<= '1'; wait for 300ns;	--нажата
		--btn(1)<= '0'; wait for 80ns;	--отжата
		
		--sw <= x"08"; wait for 90 ns;
		--sw <= x"09"; wait for 90 ns;
		
      wait;
   end process;

END;
