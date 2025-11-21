list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;*****************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    goto start
    CODE    0x004 	;вектор прерываний
	goto m2			;обработка прерывани€ от таймера
MAIN_PROG       CODE

start 
	bsf STATUS, 5	;¬ыбор банка данных
	movlw 0x28		;TMR0 подсчитывает фронты на входе RA4/T0CKI 
	movwf OPTION_REG;предделитель подключен к WDT
	bsf TRISA, 4
	

	bcf STATUS, 5	;¬ыбор банка данных
	movlw 0xA0
	movwf INTCON 	;разрешает все прерывани€, разрешает прерывани€ от TMR0
	movlw 0xC4
	movwf TMR0		;устанавливаетм начальное значение TMR0
	NOP
	NOP

m1	NOP				;ожидаем срабатывани€ таймера
	goto m1   
      
m2 	movlw 0xA0	
	movwf INTCON	;восстанавливаем 7 бит (разрешает все прерывани€)
	movlw 0xC4
	movwf TMR0		;устанавливаетм начальное значение
	RETURN			;возврат из прерывани€
	END
