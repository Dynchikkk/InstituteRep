stseg   segment para stack
        dw      64 dup(?)
stseg   ends

dseg    segment para
task2Msg      db 13,10,'Enter text (echo input, Esc to finish): ','$'
dseg    ends

cseg    segment para
        assume  cs:cseg, ds:dseg, ss:stseg

main    proc    far
        push    ds
        xor     ax,ax
        push    ax
        mov     ax,dseg
        mov     ds,ax

        ; Вывод приглашения
        mov     dx, OFFSET task2Msg
        mov     ah,09h
        int     21h

        ; Цикл эхо-ввода
InputLoop:
        mov     ah,00h         ; Чтение клавиши
        int     16h            ; AH = scan code, AL = ASCII
        
        cmp     al,27          ; Проверка на Esc
        je      ExitProg
        
        mov     ah,0Eh         ; Вывод символа
        int     10h
        jmp     InputLoop

ExitProg:
        ; Ожидание любой клавиши
        mov     dx, OFFSET task2Msg  ; Произвольный адрес для примера
        mov     ah,08h
        int     21h
        
        mov     ax,4C00h
        int     21h

main    endp
cseg    ends
        end     main
