;prg_8_8.asm
masm
model	small
stack	256
.data 
len	equ	2	;ࠧ�來���� �᫠
b	db	1,7	;��㯠�������� �᫮ 71
c	db	4,5	;��㯠�������� �᫮ 54
sum	db	3 dup (0)
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
;...
	xor	bx,bx
	mov	cx,len
m1:
	mov	al,b[bx]
	ad�	al,c[bx]
	aaa
	mov	sum[bx],al
	inc	bx
	loop	m1
	adc	sum[bx],0
;...
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main		;����� �ணࠬ��

