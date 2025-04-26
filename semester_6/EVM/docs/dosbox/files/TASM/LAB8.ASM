stseg   segment para stack
    dw      100h dup(?)
stseg   ends

dseg    segment para
; коэффициент текущего делителя PIT
curCount    dw      0
; таблица делителей для цифр '0'..'9'
toneTable   dw      5000, 4500, 4000, 3600, 3200, 2800, 2400, 2000, 1600, 1200
; длительность звука (итераций задержки)
durCount    dw      0ffffh
dseg    ends

cseg    segment para public 'code'
    assume  cs:cseg, ds:dseg, ss:stseg

; main – основная программа
main    proc far
    push    ds
    xor     ax, ax
    push    ax
    mov     ax, dseg
    mov     ds, ax

key_loop:
    call    waitKey         ; ждём клавишу, ASCII в AL
    cmp     al, 27          ; ESC?
    je      exit_prog
    cmp     al, '0'
    jb      key_loop        ; не цифра
    cmp     al, '9'
    ja      key_loop        ; не цифра

    ; индекс цифры = AL - '0'
    mov     bl, al
    sub     bl, '0'
    xor     bh, bh          ; BX = индекс

    ; получаем делитель из таблицы toneTable[BX]
    lea     si, toneTable
    mov     ax, bx
    shl     ax, 1           ; байтовый шаг
    add     si, ax
    mov     ax, [si]
    mov     [curCount], ax

    mov     cx, [durCount]  ; установить длительность
    call    playToneDuration
    jmp     key_loop

exit_prog:
    pop     ds
    mov     ah, 4ch
    int     21h
main    endp

; waitKey – ожидает нажатия клавиши
; выход: 
;   AL = ASCII-код нажатой клавиши
waitKey proc near
    mov     ah, 0
    int     16h
    ret
waitKey endp

; playTone – включает спикер с текущим делителем
playTone proc near
    mov     ax, [curCount]
    mov     dx, ax
    mov     al, 0b6h
    out     43h, al
    mov     al, dl
    out     42h, al
    mov     al, dh
    out     42h, al
    in      al, 61h
    or      al, 03h
    out     61h, al
    ret
playTone endp

; stopTone – выключает спикер
stopTone proc near
    in      al, 61h
    and     al, 0fch
    out     61h, al
    ret
stopTone endp

; delayStep – простая задержка одного шага
delayStep proc near
    nop
    ret
delayStep endp

; playToneDuration – воспроизводит тон в течение cx шагов задержки
; вход:
;   cx = количество итераций delayStep
playToneDuration proc near
    call    playTone
play_loop:
    call    delayStep
    loop    play_loop
    call    stopTone
    ret
playToneDuration endp

cseg    ends
        end     main
