start:
    MOV A, #0Bh        ; initial value = 11 (decimal)
    MOV R0, #043H      ; start address of array
    MOV R1, #0AH       ; number of elements = 10

; ---------- fill array ----------
L1:
    MOV @R0, A         ; store A into [R0]
    INC R0             ; R0 = R0 + 1 (next address)
    ADD A, #021H       ; A = A + 33 (next value)
    DJNZ R1, L1        ; decrement R1; if not zero -> loop

; ---------- initialize search ----------
    MOV R0, #043H      ; reset pointer to array start
    MOV R1, #0AH       ; reset counter = 10
    MOV R3, #0FFH      ; R3 = current minimum (init to 255 / "not set")

; ---------- pre-condition loop (while R1 != 0) ----------
NEXT:
    CJNE R1, #0, CONT  ; if R1 != 0 -> CONT (process element)
    SJMP CHECK_RES     ; if R1 == 0 -> done, check result

; ---------- process current element ----------
CONT:
    MOV A, @R0         ; load current element into A
    ANL A, #1          ; isolate bit0 -> check odd/even
    JNZ SKIP           ; if odd -> skip

    MOV A, @R0
    CLR C
    SUBB A, #096H      ; A = A - 150 ; if borrow -> A < 150
    JNC SKIP           ; if no carry (A >= 150) -> skip

    MOV A, @R0         ; reload original element into A
    CLR C
    SUBB A, R3         ; A - R3 ; if borrow -> A < R3 (unsigned)
    JC NEWMIN          ; if A < R3 -> update minimum

    SJMP SKIP

NEWMIN:
    MOV A, @R0         ; load current element
    MOV R3, A          ; save it into R3 (current minimum)

; ---------- move to next element ----------
SKIP:
    INC R0             
	DEC R1
    SJMP NEXT           
; ---------- check result ----------
CHECK_RES:
    CJNE R3, #0FFH, GOOD ; if R3 != 0FFh -> minimum found

; ---------- ERR: no valid numbers ----------
ERR:
    SETB P3.3
    SETB P3.4
    MOV P1, #10000110B ; display "E"
    MOV P1, #0FFH

    CLR P3.3
    MOV P1, #10101111B ; display "r"
    MOV P1, #0FFH

    SETB P3.3
    CLR P3.4
    MOV P1, #10101111B ; display "r"
    MOV P1, #0FFH

    JMP ERR            ; infinite loop

; ---------- GOOD: minimum found ----------
GOOD:
    SETB P3.3
    SETB P3.4
    MOV P1, #11000010B ; display "G"
    MOV P1, #0FFH

    JMP GOOD           ; infinite loop
