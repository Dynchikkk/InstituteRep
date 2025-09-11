	;шим с выходом на втором разряде порта C
;таймер TMR2 считает число циклов выполнения команд (f/4) 
	list p=16F887
	include "p16F887.inc"
ct1	EQU 0x20
ct2	EQU 0x21
ct3	EQU 0x22
	org 0x00
	 goto start
	;org 0x08
start 	

	movlw 0x30
	movwf ct2	 
	movwf CCPR1L;задаётся длительность импульса
	bsf STATUS,5
	movlw 0x60
	movwf PR2;задаётся период
	bcf TRISC,2

	movlw 0x08 
	movwf TRISD ; portd 
	bcf STATUS,5
	bsf PORTD,2	
	bcf PORTD,2
	bsf PORTD,2		
	movlw 0x04
	movwf T2CON;бит 2 разрешает работу таймера, биты 1,0 - 
; предделитель,если 00 - 1:1, если 01 - 1:4, если 1х - 1:16
;биты 6-3 - выходной делитель. Если 0000 - 1:1, если 0001 - 1:2, 
; и далее до 1111 - 1:16
	movlw 0x0c;биты 3-0 определяют режим работы CCP1
; если 1100 = ch, то разрешается режим ШИМ
	movwf CCP1CON

m1	movlw 0x30
	movwf ct2
m2	movf ct2,0

	movwf CCPR1L;задаётся длительность импульса
	movlw 0x02 ; число повторений
	movwf ct1
loop clrwdt
	btfsc PORTC,2
	bsf PORTD,0
	btfss PORTC,2
	bcf PORTD,0
	decfsz ct1,1
	goto loop
	;decfsz ct3,1
	;goto loop
	decfsz ct2,1
	goto m2
	goto m1
	
	end
