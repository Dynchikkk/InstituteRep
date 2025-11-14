    list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions
    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
; Обычный сегмент данных
TEMP_VAR    UDATA           ; explicit address specified is not required
count1      RES 2
;**********************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    movlw HIGH start
    movwf PCLATH
    goto start              ; go to beginning of program

INT_VECTOR      CODE    0x0004 ; interrupt vector location
МАIN_PROG    CODE
start    ; начало программы

movlw 0x00    ; пересылка константы в регистр w (буфер)
banksel TRISD    ; выбор страницы памяти
movwf TRISD    ; занесение в TRISD значения из регистра w (0)
movlw 0xff    ; пересылка 0xff в регистр w (буфер)
movwf TRISB    ; занесение в TRISD значения из регистра w (0xff)
banksel ANSELH   ; выбор страницы памяти
movlw 0x3b    ; пересылка константы в регистр w (буфер)
movwf ANSELH    ; занесение в ANSELH значения из регистра w (0xff)
banksel PORTD    ; выбор страницы памяти
movwf PORTD    ; занесение в PORTD значения из регистра w (0x3d)

ml
bsf PORTD,1    ; установка в PORTD в 1 бит "1"
bsf PORTD,2    ; установка в PORTD в 2 бит "1"
bcf PORTD,3    ; очистка 3 бита в PORTD
CLRWDT    ; сброс ждущего таймера

btfsc PORTB,1    ; проверка 1 бита в PORTB, пропуск следующей команды, если там 0
goto ml    ; переход в метку ml

m2
bcf PORTD,1    ; очистка 1 бита в PORTD
bcf PORTD,2    ; очистка 2 бита в PORTD
bsf PORTD,3    ; установка в PORTD в 3 бит "1"

btfsc PORTB,1    ; проверка 1 бита в PORTB, пропуск следующей команды, если там 0
goto ml    ; переход в метку ml
goto m2    ; переход в метку m2
end


