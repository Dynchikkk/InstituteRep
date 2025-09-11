    list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

; Сегмент с прямым доступом - тут хранятся переменные сохранения контекста при прерываниях
INT_VAR     UDATA_SHR   
w_temp      RES     1       ; variable used for context saving
status_temp RES     1       ; variable used for context saving
pclath_temp RES     1       ; variable used for context saving

; Обычный сегмент данных
TEMP_VAR    UDATA           ; explicit address specified is not required
count1      RES 2

;**********************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    movlw HIGH start
    movwf PCLATH
    goto    start              ; go to beginning of program

INT_VECTOR      CODE    0x0004 ; interrupt vector location
    movwf   w_temp          ; save off current W register contents
    movf    STATUS,w        ; move status register into W register
    movwf   status_temp     ; save off contents of STATUS register
    movf    PCLATH,w        ; move pclath register into w register
    movwf   pclath_temp     ; save off contents of PCLATH register

; isr code can go here or be located as a call subroutine elsewhere

    movf    pclath_temp,w   ; retrieve copy of PCLATH register
    movwf   PCLATH          ; restore pre-isr PCLATH register contents
    movf    status_temp,w   ; retrieve copy of STATUS register
    movwf   STATUS          ; restore pre-isr STATUS register contents
    swapf   w_temp,f
    swapf   w_temp,w        ; restore pre-isr W register contents
    retfie                  ; return from interrupt


MAIN_PROG       CODE

start

  movlw 0x00
  banksel TRISD
  movwf TRISD
   movlw 0x01
   movwf TRISB
  banksel ANSELH
   movlw 0x00
   movwf ANSELH

  movlw 0x55
  banksel PORTD
  movwf PORTD

maincycle
  CLRWDT
pause
  decfsz count1,1
  goto pause
  decfsz count1+1,1
  goto pause
; Сдвиг содержимого регистра влево без учета бита переноса
  rlf PORTD,0
  rlf PORTD,1
  goto maincycle

  END                       ; directive 'end of program'
