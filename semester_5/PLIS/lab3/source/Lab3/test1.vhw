--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test1.vhw
-- /___/   /\     Timestamp : Sun Oct 20 22:24:04 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test1
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY test1 IS
END test1;

ARCHITECTURE testbench_arch OF test1 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT p1
        PORT (
            clk : In std_logic;
            reset : In std_logic;
            signal_out : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL signal_out : std_logic := '0';

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : p1
        PORT MAP (
            clk => clk,
            reset => reset,
            signal_out => signal_out
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
                -- -------------  Current Time:  495ns
                WAIT FOR 495 ns;
                reset <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  615ns
                WAIT FOR 120 ns;
                reset <= '0';
                -- -------------------------------------
                WAIT FOR 1445 ns;

            END PROCESS;

    END testbench_arch;
