list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

    __CONFIG    _CONFIG1, _LVP_OFF&_FCMEN_OFF&_IESO_OFF&_BOR_ON&_CPD_OFF&_CP_OFF&_MCLRE_ON&_PWRTE_ON&_WDT_ON&_INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;*****************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    goto start
    CODE    0x004 	;номер прерывани€ от таймера
    goto m2
MAIN_PROG       CODE

start 
	bsf STATUS, 5	;¬ыбор банка данных 01
	movlw 0x28	;предделитель подключен к WDT
	movwf OPTION_REG;TMR0 подсчитывает фронты на входе RA4/T0CKI; 
	bsf  PIE1, 0	; 0(1) Ц ¬ключить прерывание с tmr1
	bcf STATUS, 5	;¬ыбор банка данных 00

	movlw 0x07	; 0 - ¬ключение при единице
	movwf T1CON	; 2 Ц не синхронизируетс€ c tmr0; 1 Ц фронт с внешннего с входа RC0

	bcf  PIR1, 0	; 0(0) Ц Ѕит отвечает за возникновение прерывани€ с tmr1

	movlw 0xC0
   	 movwf INTCON ;7 - разрешает все прерывани€ и 6 - разрешает прерывани€ от TMR1
	movlw 0xFF
	movwf TMR1H	;устанавливаетм начальное значение
	movlw 0xFE
	movwf TMR1L	;устанавливаетм начальное значение

m1 	NOP		;ожидаем срабатывани€ таймера
	goto m1   
    
m2 	bcf   PIR1, 0
	movlw 0xC0
	movwf INTCON	;7 - разрешает все прерывани€ и 6 - разрешает прерывани€ от TMR1
	movlw 0xFF
	movwf TMR1H	;устанавливаетм начальное значение
	movlw 0xFE
	movwf TMR1L	;устанавливаетм начальное значение
	RETURN	;возврат из прерывани€
	END
