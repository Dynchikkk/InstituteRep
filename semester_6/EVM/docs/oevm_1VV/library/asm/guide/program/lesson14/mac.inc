;mac.inc
OutStr	macro	str
;�뢮� ��ப� �� ��࠭.
;�� �室� - �����䨪��� ��砫� �뢮����� ��ப�.
;��ப� ������ �����稢����� ᨬ����� '$'.
;�� ��室�- ᮮ�饭�� �� ��࠭�.
	push	ax
	mov	ah,09h
	lea	dx,str
	int	21h
	pop	ax
endm
GetChar	macro
;���� ᨬ���� � ����������.
;�� ��室� - � al ������ ᨬ���.
	push	ax
	mov	ah,01h
	int	21h
	pop	ax
endm
OutChar macro
;�뢮� ᨬ���� �� ��࠭.
;�� �室� - � dl �뢮���� ᨬ���.
	push	ax
	mov	ah,02h
	int	21h
	pop	ax
endm
clear_r	macro	rg
;���⪠ ॣ���� rg
	xor	rg,rg
	endm
conv_16_2	macro
;����� �८�ࠧ������ ᨬ���� ��⭠����筮� ����
;� �� ������ ���������� � al
	sub	dl,30h
	cmp	dl,9h
	jle	$+5
	sub	dl,7h
	endm
GetStr	macro	buf,max_len
;���� ��ப� �ந����쭮� ����� (�㭪�� 0ah int 21h)
;�� �室�:
;buf - ���� ��ப� �㤠 �㤥� ����饭 ����
;max_len - ���ᨬ��쭠� ����� �������� ��ப�
;�� ��室� - ��������� ��ப� �� ����� buf
;al - ����� ��������� ��ப�
	push	es
	push	dx
	push	cx
	xor	cx,cx
	mov	buf,max_len
	mov	ah,0ah
	lea	dx,buf
	int	21h
	mov	al,buf+1
	mov	cl,al	;����� ��������� ��ப� � al
;ᤢ�� al �� ��� ���� �����:
	push	ds
	push	es
	lea	si,buf+2
	lea	di,buf
rep	movsb
	pop	cx
	pop	dx
	pop	es
GetStr	endm
init_ds	macro
;����� ����ன�� ds �� ᥣ���� ������
	mov	ax,data
	mov	ds,ax
	xor	ax,ax
	endm
delay	macro	time
	local	ext,iter	
;����� ����প�. �� �室� - ���祭��
;��६����� ����প� (� ���).
	push	cx
	mov	cx,time
ext:	push	cx
	mov	cx,5000	;�� ���祭�� ����� ��������, ��室� ��
;�ந�����⥫쭮�� ������.
iter:	loop	iter
	pop	cx
	loop	ext
	pop	cx
	ENDM
Exit	macro
;��室 �� �ணࠬ��.
	mov	ax,4c00h
	int	21h
endm

