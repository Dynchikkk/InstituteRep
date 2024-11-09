library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p4 is
    Port (
        clk        : in  STD_LOGIC;          -- �������� ������
        enable     : in  STD_LOGIC;          -- ���� ����������
        reset      : in  STD_LOGIC;          -- ���� ������
        carry_out  : out STD_LOGIC;          -- ����� ��������
        count      : out STD_LOGIC_VECTOR(4 downto 0)  -- ����� �������� (5 ���)
    );
end p4;

architecture Behavioral of p4 is
    signal count_reg : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- �������� ��������
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count_reg <= (others => '0'); -- ����� ��������
            carry_out <= '0';              -- ����� ��������
        elsif rising_edge(clk) then
            if enable = '1' then
                if count_reg = "11111" then  -- �������� �� ������������ �������� (31)
                    count_reg <= (others => '0'); -- ���������� �������
                    carry_out <= '1';            -- ������������� �������
                else
                    count_reg <= count_reg + 1;  -- ����������� �������
                    carry_out <= '0';            -- ���������� �������
                end if;
            end if;
        end if;
    end process;

    count <= count_reg;  -- ������� ������� �������� ��������

end Behavioral;
