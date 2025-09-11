;**********************************************************************


	#include <p16F887.inc>        ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V



;таймер 0 без предделителя

;**********************************************************************
RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start
	CODE    0x004
	goto m2
MAIN	CODE
start bsf STATUS, 5	;банк памяти 01
	movlw 0x38
	movwf OPTION_REG
	clrf TRISD
	movlw 0x1f
	movwf TRISA 
	bcf STATUS, 5
	movlw 0xA0
	movwf INTCON
	movlw 0xF6
	movwf TMR0
m1  movf TMR0,0
	movwf PORTD
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

