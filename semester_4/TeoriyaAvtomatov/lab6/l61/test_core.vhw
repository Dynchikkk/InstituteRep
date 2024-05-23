--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test_core.vhw
-- /___/   /\     Timestamp : Thu May 23 23:49:06 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test_core
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test_core IS
END test_core;

ARCHITECTURE testbench_arch OF test_core IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT core
        PORT (
            clk : In std_logic;
            x : In std_logic_vector (3 DownTo 0);
            y : Out std_logic_vector (4 DownTo 0);
            ye : Out std_logic_vector (2 DownTo 1);
            yk : Out std_logic_vector (4 DownTo 0);
            yf6 : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL x : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL y : std_logic_vector (4 DownTo 0) := "00000";
    SIGNAL ye : std_logic_vector (2 DownTo 1) := "00";
    SIGNAL yk : std_logic_vector (4 DownTo 0) := "00000";
    SIGNAL yf6 : std_logic := '0';

    constant PERIOD : time := 100 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : core
        PORT MAP (
            clk => clk,
            x => x,
            y => y,
            ye => ye,
            yk => yk,
            yf6 => yf6
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  35ns
                WAIT FOR 35 ns;
                x <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  235ns
                WAIT FOR 200 ns;
                x <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  435ns
                WAIT FOR 200 ns;
                x <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  635ns
                WAIT FOR 200 ns;
                x <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  835ns
                WAIT FOR 200 ns;
                x <= "0000";
                -- -------------------------------------
                WAIT FOR 265 ns;

            END PROCESS;

    END testbench_arch;

