library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p7 is
    Port (
        clk      : in  STD_LOGIC;                    -- Синхросигнал на входе
        reset    : in  STD_LOGIC;                    -- Сигнал сброса
        leds     : out STD_LOGIC_VECTOR (5 downto 0) -- 6 светодиодов
    );
end p7;

architecture Behavioral of p7 is
    signal counter : STD_LOGIC_VECTOR (2 downto 0) := "000"; -- 3-битный счетчик для кода 3
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= "000";          -- Сброс счетчика
        elsif rising_edge(clk) then
            counter <= counter + 1;    -- Инкремент счетчика
        end if;
    end process;

    -- Генерация бегущих огней с помощью сдвига активного бита
    leds <= "000001" when counter = "000" else
            "000010" when counter = "001" else
            "000100" when counter = "010" else
            "001000" when counter = "011" else
            "010000" when counter = "100" else
            "100000" when counter = "101" else
            "000001";  -- Начало цикла для 6 состояний
end Behavioral;
