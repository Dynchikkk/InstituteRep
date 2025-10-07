--
-- EMBEDDED_KCPSM.VHD
--
-- Ken Chapman - Xilinx Ltd - October 2002
--
-- This file instantiates the KCPSM processor macro and connects the 
-- program ROM.
--
-- NOTE: The name of the program ROM will probably need to be changed to 
--       reflect the name of the program (PSM) file applied to the assembler.
--
------------------------------------------------------------------------------------
--
-- Standard IEEE libraries
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library unisim;                  use unisim.Vcomponents.all;

--
------------------------------------------------------------------------------------
--
--
entity embedded_kcpsm is
    Port (      port_id : out std_logic_vector(7 downto 0);
           write_strobe : out std_logic;
            read_strobe : out std_logic;
               out_port : out std_logic_vector(7 downto 0);
                in_port : in std_logic_vector(7 downto 0);
              interrupt : in std_logic;
                  reset : in std_logic;
                    clk : in std_logic);
end embedded_kcpsm;
--
------------------------------------------------------------------------------------
--
-- Start of test achitecture
--
architecture connectivity of embedded_kcpsm is
--
------------------------------------------------------------------------------------
--
-- declaration of KCPSM
--
  component kcpsm
    Port (      address : out std_logic_vector(7 downto 0);
            instruction : in std_logic_vector(15 downto 0);
                port_id : out std_logic_vector(7 downto 0);
           write_strobe : out std_logic;
               out_port : out std_logic_vector(7 downto 0);
            read_strobe : out std_logic;
                in_port : in std_logic_vector(7 downto 0);
              interrupt : in std_logic;
                  reset : in std_logic;
                    clk : in std_logic);
    end component;
--
-- declaration of program ROM
--
  component prog_rom 
    Port (      address : in std_logic_vector(7 downto 0);
            instruction : out std_logic_vector(15 downto 0);
                    clk : in std_logic);
    end component;
--
------------------------------------------------------------------------------------
--
-- Signals used to connect KCPSM to program ROM
--
signal     address : std_logic_vector(7 downto 0);
signal instruction : std_logic_vector(15 downto 0);
--
------------------------------------------------------------------------------------
--
-- Start of test circuit description
--
begin

  processor: kcpsm
    port map(      address => address,
               instruction => instruction,
                   port_id => port_id,
              write_strobe => write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
                     reset => reset,
                       clk => clk);

  program: prog_rom
    port map(      address => address,
               instruction => instruction,
                       clk => clk);

end connectivity;

------------------------------------------------------------------------------------
--
-- END OF FILE EMBEDDED_KCPSM.VHD
--
------------------------------------------------------------------------------------

