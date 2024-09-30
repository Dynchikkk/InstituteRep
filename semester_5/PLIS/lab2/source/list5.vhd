library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity list5 is
	 Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(15 downto 0);
    );
end list5;

architecture Behavioral of list5 is
begin
 process (A)
    begin
        Y(0) <= not A(3) and not A(2) and not A(1) and not A(0);
        Y(1) <= not A(3) and not A(2) and not A(1) and A(0);
        Y(2) <= not A(3) and not A(2) and A(1) and not A(0);
        Y(3) <= not A(3) and not A(2) and A(1) and A(0);
        Y(4) <= not A(3) and A(2) and not A(1) and not A(0);
        Y(5) <= not A(3) and A(2) and not A(1) and A(0);
        Y(6) <= not A(3) and A(2) and A(1) and not A(0);
        Y(7) <= not A(3) and A(2) and A(1) and A(0);
        Y(8) <= A(3) and not A(2) and not A(1) and not A(0);
        Y(9) <= A(3) and not A(2) and not A(1) and A(0);
        Y(10) <= A(3) and not A(2) and A(1) and not A(0);
        Y(11) <= A(3) and not A(2) and A(1) and A(0);
        Y(12) <= A(3) and A(2) and not A(1) and not A(0);
        Y(13) <= A(3) and A(2) and not A(1) and A(0);
        Y(14) <= A(3) and A(2) and A(1) and not A(0);
        Y(15) <= A(3) and A(2) and A(1) and A(0);
    end process;
end Behavioral;