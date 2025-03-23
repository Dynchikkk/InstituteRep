stseg   segment para stack
        dw 16 dup(?)
stseg   ends

dseg    segment para
x       dw 0, 1, 0, 2, 3, 0, 4, 5  ; массив из 8 чисел
y       dw ?                      ; результат – количество нулей
dseg    ends

cseg    segment para
assume cs:cseg, ds:dseg, ss:stseg

count_zeros_reg proc near
    ; Входные параметры:
    ; BX - адрес массива
    ; CX - количество элементов
    ; Выход:
    ; AX - количество нулевых элементов
    
    xor ax, ax              ; Обнуляем счетчик нулей

loop_start:
    mov dx, [bx]            ; Загружаем текущий элемент массива
    cmp dx, 0               ; Сравниваем с 0
    jne next_element        ; Если не 0, переходим дальше
    inc ax                  ; Если 0, увеличиваем счетчик
    next_element:
    add bx, 2               ; Переход к следующему элементу
    loop loop_start         ; Повторяем цикл

    ret
count_zeros_reg endp

lab41 proc far
    push ds
    xor ax, ax        
    push ax

    mov ax, dseg
    mov ds, ax

    mov bx, offset x        ; Адрес массива
    mov cx, 8               ; Количество элементов
    call count_zeros_reg    ; Вызов процедуры

    mov y, ax               ; Сохранение результата
    
    pop ds
    ret
lab41 endp

cseg    ends
        end lab41
