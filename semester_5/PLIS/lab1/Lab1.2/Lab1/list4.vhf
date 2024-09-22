--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : list4.vhf
-- /___/   /\     Timestamp : 09/22/2024 19:25:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family xc9500 -flat -suppress -w Z:/Lab11/Lab1/list4.sch list4.vhf
--Design Name: list4
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

entity list4 is
   port ( A  : in    std_logic; 
          X1 : in    std_logic; 
          X2 : in    std_logic; 
          Y  : out   std_logic);
end list4;

architecture BEHAVIORAL of list4 is
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_4 : std_logic;
   signal XLXN_5 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>A,
                O=>XLXN_1);
   
   XLXI_2 : AND2
      port map (I0=>X1,
                I1=>XLXN_1,
                O=>XLXN_4);
   
   XLXI_3 : AND2
      port map (I0=>X2,
                I1=>A,
                O=>XLXN_5);
   
   XLXI_4 : OR2
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                O=>Y);
   
end BEHAVIORAL;


