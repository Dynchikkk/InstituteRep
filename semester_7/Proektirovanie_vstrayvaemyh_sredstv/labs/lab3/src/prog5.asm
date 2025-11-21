list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;*****************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    goto start
    CODE    0x004 	;вектор прерываний
	goto m2			;обработка прерывания от таймера
MAIN_PROG       CODE

start 
	banksel PIE1
	bsf  PIE1,  0	;разрешает прерывание от таймера TMR1
	bsf TRISC, 0
	banksel T1CON

	movlw 0x07
	movwf T1CON
	bcf  PIR1, 0	;определяет, было ли переполнение таймера TMR1

	movlw 0xC0
    movwf INTCON 	;разрешает все прерывания, разрешает прерывания от TMR1
	movlw 0xFF
	movwf TMR1H		;устанавливаетм начальное значение старших разрядов
	movlw 0xFE
	movwf TMR1L		;устанавливаетм начальное значение младших разрядов

m1  NOP				;ожидаем срабатывания таймера
	goto m1   
      
m2 	bcf   PIR1, 0
	movlw 0xC0
	movwf INTCON	;восстанавливаем 7 бит (разрешает все прерывания)
	movlw 0xFF
	movwf TMR1H		;устанавливаетм начальное значение старших разрядов
	movlw 0xFE
	movwf TMR1L		;устанавливаетм начальное значение младших разрядов
	RETURN			;возврат из прерывания

	END 