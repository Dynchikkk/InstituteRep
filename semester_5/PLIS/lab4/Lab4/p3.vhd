library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity p3 is
    Port ( clk : in  STD_LOGIC;
           D1  : in  STD_LOGIC_VECTOR(15 downto 0);
           D2  : in  STD_LOGIC_VECTOR(15 downto 0);
           Z1  : out  STD_LOGIC_VECTOR(15 downto 0));
end p3;

architecture Behavioral of p3 is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Преобразуем STD_LOGIC_VECTOR в signed для сдвига
            Z1 <= std_logic_vector(signed(D1) sll 2) + 
                  std_logic_vector(signed(D2) sll 3) + 
                  std_logic_vector(signed(D2)) +
						std_logic_vector(signed(D2)) +
						std_logic_vector(signed(D2));
        end if;
    end process;
end Behavioral;