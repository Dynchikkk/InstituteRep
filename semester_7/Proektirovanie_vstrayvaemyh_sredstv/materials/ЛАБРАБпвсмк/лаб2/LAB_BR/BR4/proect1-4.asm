;**********************************************************************
;   This file is a basic code template for assembly code generation   *
;   on the PICmicro PIC16F84A. 

	list      p=16F876            ; list directive to define processor
	#include <p16F876.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC



;***** proba 1 - model invertora


INT_VAR       UDATA     0x0C   




;**********************************************************************
RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start

MAIN	CODE
start
	bsf STATUS,RP0
	movlw B'11001100'
	movwf TRISC
	bcf STATUS,RP0
m3	bcf PORTC,1
m1	clrwdt
	btfsc PORTC,6
	goto m1
	bsf PORTC,1
m2	clrwdt
	btfss PORTC,6
	goto m2
	goto m3

		END                     ; directive 'end of program'

