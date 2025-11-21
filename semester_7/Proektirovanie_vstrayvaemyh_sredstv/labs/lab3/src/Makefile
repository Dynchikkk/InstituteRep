# MPLAB IDE generated this makefile for use with GNU make.
# Project: lab3.mcp
# Date: Sat Nov 02 14:02:55 2024

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

lab3.cof : prog3.o
	$(CC) "16f887_g.lkr" "prog3.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"lab3.cof" /M"lab3.map" /W

prog3.o : prog3.asm ../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/p16f887.inc
	$(AS) /q /p16F887 "prog3.asm" /l"prog3.lst" /e"prog3.err" /o"prog3.o" /d__DEBUG=1

clean : 
	$(CC) "prog3.o" "prog3.err" "prog3.lst" "lab3.cof" "lab3.hex"

