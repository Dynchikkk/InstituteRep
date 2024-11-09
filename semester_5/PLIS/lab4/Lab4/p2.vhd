library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p2 is
    Port (
        clk       : in  STD_LOGIC;                          -- Тактовый сигнал
        reset     : in  STD_LOGIC;                          -- Сигнал сброса
        data_in   : in  STD_LOGIC_VECTOR(7 downto 0);       -- Входные данные (8 бит)
        result_out: out STD_LOGIC_VECTOR(15 downto 0)       -- Результат суммы (16 бит)
    );
end p2;

architecture Behavioral of p2 is
    -- Параметры для хранения промежуточных сумм на каждом этапе конвейера
    type pipeline_type is array (0 to 12) of STD_LOGIC_VECTOR(15 downto 0);
    signal pipeline: pipeline_type := (others => (others => '0'));
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Сброс всех регистров конвейера
            for i in 0 to 12 loop
                pipeline(i) <= (others => '0');
            end loop;
            result_out <= (others => '0');
        elsif rising_edge(clk) then
            -- Заполнение первого регистра значением data_in
            pipeline(0) <= ("00000000" & data_in); -- Расширение до 16 бит

            -- Конвейерное суммирование
            for i in 1 to 12 loop
                pipeline(i) <= pipeline(i - 1) + pipeline(0);
            end loop;

            -- Вывод результата из последнего этапа конвейера
            result_out <= pipeline(12);
        end if;
    end process;
end Behavioral;
