library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p1 is
    Port (
        clk     : in  STD_LOGIC;                    -- Тактовый сигнал
        reset   : in  STD_LOGIC;                    -- Сигнал сброса
        data_in : in  STD_LOGIC_VECTOR(7 downto 0); -- Входные данные (ШД)
        R1      : out STD_LOGIC_VECTOR(7 downto 0); -- Регистр R1
        R2      : out STD_LOGIC_VECTOR(7 downto 0); -- Регистр R2
        RSM     : out STD_LOGIC_VECTOR(7 downto 0)  -- Результат RSM
    );
end p1;

architecture Behavioral of p1 is
    signal reg_R1  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal reg_R2  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal reg_RSM : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg_R1 <= (others => '0');
            reg_R2 <= (others => '0');
            reg_RSM <= (others => '0');
        elsif rising_edge(clk) then
            -- Пример последовательности микроопераций
            -- 1. R1 := data_in
            reg_R1 <= data_in;
            -- 2. R2 := R1
            reg_R2 <= reg_R1;
            -- 3. R2 := R1 OR R2
            reg_R2 <= reg_R1 or reg_R2;
            -- 4. RSM := R1 + R2
            reg_RSM <= reg_R1 + reg_R2;
            -- 5. RSM := R1
            reg_RSM <= reg_R1;
        end if;
    end process;

    -- Вывод значений регистров
    R1 <= reg_R1;
    R2 <= reg_R2;
    RSM <= reg_RSM;
end Behavioral;
