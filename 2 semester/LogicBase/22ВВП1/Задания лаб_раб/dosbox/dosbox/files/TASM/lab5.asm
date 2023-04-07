data segment
;===========
    aM1 dw 5084h
    aSt dw 0h
    
    bM1 dw 7B24h
    bSt dw 0FFFFh
    
    yM1 dw ?
    ySt dw ?
;=======
data ends

code segment
assume cs:code, ds:data, ss:nothing
start:      mov ax, data
        mov ds, ax
;==========
    mov AX, aM1
    mov BX, bM1
    mov CX, aSt
    mov DX, bSt
    add AX, BX
    ADC CX, DX
    mov yM1, AX
    mov ySt, CX
;==========
quit:    mov ax, 4c00h
      int 21h
code ends
end start