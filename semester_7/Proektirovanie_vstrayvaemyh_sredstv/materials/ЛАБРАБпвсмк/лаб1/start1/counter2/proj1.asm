
	#include <p16F876.inc>        ; processor specific variable definitions


;********************************
; Вектор сброса
reset	 CODE  0x000     ; processor reset vector
 		goto    start             ; go to beginning of program



	CODE ; Начало основной программы
start
        bsf STATUS,RP0
		movlw 0x00
		movwf TRISB
        bcf STATUS,RP0		
		movlw 0x06
		movwf PORTB	  
m1		decfsz PORTB,1
		goto m1
		goto start
		end


