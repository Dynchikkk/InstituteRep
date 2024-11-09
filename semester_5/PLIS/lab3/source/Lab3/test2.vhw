--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test2.vhw
-- /___/   /\     Timestamp : Sun Oct 20 22:15:28 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test2
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test2 IS
END test2;

ARCHITECTURE testbench_arch OF test2 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT p2
        PORT (
            clk : In std_logic;
            reset : In std_logic;
            a : In std_logic_vector (3 DownTo 0);
            b : In std_logic_vector (3 DownTo 0);
            sum : Out std_logic_vector (3 DownTo 0);
            carry_out : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL a : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL b : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sum : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL carry_out : std_logic := '0';

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : p2
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
                -- -------------  Current Time:  15ns
                WAIT FOR 15 ns;
                a <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  135ns
                WAIT FOR 120 ns;
                a <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  195ns
                WAIT FOR 60 ns;
                a <= "0001";
                b <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  315ns
                WAIT FOR 120 ns;
                a <= "0000";
                b <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  375ns
                WAIT FOR 60 ns;
                a <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  435ns
                WAIT FOR 60 ns;
                b <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  495ns
                WAIT FOR 60 ns;
                a <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  675ns
                WAIT FOR 180 ns;
                a <= "1000";
                b <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  855ns
                WAIT FOR 180 ns;
                b <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  915ns
                WAIT FOR 60 ns;
                a <= "0000";
                -- -------------------------------------
                -- -------------  Current Time:  1035ns
                WAIT FOR 120 ns;
                b <= "0000";
                -- -------------------------------------
                WAIT FOR 1025 ns;

            END PROCESS;

    END testbench_arch;

