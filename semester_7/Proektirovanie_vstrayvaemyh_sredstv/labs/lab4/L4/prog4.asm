list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

;*****************************************************************
TEMP_VAR UDATA 		; явно указанный адрес не требуется
count1 RES 2

RESET_VECTOR    CODE    0x0000 ; processor reset vector

															    goto start
;**********************************************************************
MAIN_PROG       CODE

Delay
re:
	CLRWDT 				; очистить сторожевой таймер
	btfsc ADCON0,1
	goto re
	return
  
start 
	banksel TRISA
	bsf TRISA,	0

	banksel ANSEL		;Выбор банка данных
	movlw 0x01
	movwf ANSEL

	banksel ANSELH		;Выбор банка данных
	movlw 0x00
	movwf ANSELH
	
	banksel ADCON0
	movlw 0x81
	movwf ADCON0 	
	
	banksel ADCON1
	movlw 0x00
	movwf ADCON1

	banksel TRISD
	clrf TRISD

	banksel PORTD
	clrf PORTD
m1  
	bsf ADCON0,	1

	call Delay
	
	movlw 0x03
	movwf count1
rest:
	btfsc ADRESH,7
	goto pass

	btfsc count1,7
	goto pass

	RLF ADRESH,0
	movwf ADRESH
	RLF count1,0
	movwf count1
	goto rest

pass:
	movf count1,0 
	movwf PORTD
	goto m1
END