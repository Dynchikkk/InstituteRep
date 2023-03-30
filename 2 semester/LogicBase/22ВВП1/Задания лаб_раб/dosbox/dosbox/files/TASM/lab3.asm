data segment
	a1 dd 42771478h
	b1 dd 0C29B3850h

	a2 dd 46771478h
	b2 dd 0C69B3850h
data ends

code segment
assume cs:code, ds:data, ss:nothing

start:		mov ax, data
		mov ds, ax

quit: 		mov ax, 4c00h
		int 21
code ends
end start