;**********************************************************************

;
	#include <p16F887.inc>        ; processor specific variable definitions

;	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; Обычный сегмент данных
	UDATA	
count	RES 1	; Один байт счетчика для паузы

;**********************************************************************
; Вектор сброса
reset	 CODE  0x000     ; processor reset vector
 		goto    start             ; go to beginning of program

; Начало основной программы

start	

;АЦП
		banksel ADCON1
		movlw 0x00
		movwf ADCON1	;левый сдвиг результата в регистрах ADRESH и 
; и ADRESL. старшие разряды 10-разрядного результата окажутся 
;в регистре ADRESH
		banksel TRISA
		bsf TRISA,0; нулевой разряд порта A ориентируем на ввод
		clrf TRISD	; регистр D настраиваем на вывод
		banksel ANSEL	;регистры ANSEL и ANSELH настраиваем так, 
;чтобы только нулевой канал АЦП был ориентирован на приём аналогового сигнала
		movlw 0x01
		movwf ANSEL

		banksel ANSELH
		movlw 0x00
		movwf ANSELH

		banksel ADCON0
		movlw 0x81
		movwf ADCON0	;частота синхронизации АЦП равна Fosc/32, включается питание АЦП

	m2
;		banksel count		;задержка для включения АЦП
;		movlw 0x10
;		movwf count
;delay	decfsz count,1
		;goto delay

		banksel ADCON0
		bsf ADCON0,1		;запуск АЦП
	
	m1
		btfsc ADCON0,1		;ожидание окончания преобразования
		goto m1
			
		banksel ADRESH	;посылка старших разрядов в порт D
		movf ADRESH,0
		movwf PORTD
		goto m2		;повторение измерения
		end

