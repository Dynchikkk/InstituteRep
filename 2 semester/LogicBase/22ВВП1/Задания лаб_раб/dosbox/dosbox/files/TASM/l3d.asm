data segment
;=============
	a1 dd 4256C28Fh
	b1 dd 0C28B0F5Ch

	a2 dd 4656C28Fh
	b2 dd 0C68B0F5Ch
;=============
data ends

code segment
assume cs:code, ds:data, ss:nothing
start:		mov ax, data
		mov ds, ax
;=============
;=============
quit:		mov ax, 4c00h
		int 21h
code ends
end start