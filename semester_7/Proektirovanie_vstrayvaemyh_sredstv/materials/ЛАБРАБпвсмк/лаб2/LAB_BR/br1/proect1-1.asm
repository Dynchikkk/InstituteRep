;**********************************************************************
 

	list      p=16F876            ; list directive to define processor
	#include <p16F876.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC



;***** proba 1 - model invertora



;**********************************************************************
RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start

MAIN	CODE
start
	bsf STATUS,RP0
	movlw 0x07
	movwf TRISB
	bcf STATUS,RP0
m3	bcf PORTB,7
m1	clrwdt
	btfsc PORTB,2
	goto m1

	bsf PORTB,7
m2	clrwdt
	btfss PORTB,2
	goto m2
	goto m3

		END                     ; 

