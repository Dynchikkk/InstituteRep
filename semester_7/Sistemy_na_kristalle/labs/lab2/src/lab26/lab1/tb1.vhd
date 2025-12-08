LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb1 IS END tb1;

ARCHITECTURE behavior OF tb1 IS 
    COMPONENT picoblaze_top PORT(
        clk : IN std_logic;
        sw : IN std_logic_vector(7 downto 0);
        btn : IN std_logic_vector(7 downto 0);
        seg : OUT std_logic_vector(6 downto 0);
        ind : OUT std_logic_vector(3 downto 0);
	led : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    signal clk : std_logic := '0';
    signal sw : std_logic_vector(7 downto 0) := (others => '0');
    signal btn : std_logic_vector(7 downto 0) := (others => '0');
    signal seg : std_logic_vector(6 downto 0);
    signal ind : std_logic_vector(3 downto 0);
    signal led : std_logic_vector(7 downto 0);
   constant clk_period : time := 10 ns;
 
BEGIN
 
   u1: picoblaze_top PORT MAP ( clk => clk, sw => sw, btn => btn, seg => seg, ind => ind, led => led);

   clk_process :process
   begin
		clk <= '0';		wait for clk_period/2;
		clk <= '1';		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      wait for 10 ns;	
	 --wait for 1000 ns;
        
        sw <= x"0A";
        --btn <= x"04";
		  btn <= x"84";
        wait for 2500 ns;
        
      wait;
   end process;

END;
