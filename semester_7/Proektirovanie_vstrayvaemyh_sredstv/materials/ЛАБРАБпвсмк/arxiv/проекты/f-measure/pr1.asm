	;частотомер с выходом на PORTD, с запуском
; от кнопки на входе RB0
;таймер TMR1 считает число циклов  (f/4) 
	list p=16F887
	include "p16F887.inc"
	UDATA
ct1	res 1
ct2	res 1
ct3	res 1
	org 0x00
	 goto start

start 	
	bsf STATUS,5 ;RD на вывод информации
	clrf TRISD
	bsf TRISB,0
	bcf STATUS,5
	banksel ANSELH
	bcf ANSELH,4
	banksel TMR1	
 m3	movlw 0x03 ;задание интервала времени измерени€ 1мс или 1сек
;используютс€ две переменные ct1 и ct2
	movwf ct1	 
	movlw 0x06
	movwf ct2
;задание режима таймера. —чЄт циклов, нет предделител€, выключен
;сброс таймера в ноль
	clrf T1CON
	clrf TMR1H
	clrf TMR1L
 m1 btfsc PORTB,0
	goto m1
 m2 btfss PORTB,0
	goto m2
	bsf T1CON,0
 m4 
	clrWDT
	decfsz ct1
	goto m4
	movwf ct1	 
	movlw 0x03
	decfsz ct2
	goto m4
	bcf T1CON,0 ;TMR1 stop
	movf TMR1L,0
	movwf PORTD
	goto m3		 
	end 	







