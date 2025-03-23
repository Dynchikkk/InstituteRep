stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
x       dw 0, 1, 0, 2, 3, 0, 4, 5  ; массив из 8 чисел
y       dw ?                      ; результат – количество нулей
dseg    ends

cseg    segment para
assume cs:cseg, ds:dseg, ss:stseg

count_zeros_stack proc near
    ; Входные параметры (через стек):
    ; [BP+4] - адрес массива
    ; [BP+6] - количество элементов
    ; Выход:
    ; AX - количество нулевых элементов

    push bp
    mov bp, sp                ; Устанавливаем базовый указатель стека
    mov bx, [bp+4]            ; Загружаем адрес массива
    mov cx, [bp+6]            ; Загружаем количество элементов
    xor ax, ax                ; Обнуляем счетчик нулей

loop_start:
    mov dx, [bx]              ; Загружаем текущий элемент массива
    cmp dx, 0                 ; Сравниваем с 0
    jne next_element          ; Если не 0, переходим дальше
    inc ax                    ; Если 0, увеличиваем счетчик

next_element:
    add bx, 2                 ; Переход к следующему элементу
    loop loop_start           ; Повторяем цикл

    pop bp
    ret 4                     ; Убираем параметры из стека (2 параметра по 2 байта)
count_zeros_stack endp

lab5 proc far
    push ds
    mov ax, dseg
    mov ds, ax

    push 8                    ; Количество элементов
    push offset x             ; Адрес массива
    call count_zeros_stack    ; Вызов процедуры

    mov y, ax                 ; Сохранение результата

    pop ds
    ret
lab5 endp

cseg    ends
        end lab5
