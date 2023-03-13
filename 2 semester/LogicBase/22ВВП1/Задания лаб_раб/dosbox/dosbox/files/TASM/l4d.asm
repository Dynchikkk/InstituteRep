data segment
;=============
	a dw 0CA4Fh
	b dw 4588h

	y dw ?
;=============
data ends

code segment
assume cs:code, ds:data, ss:nothing
start:		mov ax, data
		mov ds, ax
;=============
	mov AX, a
	mov BX, b
	add AX, BX
	mov y, AX
;=============
quit:		mov ax, 4c00h
		int 21h
code ends
end start