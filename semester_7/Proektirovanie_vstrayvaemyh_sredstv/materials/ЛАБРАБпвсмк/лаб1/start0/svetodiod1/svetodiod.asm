
; управление светодиодами порта D.С частотой примерно 1Гц
;организуется сдвиг с младшего разряда к старшему 
;единицы через С.
; 


#include <p16f887.inc>
	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

  ; Адрес расположения ct1 - 0x10, а ct2 - 0x11. используются
;для организации задержки на 64 тысячи циклов при необходимости
	UDATA	0x10
ct1 RES 1	;бронируется место для ct1 в один байт   
ct2 RES 1	;место для ct2



     org       0x0000
STARTUP:
    
     goto      Main

	org       0x0004             ; interrupt vector location
     ; (not used)

Main:

     bsf       STATUS,RP0
     clrf      TRISD          ; Make PortD all output
	 bcf       STATUS,RP0
         
     movlw     0x11           ; 
	movwf     PORTD

	nop

	end

