stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
x       dw 0, 1, 0, 2, 3, 0, 4, 5  ; ������ �� 8 �����
y       dw ?                      ; ��������� � ���������� �����
dseg    ends

cseg    segment para
assume cs:cseg, ds:dseg, ss:stseg

count_zeros_stack proc near
    ; ������� ��������� (����� ����):
    ; [BP+4] - ����� �������
    ; [BP+6] - ���������� ���������
    ; �����:
    ; AX - ���������� ������� ���������

    push bp
    mov bp, sp                ; ������������� ������� ��������� �����
    mov bx, [bp+4]            ; ��������� ����� �������
    mov cx, [bp+6]            ; ��������� ���������� ���������
    xor ax, ax                ; �������� ������� �����

loop_start:
    mov dx, [bx]              ; ��������� ������� ������� �������
    cmp dx, 0                 ; ���������� � 0
    jne next_element          ; ���� �� 0, ��������� ������
    inc ax                    ; ���� 0, ����������� �������

next_element:
    add bx, 2                 ; ������� � ���������� ��������
    loop loop_start           ; ��������� ����

    pop bp
    ret 4                     ; ������� ��������� �� ����� (2 ��������� �� 2 �����)
count_zeros_stack endp

lab5 proc far
    push ds
    mov ax, dseg
    mov ds, ax

    push 8                    ; ���������� ���������
    push offset x             ; ����� �������
    call count_zeros_stack    ; ����� ���������

    mov y, ax                 ; ���������� ����������

    pop ds
    ret
lab5 endp

cseg    ends
        end lab5
