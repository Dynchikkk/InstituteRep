;prg14_10.asm
;��뢠�騩 �����
include	mac.inc
extrn	my_proc2:far,per0:byte
public	per1,per2
stk	segment	stack
	db	256 dup (0)
stk	ends
data	segment	para public 'data'
per1	db	'1'
per2	db	'2'
data	ends
code	segment
main	proc	far
assume	cs:code,ds:data,ss:stk
	mov	ax,data
	mov	ds,ax
	mov	dl,per0
	OutChar
call	my_proc2
	exit
main	endp
code	ends
end	main

