library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Test_p1 is
end Test_p1;

architecture Behavioral of Test_p1 is
    -- Компонент устройства
    component p1
        Port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            data_in : in  STD_LOGIC_VECTOR(7 downto 0);
            R1      : out STD_LOGIC_VECTOR(7 downto 0);
            R2      : out STD_LOGIC_VECTOR(7 downto 0);
            RSM     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal R1      : STD_LOGIC_VECTOR(7 downto 0);
    signal R2      : STD_LOGIC_VECTOR(7 downto 0);
    signal RSM     : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Инстанцирование устройства
    UUT: p1
        Port map (
            clk     => clk,
            reset   => reset,
            data_in => data_in,
            R1      => R1,
            R2      => R2,
            RSM     => RSM
        );

    -- Генерация тактового сигнала
    clk_process: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- Стимулы для моделирования
    stimulus_process: process
    begin
        -- Инициализация и сброс устройства
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Подача данных на вход data_in после сброса
        data_in <= "00001111";   -- Ввод данных 1
        wait for 40 ns;

        data_in <= "10101010";   -- Ввод данных 2
        wait for 40 ns;

        data_in <= "11110000";   -- Ввод данных 3
        wait for 40 ns;

        wait;
    end process;
end Behavioral;
