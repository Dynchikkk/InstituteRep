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
-- /___/   /\     Timestamp : Sun Oct 20 21:58:57 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test3
--Device: Xilinx
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.TEXTIO.ALL;

ENTITY test3 IS
END test3;

ARCHITECTURE testbench_arch OF test3 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT p3
        PORT (
            clk : In std_logic;
            reset : In std_logic;
            up_down : In std_logic;
            count : Out std_logic_vector (7 DownTo 0)
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL up_down : std_logic := '0';
    SIGNAL count : std_logic_vector (7 DownTo 0) := "00000000";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : p3
        PORT MAP (
            clk => clk,
            reset => reset,
            up_down => up_down,
            count => count
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
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                up_down <= '1';
                -- -------------------------------------
                WAIT FOR 2115 ns;

            END PROCESS;

    END testbench_arch;

