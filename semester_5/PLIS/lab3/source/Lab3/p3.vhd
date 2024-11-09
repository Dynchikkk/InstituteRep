library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  -- Для работы с арифметическими операциями над векторами

entity p3 is
    port (
        clk      : in std_logic;                         -- Тактовый сигнал
        reset    : in std_logic;                         -- Сигнал сброса
        up_down  : in std_logic;                         -- Управляющий сигнал (1 - увеличивать, 0 - уменьшать)
        count    : out std_logic_vector(7 downto 0)      -- Текущие значения счётчика (8 бит)
    );
end entity p3;

architecture behavior of p3 is
    signal count_reg : std_logic_vector(7 downto 0) := "00000000";  -- Регистр для хранения текущего значения счётчика
begin

    -- Процесс для управления счётчиком
    process (clk, reset)
    begin
        if reset = '1' then
            count_reg <= "00000000";  -- Если сигнал сброса активен, сбрасываем счётчик в 0
        elsif rising_edge(clk) then
            if up_down = '1' then
                count_reg <= count_reg + 1;  -- Увеличиваем счётчик, если up_down = 1
            else
                count_reg <= count_reg - 1;  -- Уменьшаем счётчик, если up_down = 0
            end if;
        end if;
    end process;

    -- Присваиваем текущее значение счётчика на выход
    count <= count_reg;

end architecture behavior;
