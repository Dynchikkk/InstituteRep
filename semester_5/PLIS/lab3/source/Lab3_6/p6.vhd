library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p6 is
    Port (
        clk   : in  STD_LOGIC;                    -- ������������ �� �����
        led   : out STD_LOGIC_VECTOR (7 downto 0) -- 8 ������� �������� �� ����������
    );
end p6;

architecture Behavioral of p6 is
    signal counter : STD_LOGIC_VECTOR (30 downto 0) := (others => '0'); -- 31-��������� �������
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;               -- ��������� ��������
        end if;
    end process;

    -- ����������� 8 ������� �������� ������� ��� ����������
    led <= counter(30 downto 23);
end Behavioral;