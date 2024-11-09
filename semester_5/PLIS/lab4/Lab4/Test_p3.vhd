library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Test_p3 is
end Test_p3;

architecture behavior of Test_p3 is
    -- ������� ��� ������������
    signal clk   : STD_LOGIC := '0';
    signal D1, D2, Z1 : STD_LOGIC_VECTOR(15 downto 0);
    
    -- ������ ��������� �������
    constant clk_period : time := 10 ns; -- ������ �����
begin
    -- ��������� ���������� (����������)
    uut: entity work.p3
        port map ( clk => clk, D1 => D1, D2 => D2, Z1 => Z1 );

    -- ��������� ��������� �������
    clk_process: process
    begin
        -- ��������� ��������� �������
        while true loop
            clk <= '0';
            wait for clk_period / 2;  -- �������� ������� ��� ��������� �����
            clk <= '1';
            wait for clk_period / 2;  -- �������� ������� ��� ��������� �����
        end loop;
    end process;

    -- ��������� ������
    stim_proc: process
    begin
        -- ������ 1: ������������� ��������
        D1 <= "0000000000000101";  
        D2 <= "0000000000001010"; 
        wait for 20 ns;  -- �������� ��� �������������

        -- ������ 2: ������������� ��������
        D1 <= "0000000000100000";  
        D2 <= "0000000000001000";  
        wait for 20 ns;

        -- ������ 3: D1 > D2
        D1 <= "0000000010000000";  
        D2 <= "0000000000000101"; 
        wait for 20 ns;

        -- ������ 4: D1 < D2
        D1 <= "0000000000000011"; 
        D2 <= "0000000000000111";  
        wait for 20 ns;

        -- ������ 5: ������� ��������
        D1 <= "0000000000000000";  
        D2 <= "0000000000000000";  
        wait for 20 ns;

        -- ������ 6: ������������ ��������
        D1 <= "0000000000111111"; 
        D2 <= "0000000000111011";  
        wait for 20 ns;

        -- ������ 7: ��������� ������������� � ������������� ��������
        D1 <= "0000000000001010"; 
        D2 <= "0000000000111010"; 
        wait for 20 ns;

        -- ������ 8: D1 � D2 �������������
        D1 <= "0000000000110000"; 
        D2 <= "0000000001101100"; 
        wait for 20 ns;

        wait;
    end process;
end behavior;
