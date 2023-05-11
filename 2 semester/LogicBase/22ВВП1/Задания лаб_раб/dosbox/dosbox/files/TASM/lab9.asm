data segment
;=============
	A dw 10000d
	B dw -2000d
	C dw -600d
	Y1 dw ?
	Y2 dw ?
	chast dw ?
	ost dw ?
	good db ?
	err db ?
	del dw ?
	del_neg dw ?
	mask dw 8000h
;=============
data ends

code segment
assume cs: code, ds:data, ss: nothing
start:	mov ax, data
	mov ds,ax
;=============
	mov good, 0
	mov err, 0

	mov bx, B
	mov cl, 2
	sar bx, cl; B/4
	jno N1
	jmp ALARM
N1:
	add bx, B; B/4 + B
	jno N2
	jmp ALARM
N2:
	
	mov ax, A
	sub ax, bx; A - B/4 - B
	jno N3
	jmp ALARM
N3:

	mov bx, C
	mov cl, 2
	sar bx, cl; C/4
	jno N4
	jmp ALARM
N4:
	add ax, bx; A - B/4 - B + C/4
	jno N5
	jmp ALARM
N5:

	mov cl, 2
	sal ax, cl; 4(A - B/4 - B + C/4)
	jno N6
	jmp ALARM
N6:
	
	; Умножение
	mov bx, C
	; проверка знака суммы
	mov dx, mask
	mov cx, dx
	and dx, ax
	jz PLUS_LAST_STEP
	neg ax
	mov dx, 1
PLUS_LAST_STEP:
	; проверка знака C
	and cx, bx
	jz PLUS_C
	neg bx
	mov cx, 1
PLUS_C:
	xor dx, cx
	push dx
	; Цикл умножения
	xor dx, dx
	mov cx, 15
MUL_NUM:
	rcr bx, 1
	jnc a_1
	add dx, ax
a_1:
	rcr dx, 1
	loop MUL_NUM
	
	rcr bx, 1
	rcr dx, 1
	rcr bx, 1
	
	; Возврат знака
	pop cx
	test cl, 1
	jz EXIT_MUL
	not dx
	neg bx
	
EXIT_MUL:
	mov Y1, dx; старшая часть
	mov Y2, bx; младшая часть
	
	;
	mov dx, B
	mov ax, B
	mov cl, 2
	sal ax, cl ;
	add dx, ax
	jno N7
	jmp ALARM
N7:
	cmp dx, 0
	jne CHECK_DELIMOE
	jmp ALARM

	;
CHECK_DELIMOE:
	xor si, si
	xor di, di
	mov ax, Y1
	mov bx, Y2
	test ax, mask
	jz CHECK_DELITEL
	not ax
	not bx
	add bx, 1
	adc ax, 0
	add si, 1

	;
CHECK_DELITEL:
	test dx, mask
	jz PRED_DIV
	neg dx
	add si, 2
	;
	;
	;

PRED_DIV:
	mov cx, 16
	mov del, dx
	neg dx
	mov del_neg, dx
	add ax, del_neg
	jc ALARM
	neg dx
	jmp DELENIE

SAVE_FLAGS:
	popf

DELENIE:
	rcl bx, 1
	rcl ax, 1
	jc PLUS
	add ax, del_neg
	jmp NOT_PLUS
PLUS:
	add ax, del

NOT_PLUS:
	pushf
	loop SAVE_FLAGS

OSTATOK1:
	popf
	rcl bx, 1
	test ax, mask
	jz OSTATOK2
	add ax, del
OSTATOK2:
	test si, 1
	jz OSTATOK_PLUS
	neg ax
	add di, 1
OSTATOK_PLUS:
	test si, 2
	jz CHASTNOE_PLUS
	add di, 1
CHASTNOE_PLUS:
	cmp di, 1
	jne RESULT
	neg bx

RESULT:
	mov chast, bx
	mov ost, ax
	jmp ALLGOOD

ALARM:
	mov err, 1
	
ALLGOOD:
	mov good, 1
;=============
quit:	mov ax,4c00h
	int 21
code ends
end start