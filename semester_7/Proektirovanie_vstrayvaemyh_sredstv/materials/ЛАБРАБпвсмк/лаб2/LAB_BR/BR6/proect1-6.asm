;**********************************************************************
;   This file is a basic code template for assembly code generation   *
;   on the PICmicro PIC16F84A. 

	list      p=16F876            ; list directive to define processor
	#include <p16F876.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC



;**********************************************************************
RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start

MAIN	CODE
start
	bsf STATUS,RP0
	movlw 0x33
	movwf TRISB
	bcf STATUS,RP0
m3	bcf PORTB,3
m1	clrwdt
	btfsc PORTB,5
	goto m1
	bsf PORTB,3
m2	clrwdt
	btfss PORTB,5
	goto m2
	goto m3

		END                     ; directive 'end of program'

