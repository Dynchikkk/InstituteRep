--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test3.vhw
-- /___/   /\     Timestamp : Sun Sep 15 19:27:24 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test3
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

ENTITY test3 IS
END test3;

ARCHITECTURE testbench_arch OF test3 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT list3
        PORT (
            X1 : In std_logic;
            X2 : In std_logic;
            A0 : Out std_logic;
            A1 : Out std_logic;
            A2 : Out std_logic;
            A3 : Out std_logic
        );
    END COMPONENT;

    SIGNAL X1 : std_logic := '0';
    SIGNAL X2 : std_logic := '0';
    SIGNAL A0 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL A2 : std_logic := '0';
    SIGNAL A3 : std_logic := '0';

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : list3
        PORT MAP (
            X1 => X1,
            X2 => X2,
            A0 => A0,
            A1 => A1,
            A2 => A2,
            A3 => A3
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
                -- -------------  Current Time:  175ns
                WAIT FOR 175 ns;
                X2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  295ns
                WAIT FOR 120 ns;
                X2 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  415ns
                WAIT FOR 120 ns;
                X2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  475ns
                WAIT FOR 60 ns;
                X2 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  535ns
                WAIT FOR 60 ns;
                X2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  595ns
                WAIT FOR 60 ns;
                X2 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  655ns
                WAIT FOR 60 ns;
                X2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  715ns
                WAIT FOR 60 ns;
                X2 <= '0';
                -- -------------------------------------
                WAIT FOR 345 ns;

            END PROCESS;

    END testbench_arch;

