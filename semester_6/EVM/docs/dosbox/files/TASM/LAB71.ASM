stseg   segment para stack
        dw      64 dup(?)
stseg   ends

dseg    segment para
; Task 1: keyboard input
task1Msg1     db 13,10,'Press keys to enter your surname (English).',13,10,'Press Enter to finish.$'
task1Msg2     db 13,10,'ASCII codes: ','$'
task1Msg3     db 13,10,'Scan codes:  ','$'
asciiBuf      db 50 dup(0)
scanBuf       db 50 dup(0)
task1_count   dw 0
dseg    ends

cseg    segment para
        assume  cs:cseg, ds:dseg, ss:stseg

main    proc    far
        push    ds
        xor     ax,ax
        push    ax
        mov     ax,dseg
        mov     ds,ax

        xor     si,si              ; Индекс для буферов

        ; Вывод приглашения
        mov     dx, OFFSET task1Msg1
        mov     ah,09h
        int     21h

        ; Чтение клавиш
ReadLoop:
        mov     ah,00h
        int     16h               ; AH=scan, AL=ASCII
        cmp     al,13             ; Enter?
        je      ShowResults
        mov     asciiBuf[si],al
        mov     scanBuf[si],ah
        inc     si
        cmp     si,50
        jb      ReadLoop

ShowResults:
        mov     task1_count,si

        ; Вывод ASCII
        mov     dx, OFFSET task1Msg2
        mov     ah,09h
        int     21h
        mov     cx,task1_count
        xor     si,si
ShowAscii:
        mov     dl,asciiBuf[si]
        mov     ah,02h
        int     21h
        inc     si
        loop    ShowAscii

        ; Вывод Scan-кодов
        mov     dx, OFFSET task1Msg3
        mov     ah,09h
        int     21h
        mov     cx,task1_count
        xor     si,si
ShowScan:
        mov     al,scanBuf[si]
        call    PrintHex
        mov     dl,' '
        mov     ah,02h
        int     21h
        inc     si
        loop    ShowScan

        ; Ожидание любой клавиши перед выходом
        mov     ah,00h
        int     16h
        
        ; Завершение программы
        mov     ax,4C00h
        int     21h

PrintHex PROC
        push    ax
        push    cx
        mov     ah,0
        mov     cl,16
        div     cl
        call    PrintDigit
        mov     al,ah
        call    PrintDigit
        pop     cx
        pop     ax
        ret
PrintHex ENDP

PrintDigit PROC
        push    ax
        cmp     al,10
        jb      Digit
        add     al,7
Digit:  add     al,'0'
        mov     dl,al
        mov     ah,02h
        int     21h
        pop     ax
        ret
PrintDigit ENDP

main    endp
cseg    ends
        end     main
