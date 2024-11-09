--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test22.vhw
-- /___/   /\     Timestamp : Sun Oct 20 22:18:46 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test22
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test22 IS
END test22;

ARCHITECTURE testbench_arch OF test22 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT p22
        PORT (
            clk : In std_logic;
            reset : In std_logic;
            a : In std_logic_vector (15 DownTo 0);
            b : In std_logic_vector (15 DownTo 0);
            sum : Out std_logic_vector (15 DownTo 0);
            carry_out : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL a : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL b : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL sum : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL carry_out : std_logic := '0';

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : p22
        PORT MAP (
            clk => clk,
            reset => reset,
            a => a,
            b => b,
            sum => sum,
            carry_out => carry_out
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
                WAIT FOR 2060 ns;

            END PROCESS;

    END testbench_arch;

