data segment
;=============
	f16 dw 35BAh
	f32 dd 0035B0ADh
	
	g16 dw 0BA81h
	g32 dd 0FFBA785Ch

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