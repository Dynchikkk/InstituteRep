library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p5 is
    Port (
        x     : in  STD_LOGIC_VECTOR (7 downto 0); -- ������� ����� x � ���������
        clk   : in  STD_LOGIC;                    -- ������ �������������
        q     : out STD_LOGIC_VECTOR (7 downto 0) -- �����, ������������ � �����������
    );
end p5;

architecture Behavioral of p5 is
    -- ��������� 3*i (��� i = 4) � �������� ����
    constant CONST_3I : STD_LOGIC_VECTOR (7 downto 0) := "00001100"; -- 12
    signal sum_reg    : STD_LOGIC_VECTOR (7 downto 0);               -- ������� ��� �������� ����������
begin

    process(clk)
    begin
        if rising_edge(clk) then
            -- ��������� x � CONST_3I � ��������� � �������� sum_reg
            sum_reg <= x + CONST_3I;
        end if;
    end process;

    -- ����������� ��������� ������� �������� ��������
    q <= sum_reg;
end Behavioral;
