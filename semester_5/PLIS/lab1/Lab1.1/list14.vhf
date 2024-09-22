--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : list14.vhf
-- /___/   /\     Timestamp : 09/15/2024 19:27:32
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family xc9500 -flat -suppress -w Z:/Lab1/list14.sch list14.vhf
--Design Name: list14
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

entity list14 is
   port ( A1 : in    std_logic; 
          A2 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          S1 : out   std_logic; 
          S2 : out   std_logic; 
          S3 : out   std_logic);
end list14;

architecture BEHAVIORAL of list14 is
   attribute BOX_TYPE   : string ;
   signal P       : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>B1,
                I1=>A1,
                O=>P);
   
   XLXI_2 : AND2B1
      port map (I0=>P,
                I1=>XLXN_6,
                O=>S1);
   
   XLXI_3 : OR2
      port map (I0=>B1,
                I1=>A1,
                O=>XLXN_6);
   
   XLXI_4 : XOR2
      port map (I0=>B2,
                I1=>A2,
                O=>XLXN_16);
   
   XLXI_5 : XOR2
      port map (I0=>XLXN_16,
                I1=>P,
                O=>S2);
   
   XLXI_6 : OR2
      port map (I0=>XLXN_18,
                I1=>XLXN_17,
                O=>S3);
   
   XLXI_8 : AND2
      port map (I0=>A2,
                I1=>B2,
                O=>XLXN_18);
   
   XLXI_9 : AND2
      port map (I0=>XLXN_16,
                I1=>P,
                O=>XLXN_17);
   
end BEHAVIORAL;


