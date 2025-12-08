library IEEE;                     use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;		 use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;						 use UNISIM.VComponents.all;

entity picoblaze_top is Port ( 
    clk : in std_logic;  
    in1 : in std_logic_vector(7 downto 0);
    in2 : in std_logic_vector(7 downto 0);
    out1 : out std_logic_vector(7 downto 0);
    out2 : out std_logic_vector(7 downto 0);  
    out3 : out std_logic_vector(7 downto 0)
);
end picoblaze_top;

architecture Behavioral of picoblaze_top is

component embedded_kcpsm3 port (port_id : out std_logic_vector(7 downto 0);
      write_strobe, read_strobe : out std_logic;
               out_port         : out std_logic_vector(7 downto 0);
                in_port         : in std_logic_vector(7 downto 0);
              interrupt         : in std_logic;
          interrupt_ack         : out std_logic;
                  reset, clk    : in std_logic);
end component;

signal reset, write_strobe, read_strobe, interrupt, interrupt_ack:STD_LOGIC:='0';
signal port_id, out_port, in_port:std_logic_vector(7 downto 0):=x"00";

begin
K1:embedded_kcpsm3 Port map (port_id, write_strobe, read_strobe, 
                             out_port, in_port, interrupt, interrupt_ack, reset, clk);
									 
process(port_id, in1, in2)
begin
    case port_id is
        when x"00" => in_port <= in1;
        when x"01" => in_port <= in2;
        when others => in_port <= x"00";
    end case;
end process;		
									  
process (clk) begin		
if clk='1' and clk'event then
 if write_strobe='1' then
    case port_id is
        when x"00" => out1 <= out_port;
        when x"01" => out2 <= out_port;
        when x"02" => out3 <= out_port;
        when others => null;
    end case;
end if;
end if; 
end process;

interrupt<='0';  reset<='0';  
end Behavioral;
