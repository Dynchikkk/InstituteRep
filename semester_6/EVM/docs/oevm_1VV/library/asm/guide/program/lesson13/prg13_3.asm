;prg_13_3.asm
def_sto_1	macro	id_table,ln:=<5>
;����� १�ࢨ஢���� ����� ������ len.
;�ᯮ������ WHILE
id_table	label	byte
len=ln
	while	len
		db	0
		len=len-1
	endm
endm
def_sto_2	macro	id_table,len
;����� १�ࢨ஢���� ����� ������ len
id_table	label	byte
	rept	len
	db	0
	endm
endm

data	segment para public 'data'
	def_sto_1	tab_1,10
	def_sto_2	tab_2,10
data	ends
;ᥣ����� ������ � �⥪� � �⮩ �ணࠬ�� ����易⥫��
end	

