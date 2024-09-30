--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test12.vhw
-- /___/   /\     Timestamp : Sun Sep 29 17:58:27 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test12
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test12 IS
END test12;

ARCHITECTURE testbench_arch OF test12 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT list1
        PORT (
            clk : In std_logic;
            x1 : In std_logic;
            x2 : In std_logic;
            x3 : In std_logic;
            y : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL x1 : std_logic := '0';
    SIGNAL x2 : std_logic := '0';
    SIGNAL x3 : std_logic := '0';
    SIGNAL y : std_logic := '0';

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : list1
        PORT MAP (
            clk => clk,
            x1 => x1,
            x2 => x2,
            x3 => x3,
            y => y
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
                -- -------------  Current Time:  15ns
                WAIT FOR 15 ns;
                x1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  75ns
                WAIT FOR 60 ns;
                x1 <= '0';
                x2 <= '1';
                x3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  135ns
                WAIT FOR 60 ns;
                x2 <= '0';
                x3 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  195ns
                WAIT FOR 60 ns;
                x1 <= '1';
                x3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  255ns
                WAIT FOR 60 ns;
                x2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  315ns
                WAIT FOR 60 ns;
                x2 <= '0';
                x3 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  375ns
                WAIT FOR 60 ns;
                x1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  435ns
                WAIT FOR 60 ns;
                x1 <= '1';
                x2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  495ns
                WAIT FOR 60 ns;
                x1 <= '0';
                x2 <= '0';
                -- -------------------------------------
                WAIT FOR 565 ns;

            END PROCESS;

    END testbench_arch;

