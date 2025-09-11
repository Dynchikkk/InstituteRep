
; управление светодиодами порта D.— частотой примерно 1√ц
;организуетс€ сдвиг с младшего разр€да к старшему 
;единицы через —.
; 


#include <p16f887.inc>
	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

  ; јдрес расположени€ ct1 - 0x10, а ct2 - 0x011
	UDATA	0x10
ct1 RES 1	;бронируетс€ место дл€ ct1 в один байт   
ct2 RES 1	;место дл€ ct2



     org       0x0000
STARTUP:
    
     goto      Main

	org       0x0004             ; interrupt vector location
     ; (not used)

Main:

     bsf       STATUS,RP0
     clrf      TRISD          ; Make PortD all output
	 bcf       STATUS,RP0
         
     movlw     0x12           ; 
     movwf     PORTD
     clrf      ct1
	 clrf      ct2
c1	incfsz ct1,1
	goto c1
	incfsz ct2,1
	goto c1
	rlf PORTD,1

	goto c1
	end

