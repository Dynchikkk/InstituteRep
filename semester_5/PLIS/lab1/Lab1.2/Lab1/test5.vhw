--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test5.vhw
-- /___/   /\     Timestamp : Mon Sep 16 13:57:16 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test5
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

ENTITY test5 IS
END test5;

ARCHITECTURE testbench_arch OF test5 IS
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

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

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

        PROCESS    -- clock process for X1
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                X1 <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                X1 <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  235ns
                WAIT FOR 235 ns;
                X2 <= '1';
                -- -------------------------------------
                WAIT FOR 825 ns;

            END PROCESS;

    END testbench_arch;

