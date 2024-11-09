library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p6 is
    Port (
        clk   : in  STD_LOGIC;                    -- Синхросигнал на входе
        led   : out STD_LOGIC_VECTOR (7 downto 0) -- 8 старших разрядов на светодиоды
    );
end p6;

architecture Behavioral of p6 is
    signal counter : STD_LOGIC_VECTOR (30 downto 0) := (others => '0'); -- 31-разрядный счетчик
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;               -- Инкремент счетчика
        end if;
    end process;

    -- Присваиваем 8 старших разрядов выходам для наблюдения
    led <= counter(30 downto 23);
end Behavioral;