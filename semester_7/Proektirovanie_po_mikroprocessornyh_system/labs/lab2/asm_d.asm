start:
    ; ---------- fill array ----------
    MOV A, #0BH       ; начальное значение = 11h
    MOV R0, #047H      ; адрес начала массива
    MOV R1, #0AH       ; количество элементов = 10

L1:
    MOV @R0, A         ; сохранить A по адресу R0
    INC R0             ; R0 = R0 + 1 (следующий адрес)
    ADD A, #021H       ; A = A + 33 (следующее значение)
    DJNZ R1, L1        ; декремент R1; если не ноль -> L1

    ; ---------- initialize search ----------
    MOV R0, #047H      ; сброс указателя на начало массива
    MOV R1, #0AH       ; сброс счётчика элементов = 10
    MOV R3, #00H       ; R3 = счётчик подходящих элементов (иниц.)

    ; ---------- pre-condition loop (while R1 != 0) ----------
NEXT:
    CJNE R1, #0, CONT  ; если R1 != 0 -> CONT (обработать элемент)
    SJMP CHECK_RES     ; если R1 == 0 -> проверить результат

    ; ---------- process current element ----------
CONT:
    MOV A, @R0         ; load current element into A
    ANL A, #1          ; isolate bit0 -> check odd/even
    JNZ SKIP           ; if odd -> skip

    ; проверяем: A < 150 (0x96) — для беззнаковых чисел
  MOV A, @R0
    CLR C
    SUBB A, #096H      ; A = A - 150 ; если borrow (C=1) => A < 150
    JNC SKIP           ; JNC = если NO carry (A >= 150) -> пропустить

    ; Если дошли сюда — число чётное и <150
    INC R3             ; увеличиваем счётчик

    ; ---------- переход к следующему элементу ----------
SKIP:
    INC R0
    DEC R1
    SJMP NEXT

    ; ---------- check result ----------
CHECK_RES:
    CJNE R3, #00, GOOD ; если R3 != 0 -> GOOD (нашли >=1 подходящие)
    ; иначе R3 == 0 -> ERR

ERR:
    SETB P3.3
    SETB P3.4
    MOV P1, #10000110B ; вывести "E"
    MOV P1, #0FFH

    CLR P3.3
    MOV P1, #10101111B ; вывести "r"
    MOV P1, #0FFH

    SETB P3.3
    CLR P3.4
    MOV P1, #10101111B ; вывести "r"
    MOV P1, #0FFH

    SJMP ERR           ; бесконечный цикл (ERR)

GOOD:
    SETB P3.3
    SETB P3.4
    MOV P1, #11000010B ; вывести "G"
    MOV P1, #0FFH

    SJMP GOOD          ; бесконечный цикл (GOOD)
