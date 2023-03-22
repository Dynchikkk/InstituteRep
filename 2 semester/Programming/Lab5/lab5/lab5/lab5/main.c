#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

#define NUM_SIZE 3

// y=a/b+c*d-e
char a[NUM_SIZE] = "-13";
char b[NUM_SIZE] = "124";
char c[NUM_SIZE] = "-24";
char d[NUM_SIZE] = "-41";
char e[NUM_SIZE] = "-48";
int aInt = 0, bInt = 0, cInt = 0, dInt = 0, eInt = 0;

char y[NUM_SIZE * 2] = { 0 };
int yInt = -15;

int znak = 1;
int razr = 1;

int main()
{
    _asm
    {
#pragma region From ASCII
        push a;
        call FROM_ASCII;
        mov aInt, ebx;
        pop a;

        push b;
        call FROM_ASCII;
        mov bInt, ebx;
        pop b;

        push c;
        call FROM_ASCII;
        mov cInt, ebx;
        pop c;

        push d;
        call FROM_ASCII;
        mov dInt, ebx;
        pop d;

        push e;
        call FROM_ASCII;
        mov eInt, ebx;
        pop e;
#pragma endregion

        call CALCULATION;
        call TO_ASCII;

        // Выход из программы 
        jmp EXIT;

#pragma region Functions
        // ------------------- //
    FROM_ASCII:
        push ebp;
        mov ebp, esp;
        mov ecx, NUM_SIZE; // Кладем в ecx размер строки
        lea eax, [ebp + 8]; // кладем в eax ссылку на строку
        mov ebx, 0; //  Итоговое число
    FROM_ASCII_LOOP:
        movzx edx, [eax + ecx - 1]; // конвертируем символ из ASCII в нормальный вид
        push eax; // кладем ссылку на строку, чтобы освободить регистр
        mov eax, '-';  // кладем в eax "-" в нормальном виде =>
        cmp edx, eax; // и сравниваем, не является ли текущий символ "-"
        je MINUS_F; // если да то преходим по метке MINUS
        jmp PLUS_F; // если нет, то переходим по метке PLUS
    MINUS_F:
        mov znak, -1; // меняем знак на отрицательный
        jmp END_FA_LOOP;
    PLUS_F:
        sub edx, 48; // вычитаем 48, чтобы полчить число в привычном виде
        imul edx, razr; // умножаем число на разряд
        add ebx, edx; // приплюсовываем число к итоговому
    END_FA_LOOP:
        mov eax, razr; // умножаем разярд =>
        cdq;
        imul eax, 10;  // на 10 =>
        mov razr, eax; //
        pop eax; // возваращем ссылку на строку из стека
        loop FROM_ASCII_LOOP;
        cdq;
        imul ebx, znak; // умножаем число на знак
        mov razr, 1;
        mov znak, 1;
        pop ebp;
        ret;

        // ------------------- //
    CALCULATION:
        push ebp;
        mov ebp, esp;
        mov eax, aInt;
        mov ebx, bInt;
        cdq;
        idiv ebx;
        push ebx;
        mov eax, cInt;
        mov ebx, dInt;
        imul eax, ebx;
        pop ebx;
        add eax, ebx;
        sub eax, eInt;
        mov yInt, eax;
        pop ebp;
        ret;

        // ------------------- //
    TO_ASCII:
        push ebp;
        mov ebp, esp;
        mov eax, yInt;
        mov ecx, NUM_SIZE * 2;
    DIVIDE:
        cmp eax, 0; // смотрим, отрицательное ли число или нет
        jl MINUS_T; // если да, то перезодим на метку MINUS_T
    PLUS_T:
        cdq;
        mov ebx, 10; // делим число на 10, 
        idiv ebx;    // чтобы получить отдельную цифру 
        add edx, 48;
        push edx;     // заносим 16 младших бит в стек
        jmp END_TA_LOOP;
    MINUS_T:
        mov znak, -1;
        mov ebx, -1; // меняем знак числа
        imul ebx;    // 
    END_TA_LOOP:
        cmp eax, 0;       // смотрим не закончилось ли число
        je END_DIVIDE;    // если закончилось то выходим из цикла
        loop DIVIDE;
    END_DIVIDE:
        mov ebx, NUM_SIZE * 2 + 1; // считаем счетчик 
        sub ebx, ecx;              //
        mov ecx, ebx;              //
        lea esi, [y]; // кладем в eax ссылку на начало y
        cmp znak, -1;      // смотрим не отрицательное ли число
        jne TO_ASCII_LOOP; // если да 
        mov[esi], '-'; // то в начало y кладем -
        inc esi; // 
        dec ecx; // 
    TO_ASCII_LOOP:
        pop ebx; // берем остаток числ из стека
        mov[esi], ebx; // кладем его в y
        inc esi; // 
        loop TO_ASCII_LOOP; 
        mov znak, 1;
        pop ebp;
        ret;
    
#pragma endregion
        
    EXIT:
    }

    printf("Ishod dannye: %d, %d, %d, %d, %d\n", aInt, bInt, cInt, dInt, eInt);
    printf("Result: y = a/b+c*d-e = %s", y);

	return 0;
}
