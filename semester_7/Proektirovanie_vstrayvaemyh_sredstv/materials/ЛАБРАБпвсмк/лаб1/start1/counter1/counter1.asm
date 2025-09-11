
	#include <p16F876.inc>        ; processor specific variable definitions

;слово состояния контроллера:	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

;********************************
; определим переменные
ct1	EQU	0x00 

reset	 CODE  0x000     ; вектор сброса
 		goto    start             ; go to beginning of program

	CODE ; Начало основной программы
start
       	movlw 0x10
		movwf ct1 
m1		;decf ct1,0
		decfsz ct1,1
		goto m1
		goto start
		end


