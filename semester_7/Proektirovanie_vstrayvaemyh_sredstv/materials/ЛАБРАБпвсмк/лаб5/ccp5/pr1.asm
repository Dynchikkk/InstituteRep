	;режим сравнения в CCP1
;таймер TMR1 считает число циклов выполнения команд (f/4)
;на выходе RC2 формируется импульс задаваемой в CCPR1L и CCPR1H длительности
; в циклах F/4 или с учётом внешнего сигнала таймера
	list p=16F887
	include "p16F887.inc"
ct1	EQU 0x20
ct2	EQU 0x21
ct3	EQU 0x22
	org 0x00
	 goto start

start 	
;задаём состояние CCPR1L и CCPR1H
		
	movlw 0x30
	movwf CCPR1L
	movlw 0x00
	movwf CCPR1H
;программируем RC2 и PORTD на вывод
	banksel TRISC
	bcf TRISC,2
	bsf TRISC,3 ; используем для запуска
	clrf TRISD
	banksel CCPR1L
	;сбрасываем TMR1 и задаём его режим с внутренним генератором	
	clrf TMR1L
	clrf TMR1H
	clrf T1CON
	clrf PIR1 ;сигнал прерывания в ноль
m3	btfsc PORTC,3
	goto m3
 m1	btfss PORTC,3
	goto m1
	movlw 0x09
	movwf CCP1CON ;режим сравнения запущен
	bsf T1CON,0 ; вкл таймера
 m2	btfss PIR1,2
	goto m2
	movlw 0x00
	movwf CCP1CON ;останов CCP1
	bsf T1CON,0 ; выкл таймера
	nop
	goto start
	end
	



