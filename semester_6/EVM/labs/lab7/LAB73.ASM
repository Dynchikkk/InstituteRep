stseg   segment para stack
        dw      256 dup(?)
stseg   ends

dseg    segment para
prompt1         db 'IVANOV: $'
prompt2         db 'PETROVA: $'
days            db 2 dup(0)
months          db 2 dup(0)
years           dw 2 dup(0)
date_buffer     db 11, 0, 11 dup(0)
result_str      db 'birthday: $'
birthday_day    db '00.00.0000$'
year_str        db '0000$'
newline         db 0Dh, 0Ah, '$'
count           dw 0
dseg    ends

cseg    segment para
        assume  cs:cseg, ds:dseg, ss:stseg

task    proc    far
        push    ds
        xor     ax, ax
        push    ax
        mov     ax, dseg
        mov     ds, ax

        ; Ввод первой даты
        mov     dx, offset prompt1
        mov     ah, 09h
        int     21h
        call    input_date
        call    parse_date

        ; Ввод второй даты
        mov     dx, offset prompt2
        mov     ah, 09h
        int     21h
        call    input_date
        call    parse_date

        ; Вычисление результата
        call    compute_average

        ; Вывод результата
        mov     dx, offset result_str
        mov     ah, 09h
        int     21h

        mov     dx, offset birthday_day
        mov     ah, 09h
        int     21h

        ; Ожидание нажатия клавиши
        mov     ah, 08h
        int     21h

        ret
task    endp

input_date proc near
        call    clear_keyboard
        mov     dx, offset date_buffer
        mov     ah, 0Ah
        int     21h
        mov     dx, offset newline
        mov     ah, 09h
        int     21h
        ret
input_date endp

parse_date proc near
        mov     di, [count]
        mov     si, offset date_buffer + 2

        ; Парсинг дня (дд)
        call    atoi_2
        mov     days[di], al
        add     si, 3           ; пропустить точку

        ; Парсинг месяца (мм)
        call    atoi_2
        mov     months[di], al
        add     si, 3           ; пропустить точку

        ; Парсинг года (гггг)
        call    atoi_4
        shl     di, 1
        mov     years[di], ax
        shr     di, 1
        inc     word ptr [count]
        ret
parse_date endp

clear_keyboard proc near
        push    ax
clear_loop:
        mov     ah, 01h
        int     16h
        jz      buffer_empty
        mov     ah, 00h
        int     16h
        jmp     clear_loop
buffer_empty:
        pop     ax
        ret
clear_keyboard endp

atoi_2 proc near
        xor     ax, ax
        mov     al, [si]        ; первая цифра
        sub     al, '0'
        mov     bx, 10
        mul     bx              ; AX = AL * 10
        mov     bl, [si+1]      ; вторая цифра
        sub     bl, '0'
        add     al, bl
        ret
atoi_2 endp

atoi_4 proc near
        xor     ax, ax
        mov     cx, 4
atoi4_loop:
        mov     bx, 10
        mul     bx              ; AX = AX * 10
        mov     bl, [si]
        sub     bl, '0'
        xor     bh, bh
        add     ax, bx
        inc     si
        loop    atoi4_loop
        ret
atoi_4 endp

compute_average proc near
        ; Вычисление среднего года
        mov     ax, years[0]
        add     ax, years[2]
        shr     ax, 1
        mov     bx, ax          ; сохраняем средний год в BX

        ; Очистка year_str перед форматированием
        mov     di, offset year_str
        mov     cx, 4
clear_year_str:
        mov     byte ptr [di], '0'
        inc     di
        loop    clear_year_str

        ; Восстанавливаем значение AX из BX перед форматированием
        mov     ax, bx
        call    format_4_digits

        ; Установка ES для корректного копирования
        mov     ax, ds
        mov     es, ax

        ; Копирование отформатированного года из year_str в birthday_day (начиная с позиции 6)
        mov     si, offset year_str
        mov     di, offset birthday_day+6
        mov     cx, 4
        rep     movsb


        ; Вычисление среднего дня
        xor     ax, ax
        mov     al, days[0]
        add     al, days[1]
        shr     ax, 1
        call    format_2_digits
        mov     [birthday_day], ah
        mov     [birthday_day+1], al

        ; Вычисление среднего месяца
        xor     ax, ax
        mov     al, months[0]
        add     al, months[1]
        shr     ax, 1
        call    format_2_digits
        mov     [birthday_day+3], ah
        mov     [birthday_day+4], al

        ret
compute_average endp

format_2_digits proc near
        mov     bl, 10
        div     bl              ; делим AX на 10, остаток в AH
        add     ax, '00'        ; преобразование в ASCII
        xchg    al, ah          ; меняем порядок цифр
        ret
format_2_digits endp

format_4_digits proc near
        mov     si, offset year_str + 3  ; заполняем с конца
        mov     cx, 4
        mov     bx, 10
format4_loop:
        xor     dx, dx
        div     bx              ; деление: DX:AX / BX
        add     dl, '0'
        mov     [si], dl
        dec     si
        loop    format4_loop
        ret
format_4_digits endp

cseg    ends
        end     task
