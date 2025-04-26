;-------------------------------------------------------------------------------
; До (C) - Октава 0 → 0 
; Ре (D) - Октава 0 → 1  
; Ми (E) - Октава 0 → 2  
; Фа (F) - Октава 0 → 3  
; Соль (G) - Октава 0 → 4  
; Ля (A) - Октава 0 → 5  
; Си (B) - Октава 0 → 6 
; До (C) - Октава 1 → 7  
; Ре (D) - Октава 1 → 8  
; Ми (E) - Октава 1 → 9  
; Фа (F) - Октава 1 → 10  
; Соль (G) - Октава 1 → 11  
; Ля (A) - Октава 1 → 12  
; Си (B) - Октава 1 → 13  
; До (C) - Октава 2 → 14  
; Ре (D) - Октава 2 → 15  
; Ми (E) - Октава 2 → 16  
; Фа (F) - Октава 2 → 17  
; Соль (G) - Октава 2 → 18  
; Ля (A) - Октава 2 → 19  
; Си (B) - Октава 2 → 20  
;-------------------------------------------------------------------------------

stseg   segment para stack
    dw      256 dup(?)
stseg   ends

;-------------------------------------------------------------------------------
dseg    segment para
; текущий делитель для PIT
curCount    dw      0
; длительность ноты (итераций delayStep)
durCount    dw      0
; длительность паузы в итерациях delayStep (~1 секунда)
pauseCount  dw      60000
; --------------------------
noteTable   dw  36716,32704,29188,25956,23142,20634,18390   ; C0(0)-B0(6)
            dw  18358,16352,14594,12978,11571,10317, 9195   ; C1(7)-B1(13) 
            dw   9121, 8126, 7239, 6449, 5719, 5102, 4560   ; C2(14)-B2(20)
            dw   4560, 4063, 3619, 3224, 2859, 2551, 2280   ; C3(21)-B3(27)
; --------------------------
melody      db     8,     8,    12,     8,     8,    13,     8,     8,    14,     8,     8,    12,    8,      8,    13,     7
            db     8,     8,    12,     8,     8,    13,     8,     8,    14,     8,     8,    12,    8,      8,    13,     7
            db     8,     8,    12,     8,     8,    13,     8,     8,    14,     8,     8,    12,    8,      8,    13,     7
            db     8,     8,    12,     8,     8,    13,     8,     8,    14,     8,     8,    12,    8,      8,    13,     7
            db     8,     8,    12,     8,     8,    13,     8,     8,    14,     8,     8,    12,    8,      8,    13,     7
            ; 6                                                                                                          
            db    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,    20,  0ffh,    20,  0ffh,  0ffh,  0ffh,    15,  0ffh,    15,  0ffh 
            db    15,  0ffh,    15,  0ffh,    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,    12,  0ffh 
            db    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    18,  0ffh,    18,  0ffh,  0ffh,  0ffh,    14,  0ffh,    14,  0ffh 
            db    14,  0ffh,    14,  0ffh,    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    12,  0ffh 
            db    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    20,  0ffh,    20,  0ffh,  0ffh,  0ffh,    21,  0ffh,    21,  0ffh 
            db    21,  0ffh,    21,  0ffh,    22,  0ffh,  0ffh,  0ffh,    21,    20,  0ffh,  0ffh,    14,  0ffh,    11,  0ffh 
            db    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    19,  0ffh,    19,  0ffh,  0ffh,  0ffh,    15,  0ffh,    15,  0ffh 
            db    15,  0ffh,    15,  0ffh,    15,  0ffh,  0ffh,  0ffh,    16,    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh 
            db    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,    19,  0ffh,    19,  0ffh,  0ffh,  0ffh,    15,  0ffh,    15,  0ffh
            db    15,  0ffh,    15,  0ffh,    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,    12,  0ffh 
            db    14,  0ffh,  0ffh,  0ffh,    15,    15,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    14 
            db    14,  0ffh,    14,  0ffh,    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    12,  0ffh,    12,  0ffh,  0ffh,  0ffh   
            db    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,    19,  0ffh,    19,  0ffh,  0ffh,  0ffh,    20,  0ffh,    20,  0ffh   
            db    20,  0ffh,    20,  0ffh,    21,  0ffh,  0ffh,  0ffh,    20,    19,  0ffh,  0ffh,    21,  0ffh,    18,  0ffh   
            db    18,    17,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    19,    19,  0ffh,  0ffh,  0ffh,    15,  0ffh,    15,  0ffh   
            db    15,  0ffh,    15,  0ffh,    15,  0ffh,  0ffh,  0ffh,    16,     15, 0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh 
            ; 22
            db    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    18,    16,    14,    11,    19,    16,    14,    11   
            db    14,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    14,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    15,    14,    13,    14   
            db    13,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    11,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    12,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh,    15,    14,    15,    16   
            ; 30
            db    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,    12,    13,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,    14,    14,  0ffh,  0ffh,    14,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh   
            db    16,  0ffh,  0ffh,  0ffh,    16,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    16,  0ffh,  0ffh,  0ffh   
            db    16,    16,  0ffh,  0ffh,    17,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    16,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,  0ffh   
            db    15,  0ffh,  0ffh,  0ffh,    14,    15,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh,  0ffh 
            ; 38
            db    15,  0ffh,  0ffh,  0ffh,    15,  0ffh,  0ffh,   0ffh,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 
            db    17,    14,    14,    18,    14,    14,    19,     14,   14,    17,    14,    14,    18,    16,    14,    14 

; --------------------------
noteCount   equ     720
defaultDur  dw      35000
; --------------------------
dseg    ends

;-------------------------------------------------------------------------------
cseg    segment para public 'code'
    assume cs:cseg, ds:dseg, ss:stseg

;-------------------------------------------------------------------------------
; main – проигрывает мелодию и выходит
main    proc far
    ; инициализация сегмента данных
    push    ds
    xor     ax, ax
    push    ax
    mov     ax, dseg
    mov     ds, ax

    ; установить длительность ноты и паузу
    mov     ax, [defaultDur]
    mov     [durCount], ax
    mov     ax, [pauseCount]
    mov     [pauseCount], ax
    xor     si, si            ; индекс в melody 0..noteCount-1

play_sequence:
    ; взять индекс ноты
    mov     al, [melody + si]
    cmp     al, 0FFh
    je      pause_only

    mov     bl, al
    xor     bh, bh
    ; получить делитель noteTable[bl]
    lea     di, noteTable
    mov     ax, bx
    shl     ax, 1
    add     di, ax
    mov     ax, [di]
    mov     [curCount], ax

    ; воспроизведение ноты
    mov     cx, [durCount]
    call    playToneDuration

    ; пауза без звука
    mov     cx, [pauseCount]
    call    silence

    jmp next_note

pause_only:
    ; отключить звук перед длинной паузой
    call    stopTone

    ; длинная пауза
    mov     cx, [pauseCount]
    call    silence
    mov     cx, [pauseCount]
    call    silence

next_note:
    inc     si
    cmp     si, noteCount
    jb      play_sequence

    ; выход из программы
    pop     ds
    mov     ah, 4Ch
    int     21h
main    endp

;-------------------------------------------------------------------------------
; playTone – включает спикер по curCount
playTone proc near
    mov     ax, [curCount]
    mov     dx, ax
    mov     al, 0B6h
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

;-------------------------------------------------------------------------------
; stopTone – выключает спикер
stopTone proc near
    in      al, 61h
    and     al, 0FCh
    out     61h, al
    ret
stopTone endp

;-------------------------------------------------------------------------------
; delayStep – одна итерация задержки
delayStep proc near
    nop
    ret
delayStep endp

;-------------------------------------------------------------------------------
; playToneDuration – проигрывает тон curCount в течение cx шагов delayStep
playToneDuration proc near
    call    playTone
tone_loop:
    call    delayStep
    loop    tone_loop
    call    stopTone
    ret
playToneDuration endp

;-------------------------------------------------------------------------------
; silence – пауза без звука, cx шагов delayStep
silence proc near
silence_loop:
    call    delayStep
    loop    silence_loop
    ret
silence endp

cseg    ends
        end     main
