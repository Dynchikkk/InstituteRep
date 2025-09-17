    list        p=16f887        ; указать целевой микроконтроллер
    #include    <p16f887.inc>   ; определения регистров и констант для PIC16F887

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

; Сегмент с прямым доступом - для переменных, используемых в ISR (сохранение контекста)
INT_VAR     UDATA_SHR
w_temp      RES     1         ; временная ячейка для сохранения W при входе в прерывание
status_temp RES     1         ; временная ячейка для сохранения STATUS
pclath_temp RES     1         ; временная ячейка для сохранения PCLATH

; Обычный сегмент данных
TEMP_VAR    UDATA
count1      RES 2             ; двухбайтовый счётчик задержки (count1 и count1+1)

;**********************************************************************
RESET_VECTOR    CODE    0x0000 ; вектор сброса
    movlw HIGH start          ; загрузить старшую часть адреса start в W
    movwf PCLATH              ; записать её в PCLATH (нужно для переходов >256)
    goto    start             ; переход на метку start

INT_VECTOR      CODE    0x0004 ; вектор прерывания
    movwf   w_temp            ; Сохранить W в w_temp (W содержимое теряется при вызове ISR)
    movf    STATUS,w          ; загрузить STATUS в W
    movwf   status_temp       ; сохранить STATUS
    movf    PCLATH,w          ; загрузить PCLATH в W
    movwf   pclath_temp       ; сохранить PCLATH

; здесь должен быть код ISR (если есть). В вашем фрагменте ISR пустой.

    movf    pclath_temp,w     ; восстановить PCLATH из pclath_temp
    movwf   PCLATH
    movf    status_temp,w     ; восстановить STATUS
    movwf   STATUS
    swapf   w_temp,f          ; !!! НЕСТАНДАРТНЫЙ приём: меняет местами стар/млад нибблы w_temp и сохраняет в w_temp
    swapf   w_temp,w          ; !!! затем помещает результат в W (восстанавливает W только частично/необычно)
    retfie                    ; возврат из прерывания (восстанавливает GIE)

MAIN_PROG       CODE

start

    movlw 0x00
	banksel TRISD
	movwf TRISD        ; TRISD = 0x00 -> PortD как выходы
	movlw 0x11         ; новое начальное значение 0x11 (00010001)
	banksel PORTD
	movwf PORTD        ; записать 0x11 в PORTD

maincycle
  CLRWDT                     ; очистить сторожевой таймер (WDT)
pause
  decfsz count1,1            ; декремент младшего байта count1; если 0->skip следующую строчку
  goto pause                 ; если не равен нулю — возвращаемся в pause
  decfsz count1+1,1          ; декремент старшего байта count1+1; если не ноль — goto pause
  goto pause                 ; (эта строка: появление — в коде; логика: при старшем не-нуле goto pause)
; Сдвиг содержимого регистра влево без учета бита переноса
  rlf PORTD,0                ; rotate left PORTD, результат записан обратно в PORTD (d = 0)
  rlf PORTD,1                ; rotate left PORTD, результат записан в W (d = 1) — файл не изменится
  goto maincycle             ; бесконечный цикл

  END
