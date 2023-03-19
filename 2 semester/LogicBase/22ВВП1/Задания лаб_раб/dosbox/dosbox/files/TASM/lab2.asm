data segment
	f16 dw 3DC6h
	f32 dd 3DC51Fh

	g16 dw 0B264h
	g32 dd 0FFB263D8h
data ends

code segment
assume cs:code, ds:data, ss:nothing

start:		mov ax, data
		mov ds, ax

quit: 		mov ax, 4c00h
		int 21
code ends
end start