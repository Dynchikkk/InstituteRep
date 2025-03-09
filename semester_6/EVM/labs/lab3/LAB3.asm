stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
x       dw 0, 1, 0, 2, 3, 0, 4, 5  ; массив из 8 чисел
y       dw ?                      ; результат – количество нулей
dseg    ends

cseg    segment para
lab3    proc far
        assume cs:cseg, ds:dseg, ss:stseg
        push    ds
        mov     ax, dseg
        mov     ds, ax

        ; Устанавливаем базовый адрес для массива x
        mov     bx, offset x
        ; Обнуляем AX для хранения количества нулевых элементов
        xor     ax, ax
        ; Устанавливаем счетчик итераций (8 элементов)
        mov     cx, 8

loop_start:
        mov     dx, [bx]      ; Загружаем текущий элемент массива
        cmp     dx, 0         ; Сравниваем с 0
        jne     next_element  ; Если элемент не равен 0, переход к следующему
        inc     ax            ; Если элемент равен 0, увеличиваем счетчик
next_element:
        add     bx, 2         ; Переходим к следующему элементу (слово = 2 байта)
        loop    loop_start

        ; Записываем результат в переменную y
        mov     y, ax

        pop     ds
        ret
lab3    endp
cseg    ends
        end lab3
