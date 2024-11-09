library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p1 is
    Port (
        clk        : in  STD_LOGIC;         -- Синхросигнал
        reset      : in  STD_LOGIC;         -- Вход сброса
        signal_out : out STD_LOGIC           -- Выход сигнала
    );
end p1;

architecture Behavioral of p1 is
    signal state       : INTEGER := 0;    -- Состояние (0 - не сигнальное, 1 - сигнальное, 2 - завершено)
    signal clk_prev    : STD_LOGIC := '0'; -- Предыдущее состояние clk
begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= 0;                     -- Сброс состояния
            signal_out <= '0';              -- Выход в не сигнальное состояние
        else
            -- Проверяем, изменился ли сигнал clk
            if clk = '1' and clk_prev = '0' then
                if state = 0 then            -- Если в не сигнальном состоянии
                    state <= 1;              -- Переход в сигнальное состояние
                    signal_out <= '1';       -- Установить выход в сигнальное состояние
                elsif state = 1 then         -- Если в сигнальном состоянии
                    state <= 2;              -- Переход в состояние завершения
                    signal_out <= '1';       -- Выход остается в сигнальном состоянии
                elsif state = 2 then         -- Если в состоянии завершения
                    state <= 2;              -- Оставаться в состоянии завершения
                    signal_out <= '0';       -- Выход в не сигнальное состояние
                end if;
            end if;
            clk_prev <= clk;                 -- Сохраняем текущее состояние clk
        end if;
    end process;

end Behavioral;
