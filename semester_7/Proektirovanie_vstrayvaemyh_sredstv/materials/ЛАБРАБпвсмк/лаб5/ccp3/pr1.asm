	;захват с целью измерени€ длительности импульса на входе RC2
;таймер TMR1 считает число циклов выполнени€ команд (f/4) с момента 
;по€влени€ 1 на входе RC2 и запускаетс€ CCP1 в режиме захвата 
	list p=16F887
	include "p16F887.inc"

	org 0x00
	 goto start
	;org 0x08
start 	
	banksel CCPR1L	;reset CCPR
	clrf CCPR1L	
	clrf CCPR1H
	banksel TMR1	;reset TMR1, PIR1, T1CON
	clrf TMR1
	banksel PIR1
	clrf PIR1
	banksel TRISC
	bsf TRISC,2
	clrf TRISD
	banksel T1CON
	clrf T1CON ;предделитель отключен, синх TMR1 внутренн€€, ждЄт
	nop
 m1 btfss PORTC,2	;RC2=1?, проверка начала импульса на входе RC2
	goto m1
	banksel T1CON
	bsf T1CON,0 ; start TMR1
	banksel CCP1CON
	bsf CCP1CON,2 ;start CCP1 
 m2	btfss PIR1,2 ;CCP следит за спадающим фронтом входаRC2. наличие
	;этого фронта вызывает формировани€ признака прерывани€ PIR2
	; “о есть окончание импульса на входе RC2 останавливает модуль, 
	;заставл€€ переписать TMR1 в CCPR.
	goto m2	
	banksel T1CON
	bcf T1CON,0 ; stop TMR1
	banksel CCP1CON
	clrf CCP1CON ;stop CCP1 
	movf CCPR1L,0
	movwf PORTD 
	nop
	end

