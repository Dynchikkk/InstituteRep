library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity core is
	generic(																			--���������� ��������
		no_of_threads : integer := 3;
		x_volume : integer := 4;
		no_of_states : integer := 7;
		y_volume : integer := 5;
		ye_volume : integer := 2);
	
	Port (
		clk: in std_logic;
		x : in std_logic_vector(x_volume - 1 downto 0);
		y : out  std_logic_vector(y_volume - 1 downto 0);
		ye : out  std_logic_vector(ye_volume downto 1);
		yk : out  std_logic_vector(no_of_threads + 1 downto 0);
		
		yf6 : out  std_logic															-- ����� ������� �� �� ����� 
	);	     
end core;

architecture Behavioral of core is
	signal s : std_logic_vector(no_of_states - 1 downto 0) := (others => '0'); 			--��������� S
	signal sy : std_logic_vector(y_volume - 1 downto 0);								-- y
	signal sye : std_logic_vector(ye_volume downto 1);									-- ye
	signal syk : std_logic_vector(no_of_threads + 1 downto 0);							-- yk
	signal sx : std_logic_vector(x_volume - 1 downto 0);								-- x
	signal se, sse : std_logic_vector(2 downto 1);										-- ��������� Se
	signal ssk : std_logic_vector(no_of_threads downto 1);								-- ��������� Sk
	signal ssb : std_logic:='1';														--��������� Sb

	
begin
			sx <= x;
			se <= sse;
	
			y <= sy;
			ye <= sye;
			yk <= syk;

	process (CLK)
	begin
		if CLK='1' and CLK'event then
			
			-- ���
		
			s(0) <= sx(0) or s(6);
			s(1) <= (s(0) and sx(2)) or (sse(1) and sx(2));
			s(2) <= s(0) or (s(2) and (not sx(3))) or (sse(2) and (not sx(3)));
			s(3) <= (s(2) and sx(3) and sx(2)) or (sse(2) and sx(3) and sx(2));
			s(4) <= s(0) or (s(4) and (not sx(1)));
			s(5) <= s(4) and sx(1);
			
			sse(1) <= (sse(1) and (not sx(2))) or (s(0) and (not sx(2)));
			sse(2) <= (sse(2) and (not sx(2)) and sx(3)) or (s(2) and (not sx(2)) and sx(3));
			
			ssb <= ssk(1) and ssk(2) and ssk(3);
			
			ssk(1) <= s(1) or (ssk(1) and (not ssb));
			ssk(2) <= s(3) or (ssk(2) and (not ssb));
			ssk(3) <= s(5) or (ssk(3) and (not ssb));
			
			s(6) <= (ssk(1) and ssb) or (ssk(2) and ssb) or (ssk(3) and ssb);
			
			-- ���			

			sy(0) <= s(0);
			sy(1) <= s(2) or s(3) or s(5);
			sy(2) <= s(1) or s(3) or s(4);
			sy(3) <= s(4);
			
			sye(1) <= sse(1);
			sye(2) <= sse(2);
			
			syk(1) <= ssk(1);
			syk(2) <= ssk(2);
			syk(3) <= ssk(3);
			
			syk(0) <= s(6);
			
		end if;
	end process;

-----------

--
		
			
	
end Behavioral;
