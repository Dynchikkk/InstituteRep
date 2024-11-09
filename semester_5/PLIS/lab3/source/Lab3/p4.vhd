library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p4 is
    Port (
        clk        : in  STD_LOGIC;          -- Тактовый сигнал
        enable     : in  STD_LOGIC;          -- Вход разрешения
        reset      : in  STD_LOGIC;          -- Вход сброса
        carry_out  : out STD_LOGIC;          -- Выход переноса
        count      : out STD_LOGIC_VECTOR(4 downto 0)  -- Выход счетчика (5 бит)
    );
end p4;

architecture Behavioral of p4 is
    signal count_reg : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Регистры счетчика
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count_reg <= (others => '0'); -- Сброс счетчика
            carry_out <= '0';              -- Сброс переноса
        elsif rising_edge(clk) then
            if enable = '1' then
                if count_reg = "11111" then  -- Проверка на максимальное значение (31)
                    count_reg <= (others => '0'); -- Сбрасываем счетчик
                    carry_out <= '1';            -- Устанавливаем перенос
                else
                    count_reg <= count_reg + 1;  -- Увеличиваем счетчик
                    carry_out <= '0';            -- Сбрасываем перенос
                end if;
            end if;
        end if;
    end process;

    count <= count_reg;  -- Выводим текущее значение счетчика

end Behavioral;
