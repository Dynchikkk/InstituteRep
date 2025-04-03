stseg segment para stack
    dw 100h dup (?)
stseg ends

dseg segment para
    msg db 'Belyaev Demin Sergunov', 0  ; Строка завершается нулём
dseg ends

cseg segment para
    assume cs:cseg, ds:dseg, ss:stseg

start:
    mov ax, dseg
    mov ds, ax
    mov es, ax

    ; Установка видеорежима 03h (текстовый 80x25)
    mov ax, 0003h
    int 10h

    ; Заполнение экрана триколором
    ; Верхняя красная полоса (8 строк)
    mov ax, 0608h       ; AH=06 (прокрутка), AL=8 строк
    mov bh, 40h         ; Красный фон (0x4), чёрный текст (0x0)
    xor cx, cx          ; Верхний левый угол (0,0)
    mov dx, 074Fh       ; Нижний правый угол (7,79)
    int 10h

    ; Средняя белая полоса (9 строк)
    mov ax, 0609h       ; AL=9 строк
    mov bh, 0F0h        ; Белый фон (0xF), чёрный текст (0x0)
    mov cx, 0800h       ; (8,0)
    mov dx, 104Fh       ; (16,79)
    int 10h

    ; Нижняя красная полоса (8 строк)
    mov ax, 0608h       ; AL=8 строк
    mov bh, 40h         ; Красный фон
    mov cx, 1100h       ; (17,0)
    mov dx, 184Fh       ; (24,79)
    int 10h

    ; Настройка позиции вывода
    mov dh, 12          ; Строка 12
    mov dl, 30          ; Колонка 30
    mov si, offset msg  ; Указатель на строку

print_loop:
    ; Установка курсора
    mov ah, 02h
    mov bh, 0
    int 10h

    ; Проверка символа на конец строки (0)
    mov al, [si]
    test al, al
    jz end_print

    ; Чтение текущего атрибута фона
    mov ah, 08h
    int 10h             ; AH = атрибут фона

    ; Формируем атрибут: фон + чёрный текст
    and ah, 0F0h        ; Оставляем только фон (4 старших бита)
    or  ah, 00h         ; Устанавливаем текст чёрный (0x0)

    ; Вывод символа с атрибутом
    mov al, [si]        ; Символ
    mov bl, ah          ; Атрибут (фон + текст)
    mov ah, 09h
    mov cx, 1           ; Количество повторений
    int 10h

    ; Следующий символ и позиция
    inc si
    inc dl
    jmp print_loop

end_print:
    ; Ожидание клавиши
    mov ah, 00h
    int 16h

    ; Завершение
    mov ax, 4C00h
    int 21h

cseg ends
end start