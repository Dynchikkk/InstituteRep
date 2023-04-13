data segment
;=============
	A dw 64ECh
	B dw 03F0h
	C dw 0400h
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
	;mov y, bx
	jo ANOTHERWAY;
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
	jo ANOTHERWAY
	add ax, bx; A - B/4 - B + C/4
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
	jo EXIT
	mov y, bx
	mov ax, B
	mov cl, 2
	sar ax, cl; B/4
	jo EXIT
	mov y, ax
	add bx, ax; B/16 + B/4
	jo EXIT
	mov y, bx
	
	mov ax, A
	mov cl, 2
	sar ax, cl
	jo EXIT
	mov y, ax
	sub ax, bx; A/4 - B/16 - B/4
	jo EXIT
	mov y, ax

	mov bx, C
	mov cl, 4
	sar bx, cl; C/16
	jo EXIT
	mov y, bx
	add ax, bx; // A/4 - B/16 - B/4 + C/16
	jo EXIT
	mov y, ax

	mov cl, 4
	sal ax, cl; // 16(A/4 - B/16 - B/4 + C/16)
	jo EXIT

ALLGOOD:
	inc good;

	mov y, ax;
	EXIT:
;=============
quit:	mov ax,4c00h
	int 21
code ends
end start