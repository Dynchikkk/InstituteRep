library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p22 is
    Port (
        clk        : in  STD_LOGIC;                           -- Тактовый сигнал
        reset      : in  STD_LOGIC;                           -- Вход сброса
        a          : in  STD_LOGIC_VECTOR(15 downto 0);       -- Первый вход (16 бит)
        b          : in  STD_LOGIC_VECTOR(15 downto 0);       -- Второй вход (16 бит)
        sum        : out STD_LOGIC_VECTOR(15 downto 0);        -- Выход суммы (16 бит)
        carry_out  : out STD_LOGIC                             -- Выход переноса
    );
end p22;

architecture Behavioral of p22 is
    signal reg_a     : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Регистр для первого входа
    signal reg_b     : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Регистр для второго входа
    signal reg_sum   : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Регистр для суммы
    signal carry     : STD_LOGIC := '0';                          -- Перенос
begin

    -- Процесс для регистрации входов
    process(clk, reset)
    begin
        if reset = '1' then
            reg_a <= (others => '0');                           -- Сброс первого регистра
            reg_b <= (others => '0');                           -- Сброс второго регистра
            reg_sum <= (others => '0');                         -- Сброс регистра суммы
            carry <= '0';                                        -- Сброс переноса
        elsif rising_edge(clk) then
            reg_a <= a;                                          -- Запись первого входа в регистр
            reg_b <= b;                                          -- Запись второго входа в регистр
            -- Суммирование с учетом переноса
            reg_sum <= reg_a + reg_b;                           -- Сумма
            if (reg_a + reg_b) > "1111111111111111" then        -- Проверка на перенос
                carry <= '1';                                   -- Устанавливаем перенос
            else
                carry <= '0';                                   -- Сбрасываем перенос
            end if;
        end if;
    end process;

    -- Вывод результата
    sum <= reg_sum;                                           -- Вывод суммы
    carry_out <= carry;                                       -- Вывод переноса

end Behavioral;
