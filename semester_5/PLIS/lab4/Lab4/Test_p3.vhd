library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Test_p3 is
end Test_p3;

architecture behavior of Test_p3 is
    -- Сигналы для тестирования
    signal clk   : STD_LOGIC := '0';
    signal D1, D2, Z1 : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Период тактового сигнала
    constant clk_period : time := 10 ns; -- Период такта
begin
    -- Установка компонента (процессора)
    uut: entity work.p3
        port map ( clk => clk, D1 => D1, D2 => D2, Z1 => Z1 );

    -- Генерация тактового сигнала
    clk_process: process
    begin
        -- Генерация тактового сигнала
        while true loop
            clk <= '0';
            wait for clk_period / 2;  -- Половина периода для генерации такта
            clk <= '1';
            wait for clk_period / 2;  -- Половина периода для генерации такта
        end loop;
    end process;

    -- Генерация тестов
    stim_proc: process
    begin
        -- Пример 1: положительные значения
        D1 <= "0000000000000101";  
        D2 <= "0000000000001010"; 
        wait for 20 ns;  -- Задержка для моделирования

        -- Пример 2: отрицательные значения
        D1 <= "0000000000100000";  
        D2 <= "0000000000001000";  
        wait for 20 ns;

        -- Пример 3: D1 > D2
        D1 <= "0000000010000000";  
        D2 <= "0000000000000101"; 
        wait for 20 ns;

        -- Пример 4: D1 < D2
        D1 <= "0000000000000011"; 
        D2 <= "0000000000000111";  
        wait for 20 ns;

        -- Пример 5: нулевые значения
        D1 <= "0000000000000000";  
        D2 <= "0000000000000000";  
        wait for 20 ns;

        -- Пример 6: максимальные значения
        D1 <= "0000000000111111"; 
        D2 <= "0000000000111011";  
        wait for 20 ns;

        -- Пример 7: сочетание положительных и отрицательных значений
        D1 <= "0000000000001010"; 
        D2 <= "0000000000111010"; 
        wait for 20 ns;

        -- Пример 8: D1 и D2 отрицательные
        D1 <= "0000000000110000"; 
        D2 <= "0000000001101100"; 
        wait for 20 ns;

        wait;
    end process;
end behavior;
