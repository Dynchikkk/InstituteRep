library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p1 is
    Port (
        clk        : in  STD_LOGIC;         -- ������������
        reset      : in  STD_LOGIC;         -- ���� ������
        signal_out : out STD_LOGIC           -- ����� �������
    );
end p1;

architecture Behavioral of p1 is
    signal state       : INTEGER := 0;    -- ��������� (0 - �� ����������, 1 - ����������, 2 - ���������)
    signal clk_prev    : STD_LOGIC := '0'; -- ���������� ��������� clk
begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= 0;                     -- ����� ���������
            signal_out <= '0';              -- ����� � �� ���������� ���������
        else
            -- ���������, ��������� �� ������ clk
            if clk = '1' and clk_prev = '0' then
                if state = 0 then            -- ���� � �� ���������� ���������
                    state <= 1;              -- ������� � ���������� ���������
                    signal_out <= '1';       -- ���������� ����� � ���������� ���������
                elsif state = 1 then         -- ���� � ���������� ���������
                    state <= 2;              -- ������� � ��������� ����������
                    signal_out <= '1';       -- ����� �������� � ���������� ���������
                elsif state = 2 then         -- ���� � ��������� ����������
                    state <= 2;              -- ���������� � ��������� ����������
                    signal_out <= '0';       -- ����� � �� ���������� ���������
                end if;
            end if;
            clk_prev <= clk;                 -- ��������� ������� ��������� clk
        end if;
    end process;

end Behavioral;
