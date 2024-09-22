--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : list1.vhf
-- /___/   /\     Timestamp : 09/15/2024 19:27:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family xc9500 -flat -suppress -w Z:/Lab1/list1.sch list1.vhf
--Design Name: list1
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

entity FD_MXILINX_list1 is
   port ( C : in    std_logic; 
          D : in    std_logic; 
          Q : out   std_logic);
end FD_MXILINX_list1;

architecture BEHAVIORAL of FD_MXILINX_list1 is
   attribute BOX_TYPE   : string ;
   signal XLXN_4 : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDCP
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             PRE : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCP : component is "BLACK_BOX";
   
begin
   I_36_43 : GND
      port map (G=>XLXN_4);
   
   U0 : FDCP
      port map (C=>C,
                CLR=>XLXN_4,
                D=>D,
                PRE=>XLXN_4,
                Q=>Q);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity list1 is
   port ( CLK : in    std_logic; 
          X1  : in    std_logic; 
          X2  : in    std_logic; 
          X3  : in    std_logic; 
          Y   : out   std_logic);
end list1;

architecture BEHAVIORAL of list1 is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_58 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_64 : std_logic;
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component FD_MXILINX_list1
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_12 : label is "XLXI_12_0";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_1";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_2";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_3";
begin
   XLXI_1 : AND2B2
      port map (I0=>XLXN_62,
                I1=>XLXN_58,
                O=>XLXN_9);
   
   XLXI_2 : AND3B1
      port map (I0=>XLXN_64,
                I1=>XLXN_62,
                I2=>XLXN_58,
                O=>XLXN_10);
   
   XLXI_3 : AND3B2
      port map (I0=>XLXN_64,
                I1=>XLXN_58,
                I2=>XLXN_62,
                O=>XLXN_11);
   
   XLXI_4 : OR3
      port map (I0=>XLXN_11,
                I1=>XLXN_10,
                I2=>XLXN_9,
                O=>XLXN_40);
   
   XLXI_12 : FD_MXILINX_list1
      port map (C=>CLK,
                D=>XLXN_40,
                Q=>Y);
   
   XLXI_18 : FD_MXILINX_list1
      port map (C=>CLK,
                D=>X1,
                Q=>XLXN_58);
   
   XLXI_19 : FD_MXILINX_list1
      port map (C=>CLK,
                D=>X2,
                Q=>XLXN_62);
   
   XLXI_20 : FD_MXILINX_list1
      port map (C=>CLK,
                D=>X3,
                Q=>XLXN_64);
   
end BEHAVIORAL;


