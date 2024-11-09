library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p2 is
    Port (
        clk       : in  STD_LOGIC;                          -- �������� ������
        reset     : in  STD_LOGIC;                          -- ������ ������
        data_in   : in  STD_LOGIC_VECTOR(7 downto 0);       -- ������� ������ (8 ���)
        result_out: out STD_LOGIC_VECTOR(15 downto 0)       -- ��������� ����� (16 ���)
    );
end p2;

architecture Behavioral of p2 is
    -- ��������� ��� �������� ������������� ���� �� ������ ����� ���������
    type pipeline_type is array (0 to 12) of STD_LOGIC_VECTOR(15 downto 0);
    signal pipeline: pipeline_type := (others => (others => '0'));
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- ����� ���� ��������� ���������
            for i in 0 to 12 loop
                pipeline(i) <= (others => '0');
            end loop;
            result_out <= (others => '0');
        elsif rising_edge(clk) then
            -- ���������� ������� �������� ��������� data_in
            pipeline(0) <= ("00000000" & data_in); -- ���������� �� 16 ���

            -- ����������� ������������
            for i in 1 to 12 loop
                pipeline(i) <= pipeline(i - 1) + pipeline(0);
            end loop;

            -- ����� ���������� �� ���������� ����� ���������
            result_out <= pipeline(12);
        end if;
    end process;
end Behavioral;
