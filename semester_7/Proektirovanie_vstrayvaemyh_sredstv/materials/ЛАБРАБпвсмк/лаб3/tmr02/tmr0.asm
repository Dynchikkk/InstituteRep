;**********************************************************************


	#include <p16F84.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC

;таймер 0 без предделителя

;**********************************************************************
RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start
	CODE    0x004
	goto m2
MAIN	CODE
start bsf STATUS, 5	;банк памяти 01
	movlw 0x08
	movwf OPTION_REG

	bcf STATUS, 5
	movlw 0xA0
	movwf INTCON
	movlw 0xF6
	movwf TMR0
m1  NOP
	goto m1
m2 	movlw 0xA0
	movwf INTCON
	movlw 0xF6
	movwf TMR0
	RETURN
	END 
;-таймер суммирует или вычитает?
;-до скольки считает таймер? проверьте его поведение при каждой 
;очередной команде цикла m1
;-какое число импульсов воспринимает таймер при 
;выполнении команд NOP и goto?
;-

