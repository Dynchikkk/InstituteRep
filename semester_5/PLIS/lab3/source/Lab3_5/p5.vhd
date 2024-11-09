library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p5 is
    Port (
        x     : in  STD_LOGIC_VECTOR (7 downto 0); -- Входное число x с тумблеров
        clk   : in  STD_LOGIC;                    -- Сигнал синхронизации
        q     : out STD_LOGIC_VECTOR (7 downto 0) -- Выход, подключаемый к светодиодам
    );
end p5;

architecture Behavioral of p5 is
    -- Константа 3*i (где i = 4) в двоичном виде
    constant CONST_3I : STD_LOGIC_VECTOR (7 downto 0) := "00001100"; -- 12
    signal sum_reg    : STD_LOGIC_VECTOR (7 downto 0);               -- Регистр для хранения результата
begin

    process(clk)
    begin
        if rising_edge(clk) then
            -- Суммируем x и CONST_3I и сохраняем в регистре sum_reg
            sum_reg <= x + CONST_3I;
        end if;
    end process;

    -- Присваиваем выходному сигналу значение регистра
    q <= sum_reg;
end Behavioral;
