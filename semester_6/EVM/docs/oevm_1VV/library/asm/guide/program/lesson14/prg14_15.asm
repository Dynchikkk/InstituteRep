;prg14_15.asm
MASM
MODEL	large,pascal
STACK	256
.code
main:
asmproc	proc	near chr:BYTE,x:WORD,y:WORD,kol:WORD
PUBLIC	asmproc
	mov	dh,byte ptr y	; y � dh
	mov	dl,byte ptr x	; x � dl
	mov	ah,02h	;����� �㦡� BIOS
	int	10h	;�맮� ���뢠��� BIOS
	mov	ah,09h	;����� �㦡� BIOS
	mov	al,chr	;ᨬ��� - � al
	mov	bl,07h	;��᪠ �뢮�� ᨬ����
	xor	bh,bh
	mov	cx,kol	;kol � cx
	int	10h	;�맮� ���뢠��� BIOS
	ret
asmproc	endp	;����� ��楤���
end	main	;����� �ணࠬ��

