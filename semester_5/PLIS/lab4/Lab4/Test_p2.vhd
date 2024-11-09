library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_p2 is
end Test_p2;

architecture Behavioral of Test_p2 is
    -- ��������� ����������
    component p2
        Port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            data_in    : in  STD_LOGIC_VECTOR(7 downto 0);
            result_out : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal clk        : STD_LOGIC := '0';
    signal reset      : STD_LOGIC := '0';
    signal data_in    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal result_out : STD_LOGIC_VECTOR(15 downto 0);

begin
    -- ��������������� ����������
    UUT: p2
        Port map (
            clk        => clk,
            reset      => reset,
            data_in    => data_in,
            result_out => result_out
        );

    -- ��������� ��������� �������
    clk_process: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- ������� ��� �������������
    stimulus_process: process
    begin
        -- ������������� � ����� ����������
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- ������ ������ �� ���� data_in ����� ������
        data_in <= "00001111";  -- ������ �������� ������� ������ (15 � ���������� �������)
        wait for 260 ns;        -- ��������, ���� ������ ������� ����� ��� ����� ���������

        wait;
    end process;
end Behavioral;
