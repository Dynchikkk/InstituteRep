stseg segment para stack
    dw 100h dup (?)
stseg ends

dseg segment para
    msg db 'Hello, World!', 0
dseg ends

cseg segment para
    assume cs:cseg, ds:dseg, ss:stseg

start:
    mov ax, dseg
    mov ds, ax

    ; Установка видеорежима 03h (текстовый 80x25)
    mov ax, 0003h
    int 10h

    ; Вывод сообщения через int 10h, 0Eh
    mov si, offset msg
print_loop:
    lodsb                   ; Загрузка символа из DS:SI в AL
    test al, al             ; Проверка на конец строки
    jz wait_key              ; Если ноль, переход к ожиданию
    mov ah, 0Eh             ; Функция BIOS вывода символа
    mov bh, 0               ; Номер страницы
    int 10h
    jmp print_loop

wait_key:
    ; Ожидание ввода через int 21h, 01h (с эхом)
    mov ah, 01h
    int 21h

    ; Ожидание нажатия клавиши через int 16h, 00h
    mov ah, 00h
    int 16h

    ; Завершение программы
    mov ax, 4C00h
    int 21h

cseg ends
end start