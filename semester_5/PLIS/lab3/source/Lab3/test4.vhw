--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : test4.vhw
-- /___/   /\     Timestamp : Sun Oct 20 22:02:17 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test4
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.TEXTIO.ALL;

ENTITY test4 IS
END test4;

ARCHITECTURE testbench_arch OF test4 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT p4
        PORT (
            clk : In std_logic;
            enable : In std_logic;
            reset : In std_logic;
            carry_out : Out std_logic;
            count : Out std_logic_vector (4 DownTo 0)
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL enable : std_logic := '0';
    SIGNAL reset : std_logic := '0';
    SIGNAL carry_out : std_logic := '0';
    SIGNAL count : std_logic_vector (4 DownTo 0) := "00000";

    constant PERIOD : time := 60 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : p4
        PORT MAP (
            clk => clk,
            enable => enable,
            reset => reset,
            carry_out => carry_out,
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
                -- -------------  Current Time:  375ns
                WAIT FOR 375 ns;
                enable <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1155ns
                WAIT FOR 780 ns;
                enable <= '0';
                -- -------------------------------------
                WAIT FOR 905 ns;

            END PROCESS;

    END testbench_arch;

