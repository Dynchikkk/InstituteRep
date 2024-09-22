--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : list3.vhf
-- /___/   /\     Timestamp : 09/15/2024 19:27:35
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family xc9500 -flat -suppress -w Z:/Lab1/list3.sch list3.vhf
--Design Name: list3
--Device: xc9500
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity list3 is
   port ( X1 : in    std_logic; 
          X2 : in    std_logic; 
          A0 : out   std_logic; 
          A1 : out   std_logic; 
          A2 : out   std_logic; 
          A3 : out   std_logic);
end list3;

architecture BEHAVIORAL of list3 is
   attribute BOX_TYPE   : string ;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
begin
   XLXI_2 : AND2B1
      port map (I0=>X2,
                I1=>X1,
                O=>A1);
   
   XLXI_3 : AND2B1
      port map (I0=>X1,
                I1=>X2,
                O=>A2);
   
   XLXI_4 : AND2
      port map (I0=>X1,
                I1=>X2,
                O=>A3);
   
   XLXI_6 : AND2B2
      port map (I0=>X1,
                I1=>X2,
                O=>A0);
   
end BEHAVIORAL;


