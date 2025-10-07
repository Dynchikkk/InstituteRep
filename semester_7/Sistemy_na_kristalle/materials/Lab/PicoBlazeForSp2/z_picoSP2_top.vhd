library IEEE;                     use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;		 use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;						 use UNISIM.VComponents.all;

entity picoblaze_top is Port ( clk : in std_logic;  
  vh: in std_logic_vector(7 downto 0);  rez_beg: out std_logic;
  vih: out std_logic_vector(7 downto 0) );
end picoblaze_top;  

architecture Behavioral of picoblaze_top is

component embedded_kcpsm port (port_id : out std_logic_vector(7 downto 0);
      write_strobe, read_strobe : out std_logic;
               out_port         : out std_logic_vector(7 downto 0);
                in_port         : in std_logic_vector(7 downto 0);
       interrupt, reset, clk    : in std_logic);
end component;

signal reset, write_strobe, read_strobe, interrupt:STD_LOGIC:='0';
signal port_id, out_port, in_port:std_logic_vector(7 downto 0):=x"00";

begin
K1:embedded_kcpsm Port map (port_id, write_strobe, read_strobe, 
                             out_port, in_port, interrupt, reset, clk);
process (clk) begin		
if clk='1' and clk'event then
  in_port<=vh; 
  if write_strobe='1' and port_id=x"01"  then  -- vih of Picoblaze
     vih<=out_port; rez_beg<='1';
  else rez_beg<='0';
  end if;
end if; 
end process;

interrupt<='0';  
end Behavioral;
