stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
x       dw 0, 1, 0, 2, 3, 0, 4, 5  ; ������ �� 8 �����
y       dw ?                      ; ��������� � ���������� �����
dseg    ends

cseg    segment para
assume cs:cseg, ds:dseg, ss:stseg

count_zeros_reg proc near
    ; ������� ���������:
    ; BX - ����� �������
    ; CX - ���������� ���������
    ; �����:
    ; AX - ���������� ������� ���������
    
    xor ax, ax              ; �������� ������� �����

loop_start:
    mov dx, [bx]            ; ��������� ������� ������� �������
    cmp dx, 0               ; ���������� � 0
    jne next_element        ; ���� �� 0, ��������� ������
    inc ax                  ; ���� 0, ����������� �������
    next_element:
    add bx, 2               ; ������� � ���������� ��������
    loop loop_start         ; ��������� ����

    ret
count_zeros_reg endp

lab41 proc far
    push ds
    xor ax, ax        
    push ax

    mov ax, dseg
    mov ds, ax

    mov bx, offset x        ; ����� �������
    mov cx, 8               ; ���������� ���������
    call count_zeros_reg    ; ����� ���������

    mov y, ax               ; ���������� ����������
    
    pop ds
    ret
lab41 endp

cseg    ends
        end lab41
