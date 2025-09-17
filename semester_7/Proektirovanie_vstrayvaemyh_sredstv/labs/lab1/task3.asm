    list        p=16f887
    #include    <p16f887.inc>

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

TEMP_VAR    UDATA
count1      RES 2

RESET_VECTOR CODE 0x0000
    movlw HIGH start
    movwf PCLATH
    goto start

MAIN_PROG CODE

start
    ; --- Отключение аналогов (чтобы RB0 можно было использовать как цифровой)
    movlw 0x00
    banksel ANSEL
    movwf ANSEL           ; отключаем AN0..AN7 (0 = цифровой)
    banksel ANSELH
    movwf ANSELH          ; отключаем AN8..AN12 и т.д.

    ; --- Настройка портов
    movlw 0x00
    banksel TRISD
    movwf TRISD           ; PORTD как выходы

    movlw 0x01
    banksel TRISB
    movwf TRISB           ; сделать весь PORTB входами (при необходимости)
                          ; далее мы будем проверять только RB0 — это TRISB<0>=1

    ; --- Инициализация начальных значений
    movlw 0x11
    banksel PORTD
    movwf PORTD           ; начальное состояние PORTD = 0x11

    ; инициализация count1 задержки (пример)
    movlw 0x20
    movwf count1          ; младший байт задержки
    movlw 0x00
    movwf count1+1        ; старший байт

maincycle
    CLRWDT

    ; Чтение состояния RB0
    banksel PORTB
    btfsc PORTB,0         ; если RB0 == 1 (bit set), пропустить следующую линию
    goto button_pressed   ; RB0 = 1 -> кнопка нажата
    goto button_released  ; RB0 = 0 -> кнопка не нажата

button_released
    ; поведение, когда кнопка НЕ нажата — например стандартный сдвиг влево
    banksel PORTD
    rlf PORTD,0           ; сдвиг влево, результат в PORTD
    call delay_simple
    goto maincycle

button_pressed
    ; поведение, когда кнопка нажата — альтернативное (например инверсия + мигание)
    banksel PORTD
    comf PORTD,0          ; инвертировать PORTD и записать обратно
    call delay_simple
    goto maincycle

; простая задержка: декремент двухбайтового count1
delay_simple
    movlw 0x50
    movwf count1
    movlw 0x00
    movwf count1+1
d_loop
    decfsz count1,1
    goto d_loop
    decfsz count1+1,1
    goto d_loop
    return

    END
