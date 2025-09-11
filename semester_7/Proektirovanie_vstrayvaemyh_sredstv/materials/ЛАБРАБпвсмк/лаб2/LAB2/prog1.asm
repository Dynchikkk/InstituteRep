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
    goto    start              ; go to beginning of program

INT_VECTOR      CODE    0x0004 ; interrupt vector location

MAIN_PROG       CODE
start

  movlw 0x00
  banksel TRISD
  movwf TRISD
  movlw 0xff
  movwf TRISB
  banksel ANSELH
  movlw 0x1f
  movwf ANSELH
  banksel PORTD
  movwf PORTD
m1  bsf PORTD,0
  bcf PORTD,1
  CLRWDT
  btfsc PORTB,5
  goto m1
m2  bsf PORTD,1
  bcf PORTD,0
  btfsc PORTB,5
  goto m1
  goto m2
  end            
