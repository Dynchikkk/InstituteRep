--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : tb1.vhw
-- /___/   /\     Timestamp : Mon Sep 15 10:36:00 2025
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tb1
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb1 IS
END tb1;

ARCHITECTURE testbench_arch OF tb1 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT picoblaze_top
        PORT (
            clk : In std_logic;
            vh : In std_logic_vector (7 DownTo 0);
            rez_beg : Out std_logic;
            vih : Out std_logic_vector (7 DownTo 0)
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL vh : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL rez_beg : std_logic := '0';
    SIGNAL vih : std_logic_vector (7 DownTo 0) := "00000000";

    constant PERIOD : time := 20 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : picoblaze_top
        PORT MAP (
            clk => clk,
            vh => vh,
            rez_beg => rez_beg,
            vih => vih
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
                -- -------------  Current Time:  5ns
                WAIT FOR 5 ns;
                vh <= "00000001";
                -- -------------------------------------
                -- -------------  Current Time:  305ns
                WAIT FOR 300 ns;
                vh <= "00000011";
                -- -------------------------------------
                -- -------------  Current Time:  605ns
                WAIT FOR 300 ns;
                vh <= "00000100";
                -- -------------------------------------
                WAIT FOR 415 ns;

            END PROCESS;

    END testbench_arch;

