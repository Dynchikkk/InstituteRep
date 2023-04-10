data segment
;=============
	A dw 03F4h
	B dw 03EDh
	C dw 03EBh
	Y dw ?
	good db ?
;=============
data ends

code segment
assume cs: code, ds:data, ss: nothing
start:	mov ax, data
	mov ds,ax
;=============
	mov bx, B
	mov cl, 2
	sar bx, cl; B/4
	jo ANOTHERWAY;
;==== FuncCall
	push bx
	call RoundProc
	mov bx, di
;====
	add bx, B; B/4 + B
	mov y, bx
	jo ANOTHERWAY
	
	mov ax, A
	sub ax, bx; A - B/4 - B
	mov y, ax
	jo ANOTHERWAY

	mov bx, C
	mov cl, 2
	sar bx, cl; C/4
	;==== FuncCall
	push bx
	call RoundProc
	mov di, bx
	;====
	mov bx, di
	add ax, bx; // A - B/4 - B + C/4
	mov y, ax;
	jo ANOTHERWAY;

	mov cl, 2
	sal ax, cl; 2(A - B/4 - B + C/4)
	jo ANOTHERWAY
	jmp ALLGOOD

ANOTHERWAY:
	mov bx, B
	mov cl, 4
	sar bx, cl; B/16
	mov ax, B
	mov cl, 3
	sar ax, cl; B/8
	add bx, B; B/16 + B/8
	
	mov ax, A
	mov cl, 2
	sar ax, cl
	sub ax, bx; A/4 - B/16 - B/8

	mov bx, C
	mov cl, 4
	sar bx, cl; C/16
	add ax, bx; // A/4 - B/16 - B/5 + C/16

	mov cl, 4
	sal ax, cl; // 16(A/4 - B/16 - B/5 + C/16)

ALLGOOD:
	inc good;

	mov y, ax;
	jmp EXIT
	
RoundProc proc
	mov di, [si]
	cmp di, 0
	jge MINUS
PLUS:
	adc di, 0
	jmp ENDPROC
MINUS:
	neg di
	adc di, 0
	neg di
ENDPROC:
	ret 2
RoundProc endp

EXIT:
;=============
quit:	mov ax,4c00h
	int 21
code ends
end start