#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

#define NUM_SIZE 3

// y=a/b+c*d-e
char a[NUM_SIZE] = { 0 };
char b[NUM_SIZE] = { 0 };
char c[NUM_SIZE] = { 0 };
char d[NUM_SIZE] = { 0 };
char e[NUM_SIZE] = { 0 };
int aInt = 0, bInt = 0, cInt = 0, dInt = 0, eInt = 0;

char y[NUM_SIZE * 2] = { 0 };
int yInt = -15;

int znak = 1;
int razr = 1;

int main()
{
#pragma region Read Values
    printf("Insert a (-99, +99): ");
    fgets(a, 4, stdin);
    getchar();

    printf("Insert b (-99, +99): ");
    fgets(b, 4, stdin);
    getchar();

    printf("Insert c (-99, +99): ");
    fgets(c, 4, stdin);
    getchar();

    printf("Insert d (-99, +99): ");
    fgets(d, 4, stdin);
    getchar();

    printf("Insert e (-99, +99): ");
    fgets(e, 4, stdin);
    getchar();
#pragma endregion

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

        // ����� �� ��������� 
        jmp EXIT;

#pragma region Functions
        // ------------------- //
    FROM_ASCII:
        push ebp;
        mov ebp, esp;
        mov ecx, NUM_SIZE; // ������ � ecx ������ ������
        lea eax, [ebp + 8]; // ������ � eax ������ �� ������
        inc eax;
        cmp [eax - 1], '-'; // ����������, �� �������� �� ������� ������ "-"
        jz MINUS_F; // ���� �� �� �������� �� ����� MINUS
        jmp SEPARATE;
    MINUS_F:
        mov znak, -1; // ������ ���� �� �������������
    SEPARATE:
        cmp[eax], '\0'; // �������, �� ����������� �� ������
        je END_FA;      //
        cmp[eax], '\n'; //
        je END_FA;      // ���� ��, �� ������� �� �����
        movzx edx, [eax]; // ������������ ������ �� ASCII � ���������� ���
        sub edx, 48; // �������� 48, ����� ������� ����� � ��������� ����
        push edx;
    END_FA_LOOP:
        inc eax;
        loop SEPARATE;
    END_FA:
        mov ebx, 0; //  �������� �����
        mov edx, NUM_SIZE; // ������� ������� 
        sub edx, ecx;      //
        mov ecx, edx;      //
    TO_INT:
        pop eax; // �������� ����� �� �������
        imul eax, razr; // �������� �� �� ������
        add ebx, eax; // ��������� � ��������� �����
        mov eax, razr; // �������� ������
        mov edx, 10;   //
        imul edx;      //  
        mov razr, eax; // 
        loop TO_INT;
        cdq;
        imul ebx, znak; // �������� ����� �� ����
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
        cmp eax, 0; // �������, ������������� �� ����� ��� ���
        jl MINUS_T; // ���� ��, �� ��������� �� ����� MINUS_T
    PLUS_T:
        cdq;
        mov ebx, 10; // ����� ����� �� 10, 
        idiv ebx;    // ����� �������� ��������� ����� 
        add edx, 48;
        push edx;
        jmp END_TA_LOOP;
    MINUS_T:
        mov znak, -1;
        mov ebx, -1; // ������ ���� �����
        imul ebx;    // 
    END_TA_LOOP:
        cmp eax, 0;       // ������� �� ����������� �� �����
        je END_DIVIDE;    // ���� ����������� �� ������� �� �����
        loop DIVIDE;
    END_DIVIDE:
        mov ebx, NUM_SIZE * 2 + 1; // ������� ������� 
        sub ebx, ecx;              //
        mov ecx, ebx;              //
        lea esi, [y]; // ������ � eax ������ �� ������ y
        cmp znak, -1;      // ������� �� ������������� �� �����
        jne TO_ASCII_LOOP; // ���� �� 
        mov[esi], '-'; // �� � ������ y ������ -
        inc esi; // 
        dec ecx; // 
    TO_ASCII_LOOP:
        pop ebx; // ����� ������� ���� �� �����
        mov[esi], ebx; // ������ ��� � y
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
