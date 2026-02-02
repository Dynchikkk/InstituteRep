;**********************************************************************
    #include <p16F887.inc>

	__CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_OFF&_INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

myvar    UDATA    0x20
count    RES 1    ; Для паузы

shrvar UDATA_SHR
w_temp      RES 1
status_temp RES 1
temp_portb 	RES 1  ; Для сохранения состояния PORTB
prev_portb 	RES 1 
;**********************************************************************
reset     CODE    0x000
    goto    start

intvector CODE 0x04
    goto interrupt

    CODE

start
    ; Настройка порта B
    bsf STATUS,RP0
    movlw B'11111111'    ; RB0 - входы
    movwf TRISB

	banksel ANSEL
	clrf ANSEL
	banksel ANSELH
	clrf ANSELH

;настройка PORTD[7/0] на вывод информации
	banksel TRISD
	movlw 0x00
	movwf TRISD

    movlw B'01000000'    ; Настройки прерываний
    movwf OPTION_REG


	banksel IOCB
    movlw B'11110000'    ; Включить IOC для RB7, RB6, RB5, RB4
    movwf IOCB
    
	banksel PORTD
    clrf PORTD
    ;movf PORTB, 0       ; Читаем PORTB для инициализации
    
	bcf STATUS,RP0	
    ; Настройка прерываний
    movlw B'10001000'    ; Разрешить все прерывания и RB4-RB7
    movwf INTCON
    ; Очищаем флаг прерывания PORTB
    bcf     INTCON, RBIF

maincycle
    nop
    clrwdt
    goto maincycle

; Обработка прерывания
interrupt
    movwf   w_temp
    movf    STATUS,w
    movwf   status_temp
    
    btfss INTCON, 0
    goto not_rb_int

    movf    PORTB, w     ; Читаем порт в W
    movwf   temp_portb   ; Сохраняем в переменную

    bcf     INTCON, 0    ; Сбросить флаг RBIF

; Определяем задние фронты на каждом пине отдельно
    ; RB4 -> RD4
    btfss   prev_portb, 4    ; Предыдущее состояние RB4 было 1?
    goto    check_rb5
    btfsc   temp_portb, 4    ; Текущее состояние RB4 стало 0?
    goto    check_rb5
    bsf     PORTD, 4         ; Генерируем импульс на RD4
    movlw   .5
    movwf   count
delay_rb4:
    nop
    decfsz  count, f
    goto    delay_rb4
    bcf     PORTD, 4
    
check_rb5:
    ; RB5 -> RD5
    btfss   prev_portb, 5
    goto    check_rb6
    btfsc   temp_portb, 5
    goto    check_rb6
    bsf     PORTD, 5
    movlw   .5
    movwf   count
delay_rb5:
    nop
    decfsz  count, f
    goto    delay_rb5
    bcf     PORTD, 5
    
check_rb6:
    ; RB6 -> RD6
    btfss   prev_portb, 6
    goto    check_rb7
    btfsc   temp_portb, 6
    goto    check_rb7
    bsf     PORTD, 6
    movlw   .5
    movwf   count
delay_rb6:
    nop
    decfsz  count, f
    goto    delay_rb6
    bcf     PORTD, 6
    
check_rb7:
    ; RB7 -> RD7
    btfss   prev_portb, 7
    goto    update_prev
    btfsc   temp_portb, 7
    goto    update_prev
    bsf     PORTD, 7
    movlw   .5
    movwf   count
delay_rb7:
    nop
    decfsz  count, f
    goto    delay_rb7
    bcf     PORTD, 7
    
update_prev:
    ; Сохраняем текущее состояние как предыдущее
    movf    temp_portb, w
    movwf   prev_portb

    goto    int_end      ; Выходим - ничего не нажато
    
int_end:
not_rb_int:
    movf    status_temp,w
    movwf    STATUS
    swapf   w_temp,f
    swapf   w_temp,w
    retfie

    END
