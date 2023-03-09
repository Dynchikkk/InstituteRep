data segment
	f16 dw 3DCEh
	f32 dd 3DC51EC1h

	g16 dw 0B26Ch
	g32 dd 0B263D70Fh
data ends

code segment
assume cs:code, ds:data, ss:nothing

start:		mov ax, data
		mov ds, ax

quit: 		mov ax, 4c00h
		int 21
code ends
end start