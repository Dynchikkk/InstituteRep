library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p2 is
    Port (
        clk        : in  STD_LOGIC;                        -- �������� ������
        reset      : in  STD_LOGIC;                        -- ���� ������
        a          : in  STD_LOGIC_VECTOR(3 downto 0);     -- ������ ���� (4 ����)
        b          : in  STD_LOGIC_VECTOR(3 downto 0);     -- ������ ���� (4 ����)
        sum        : out STD_LOGIC_VECTOR(3 downto 0);      -- ����� ����� (4 ����)
        carry_out  : out STD_LOGIC                          -- ����� ��������
    );
end p2;

architecture Behavioral of p2 is
    signal reg_a     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); -- ������� ��� ������� �����
    signal reg_b     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); -- ������� ��� ������� �����
    signal reg_sum   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); -- ������� ��� �����
    signal carry     : STD_LOGIC := '0';                        -- �������
begin

    -- ������� ��� ����������� ������
    process(clk, reset)
    begin
        if reset = '1' then
            reg_a <= (others => '0');                          -- ����� ������� ��������
            reg_b <= (others => '0');                          -- ����� ������� ��������
            reg_sum <= (others => '0');                        -- ����� �������� �����
            carry <= '0';                                       -- ����� ��������
        elsif rising_edge(clk) then
            reg_a <= a;                                         -- ������ ������� ����� � �������
            reg_b <= b;                                         -- ������ ������� ����� � �������
            -- ������������ � ������ ��������
            reg_sum <= reg_a + reg_b;                          -- �����
            if (reg_a + reg_b) > "1111" then                   -- �������� �� �������
                carry <= '1';                                  -- ������������� �������
            else
                carry <= '0';                                  -- ���������� �������
            end if;
        end if;
    end process;

    -- ����� ����������
    sum <= reg_sum;                                          -- ����� �����
    carry_out <= carry;                                      -- ����� ��������

end Behavioral;
