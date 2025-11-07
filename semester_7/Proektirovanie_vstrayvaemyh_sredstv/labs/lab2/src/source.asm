    list        p=16f887
    #include    <p16f887.inc>

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

; Обычный сегмент данных
TEMP_VAR    UDATA
count1      RES 2    ; переменная для задержки

;**********************************************************************
RESET_VECTOR    CODE    0x0000
    movlw   HIGH start
    movwf   PCLATH
    goto    start

MAIN_PROG       CODE

start
    ; Инициализация портов
    banksel TRISD
    movlw   0x00        ; PORTD - выходы
    movwf   TRISD
    movlw   0x01        ; RB0 - вход, остальные - выходы
    movwf   TRISB
    banksel ANSELH
    clrf    ANSELH      ; отключаем аналоговые функции
    banksel PORTD
    clrf    PORTD       ; очищаем PORTD

main_loop
    btfsc   PORTB, 0    ; проверяем состояние кнопки на RB0
    goto    mode2       ; если нажата - режим 2
    goto    mode1       ; если не нажата - режим 1

mode1
    movlw   0x55        ; начальное значение для режима 1
    movwf   PORTD
mode1_loop
    call    delay       ; задержка
    rlf     PORTD, F    ; сдвиг влево (через перенос)
    btfss   PORTB, 0    ; проверяем кнопку
    goto    mode1_loop  ; продолжаем если не нажата
    goto    main_loop   ; возвращаемся к проверке

mode2
    movlw   0x11        ; начальное значение для режима 2
    movwf   PORTD
mode2_loop
    call    delay       ; задержка
    rlf     PORTD, F    ; сдвиг влево (через перенос)
    btfsc   PORTB, 0    ; проверяем кнопку
    goto    mode2_loop  ; продолжаем если нажата
    goto    main_loop   ; возвращаемся к проверке

; Подпрограмма задержки
delay
    movlw   0xFF        ; инициализируем счетчик задержки
    movwf   count1
    movlw   0xFF
    movwf   count1+1
delay_loop
    decfsz  count1, F
    goto    delay_loop
    decfsz  count1+1, F
    goto    delay_loop
    return

    END