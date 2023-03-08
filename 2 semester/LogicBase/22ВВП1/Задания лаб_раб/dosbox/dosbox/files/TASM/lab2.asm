data segment
	a16 dw 46h
	a32 dd 46h

	b16 dw 5h
	b32 dd 5h
data ends

code segment
assume cs:code, ds:data, ss:nothing

start:		mov ax, data
		mov ds, ax

quit: 		mov ax, 4c00h
		int 21
code ends
end start