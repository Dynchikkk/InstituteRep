library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  -- ��� ������ � ��������������� ���������� ��� ���������

entity p3 is
    port (
        clk      : in std_logic;                         -- �������� ������
        reset    : in std_logic;                         -- ������ ������
        up_down  : in std_logic;                         -- ����������� ������ (1 - �����������, 0 - ���������)
        count    : out std_logic_vector(7 downto 0)      -- ������� �������� �������� (8 ���)
    );
end entity p3;

architecture behavior of p3 is
    signal count_reg : std_logic_vector(7 downto 0) := "00000000";  -- ������� ��� �������� �������� �������� ��������
begin

    -- ������� ��� ���������� ���������
    process (clk, reset)
    begin
        if reset = '1' then
            count_reg <= "00000000";  -- ���� ������ ������ �������, ���������� ������� � 0
        elsif rising_edge(clk) then
            if up_down = '1' then
                count_reg <= count_reg + 1;  -- ����������� �������, ���� up_down = 1
            else
                count_reg <= count_reg - 1;  -- ��������� �������, ���� up_down = 0
            end if;
        end if;
    end process;

    -- ����������� ������� �������� �������� �� �����
    count <= count_reg;

end architecture behavior;
