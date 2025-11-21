list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;*****************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    goto start
    CODE    0x004		;вектор прерываний
	goto m2				;обработка прерывания от таймера
MAIN_PROG       CODE

start 
	bsf STATUS, 5		;Выбор банка данных, в котором находиться OPTION_REG
	movlw 0x08
	movwf OPTION_REG	;TMR0 увеличивается при спадающем фронте

	bcf STATUS, 5		;Выбор банка данных, в котором находиться INTCON и TMR0
	movlw 0xA0
	movwf INTCON 		;7 - разрешает все прерывания и 5 - разрешает прерывания от TMR0
	movlw 0xF6
	movwf TMR0			;устанавливаем начальное значение TMR0

m1  NOP					;ожидаем срабатывания таймера
	goto m1   
      
m2 	movlw 0xA0
	movwf INTCON		;восстанавливаем 7 бит (разрешает все прерывания)
	movlw 0xF6
	movwf TMR0			;устанавливаем начальное значение
	RETURN				;возврат из прерывания
	END
