;**********************************************************************
 

	list      p=16F876            ; list directive to define processor
	#include <p16F876.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_ON & _PWRTE_ON & _RC_OSC



;***** proba 1 - model invertora



;**********************************************************************
; Адрес расположения ct1 - 0x10, а ct2 - 0x011
	UDATA	0x10
ct1 RES 1	;бронируется место для ct1 в один байт   
ct2 RES 1	;место для ct2



RESET_VECTOR  CODE    0x000       ; processor reset vector
	goto start


Main CODE
start
     bsf       STATUS,RP0
     clrf      TRISC          ; Make PortD all output
	 bcf       STATUS,RP0
         
     movlw     0x12           ; 
     movwf     PORTC
     clrf      ct1
	 clrf      ct2
c1	incfsz ct1,1
	goto c1
	incfsz ct2,1
	goto c1
	rlf PORTC,1

	goto c1
	end ; 

