library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p4 is
    Port (
        clk        : in  STD_LOGIC;          
        enable     : in  STD_LOGIC;          
        reset      : in  STD_LOGIC;          
        carry_out  : out STD_LOGIC;          
        count      : out STD_LOGIC_VECTOR(9 downto 0)  
    );
end p4;

architecture Structural of p4 is

    component p42 is
        Port (
            clk        : in  STD_LOGIC;          
            enable     : in  STD_LOGIC;          
            reset      : in  STD_LOGIC;          
            carry_out  : out STD_LOGIC;          
            count      : out STD_LOGIC_VECTOR(4 downto 0)  
        );
    end component;

    signal count_low  : STD_LOGIC_VECTOR(4 downto 0);
    signal count_high : STD_LOGIC_VECTOR(4 downto 0);
    signal carry_low  : STD_LOGIC;
    
begin

    -- Инстанцирование младшего 5-разрядного счетчика
    low_counter : p42
        port map (
            clk        => clk,
            enable     => enable,
            reset      => reset,
            carry_out  => carry_low,
            count      => count_low
        );

    -- Инстанцирование старшего 5-разрядного счетчика
    high_counter : p42
        port map (
            clk        => clk,
            enable     => carry_low,  -- Старший счетчик активируется, когда младший достиг максимума
            reset      => reset,
            carry_out  => carry_out,
            count      => count_high
        );

    -- Объединение выходов счетчиков
    count <= count_high & count_low;  -- Соединяем старший и младший счетчики

end Structural;
