stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
a       dw 5       ; A = N = 5
b       dw -11     ; B = N - 16 = -11
c       dw 12      ; C = N + 7 = 12
y       dw ?       ; Результат вычисления
dseg    ends

cseg    segment para
lab1    proc far
        assume cs:cseg, ds:dseg, ss:stseg
        push    ds
        mov     ax, dseg
        mov     ds, ax

        ; Устанавливаем базовый адрес для операндов A, B, C
        mov     bx, offset a
        ; Сначала вычисляем (C - 11)
        mov     dx, [bx+4]     ; DX = C
        sub     dx, 11         ; DX = C - 11
        ; Затем вычисляем (A - B)
        mov     ax, [bx]       ; AX = A
        sub     ax, [bx+2]     ; AX = A - B
        ; Складываем результаты: (A - B) + (C - 11)
        add     ax, dx         ; AX = (A - B) + (C - 11)
        ; Записываем результат в переменную y
        mov     y, ax

        pop     ds
        ret
lab1    endp
cseg    ends
        end lab1
