--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test52.vhw
-- /___/   /\     Timestamp : Sun Sep 22 19:27:18 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test52
--Device: Xilinx
--

library UNISIM;
use UNISIM.Vcomponents.ALL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY test52 IS
END test52;

ARCHITECTURE testbench_arch OF test52 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT list5
        PORT (
            X1 : In std_logic;
            X2 : In std_logic;
            X3 : In std_logic;
            X4 : In std_logic;
            Y1 : Out std_logic;
            Y2 : Out std_logic;
            Y3 : Out std_logic;
            Y4 : Out std_logic;
            Y13 : Out std_logic;
            Y14 : Out std_logic;
            Y15 : Out std_logic;
            Y16 : Out std_logic
        );
    END COMPONENT;

    SIGNAL X1 : std_logic := '0';
    SIGNAL X2 : std_logic := '0';
    SIGNAL X3 : std_logic := '0';
    SIGNAL X4 : std_logic := '0';
    SIGNAL Y1 : std_logic := '0';
    SIGNAL Y2 : std_logic := '0';
    SIGNAL Y3 : std_logic := '0';
    SIGNAL Y4 : std_logic := '0';
    SIGNAL Y13 : std_logic := '0';
    SIGNAL Y14 : std_logic := '0';
    SIGNAL Y15 : std_logic := '0';
    SIGNAL Y16 : std_logic := '0';

    BEGIN
        UUT : list5
        PORT MAP (
            X1 => X1,
            X2 => X2,
            X3 => X3,
            X4 => X4,
            Y1 => Y1,
            Y2 => Y2,
            Y3 => Y3,
            Y4 => Y4,
            Y13 => Y13,
            Y14 => Y14,
            Y15 => Y15,
            Y16 => Y16
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                X4 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                X3 <= '1';
                X4 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                X4 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                X3 <= '0';
                X4 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                X1 <= '1';
                X2 <= '1';
                X3 <= '1';
                X4 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                X4 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                X3 <= '0';
                X4 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                X4 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                X1 <= '0';
                X2 <= '0';
                WAIT FOR 100 ns;

            END PROCESS;

    END testbench_arch;

