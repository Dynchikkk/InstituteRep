data segment
;=============
	A dw 32767d
	B dw 1024d
	C dw 16128d
	Y1 dw ?
	Y2 dw ?
	good db ?
	err db ?
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
	jo ALARM;
	add bx, B; B/4 + B
	jo ALARM
	
	mov ax, A
	sub ax, bx; A - B/4 - B
	jo ALARM

	mov bx, C
	mov cl, 2
	sar bx, cl; C/4
	jo ALARM
	add ax, bx; A - B/4 - B + C/4
	jo ALARM;

	mov cl, 2
	sal ax, cl; 4(A - B/4 - B + C/4)
	jo ALARM
	
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
	jz EXIT
	not dx
	neg bx
	
EXIT:
	mov Y1, dx; старшая часть
	mov Y2, bx; младшая часть
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