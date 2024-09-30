library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity list52 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(15 downto 0);
        F : out  STD_LOGIC
    );
end list52;

architecture Behavioral of list52 is
    signal temp_Y : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process (A)
    begin
        temp_Y(0) <= not A(3) and not A(2) and not A(1) and not A(0);
        temp_Y(1) <= not A(3) and not A(2) and not A(1) and A(0);
        temp_Y(2) <= not A(3) and not A(2) and A(1) and not A(0);
        temp_Y(3) <= not A(3) and not A(2) and A(1) and A(0);
        temp_Y(4) <= not A(3) and A(2) and not A(1) and not A(0);
        temp_Y(5) <= not A(3) and A(2) and not A(1) and A(0);
        temp_Y(6) <= not A(3) and A(2) and A(1) and not A(0);
        temp_Y(7) <= not A(3) and A(2) and A(1) and A(0);
        temp_Y(8) <= A(3) and not A(2) and not A(1) and not A(0);
        temp_Y(9) <= A(3) and not A(2) and not A(1) and A(0);
        temp_Y(10) <= A(3) and not A(2) and A(1) and not A(0);
        temp_Y(11) <= A(3) and not A(2) and A(1) and A(0);
        temp_Y(12) <= A(3) and A(2) and not A(1) and not A(0);
        temp_Y(13) <= A(3) and A(2) and not A(1) and A(0);
        temp_Y(14) <= A(3) and A(2) and A(1) and not A(0);
        temp_Y(15) <= A(3) and A(2) and A(1) and A(0);

        Y <= temp_Y;
        
        F <= temp_Y(0) or temp_Y(1) or temp_Y(5) or temp_Y(13) or temp_Y(14) or temp_Y(15);
    end process;
end Behavioral;
