stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
a       dw 5       ; A = N = 5
b       dw -11     ; B = N - 16 = -11
c       dw 12      ; C = N + 7 = 12
y       dw ? 
dseg    ends

cseg    segment para
lab1    proc far
        assume cs:cseg, ds:dseg, ss:stseg
        push    ds
        mov     ax, dseg
        mov     ds, ax
        ; Задаём базовый регистр для адресации A
        mov     bx, offset a   ; базовая адресация для A
        mov     ax, [bx]       ; загружаем A через [BX]
        sub     ax, [bx+2]     ; вычитаем B (адресация с базой и смещением; смещение 2)
        add     ax, [bx+4]     ; прибавляем C (смещение 4)
        sub     ax, 11         ; вычитаем константу 11 (непосредственная адресация)
        mov     y, ax          ; результат записываем прямо по адресу y
        pop     ds
        ret
lab1    endp
cseg    ends
        end lab1
