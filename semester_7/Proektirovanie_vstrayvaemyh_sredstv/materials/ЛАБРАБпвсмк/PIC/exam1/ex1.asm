;**********************************************************************
; Организуем прерывание по входу RB0, по нарастающему фронту
;  По этому прерыванию в соседний разряд порта выдаем импульс

	#include <p16F876.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; Обычный сегмент данных
myvar	UDATA	0x20

count	RES 1	; Один байт счетчика для паузы

; Сегмент данных, видимый из всех сегментов
shrvar UDATA_SHR
w_temp      RES 1	; Для сохранения W
status_temp RES 1   ; Для сохранения регистра STATUS

;**********************************************************************
; Вектор сброса
reset	 CODE  0x000     ; processor reset vector
 		goto    start             ; go to beginning of program

; Вектор прерывания
intvector CODE 0x04
		goto interrupt

	CODE
; Начало основной программы
start
		bsf STATUS,RP0
		movlw B'11111101'
		movwf TRISB	     ;ориентация порта B 
		bcf STATUS,RP0
; Настраиваем фронт прерывания
        movlw B'11000000'
        bsf STATUS,RP0
        movwf OPTION_REG
        bcf STATUS,RP0
; Настраиваем прерывание и разрешаем прерывания вообще
        movlw B'10010000'
		movwf INTCON
; Все настроено - основная программа

maincycle
 		clrwdt
		goto maincycle

; Процедура обработки прерывания
interrupt
; Сохраняем W и STATUS
		movwf   w_temp            ; save off current W register contents
		movf	STATUS,w          ; move status register into W register
		movwf	status_temp       ; save off contents of STATUS register
; Переключаемся на страницу данных, содержащую переменные прерывания
        bcf STATUS,RP0
; Проверяем, есть ли прерывания от входа
		btfss INTCON,1
		goto notinterrupt	; Нет, это не от входа
; Да, это прерывание от входа
		bcf INTCON,1	 	; Сбрасываем флаг прерывания
; Формируем импульс
		bsf PORTB,1
; Задержка в 5*значение тактов
		movlw .10		
		movwf count
delclk
		nop
		nop
		decfsz count,1
		goto delclk
		bcf PORTB,1
; Прерывание закончилось
notinterrupt
; Тут, если нужно, прерывания от других источников
; ...
; восстанавливаем регистры	
		movf    status_temp,w     ; retrieve copy of STATUS register
		movwf	STATUS            ; restore pre-isr STATUS register contents
		swapf   w_temp,f
		swapf   w_temp,w          ; restore pre-isr W register contents
		retfie                    ; return from interrupt
		
		END                     ; directive 'end of program'

	
