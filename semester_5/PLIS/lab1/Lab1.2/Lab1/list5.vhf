--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : list5.vhf
-- /___/   /\     Timestamp : 09/22/2024 19:25:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family xc9500 -flat -suppress -w Z:/Lab11/Lab1/list5.sch list5.vhf
--Design Name: list5
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

entity list5 is
   port ( X1  : in    std_logic; 
          X2  : in    std_logic; 
          X3  : in    std_logic; 
          X4  : in    std_logic; 
          Y1  : out   std_logic; 
          Y2  : out   std_logic; 
          Y3  : out   std_logic; 
          Y4  : out   std_logic; 
          Y13 : out   std_logic; 
          Y14 : out   std_logic; 
          Y15 : out   std_logic; 
          Y16 : out   std_logic);
end list5;

architecture BEHAVIORAL of list5 is
   attribute BOX_TYPE   : string ;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND4B4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B4 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
begin
   XLXI_25 : AND4
      port map (I0=>X4,
                I1=>X3,
                I2=>X2,
                I3=>X1,
                O=>Y1);
   
   XLXI_26 : AND4B1
      port map (I0=>X4,
                I1=>X3,
                I2=>X2,
                I3=>X1,
                O=>Y2);
   
   XLXI_27 : AND4B1
      port map (I0=>X3,
                I1=>X4,
                I2=>X2,
                I3=>X1,
                O=>Y3);
   
   XLXI_40 : AND4B4
      port map (I0=>X1,
                I1=>X2,
                I2=>X3,
                I3=>X4,
                O=>Y16);
   
   XLXI_49 : AND4B2
      port map (I0=>X4,
                I1=>X3,
                I2=>X2,
                I3=>X1,
                O=>Y4);
   
   XLXI_53 : AND4B2
      port map (I0=>X1,
                I1=>X2,
                I2=>X3,
                I3=>X4,
                O=>Y13);
   
   XLXI_54 : AND4B3
      port map (I0=>X1,
                I1=>X2,
                I2=>X4,
                I3=>X3,
                O=>Y14);
   
   XLXI_56 : AND4B3
      port map (I0=>X1,
                I1=>X2,
                I2=>X3,
                I3=>X4,
                O=>Y15);
   
end BEHAVIORAL;


