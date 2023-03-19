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
int yInt = 0;

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

        // ����� �� ��������� 
        jmp EXIT;

#pragma region Functions
        // ------------------- //
    FROM_ASCII:
        push ebp;
        mov ebp, esp;
        mov ecx, NUM_SIZE; // ������ � ecx ������ ������
        lea eax, [ebp + 8]; // ������ � eax ������ �� ������
        mov ebx, 0; //  �������� �����
    FROM_ASCII_LOOP:
        movzx edx, [eax + ecx - 1]; // ������������ ������ �� ASCII � ���������� ���
        push eax; // ������ ������ �� ������, ����� ���������� �������
        mov eax, 45;  // ������ � eax "-" � ���������� ���� =>
        cmp edx, eax; // � ����������, �� �������� �� ������� ������ "-"
        je MINUS_F; // ���� �� �� �������� �� ����� MINUS
        jmp PLUS_F; // ���� ���, �� ��������� �� ����� PLUS
    MINUS_F:
        mov znak, -1; // ������ ���� �� �������������
        jmp END_FA_LOOP;
    PLUS_F:
        sub edx, 48; // �������� 48, ����� ������� ����� � ��������� ����
        imul edx, razr; // �������� ����� �� ������
        add ebx, edx; // �������������� ����� � ���������
    END_FA_LOOP:
        mov eax, razr; // �������� ������ =>
        imul eax, 10;  // �� 10 =>
        mov razr, eax; //
        pop eax; // ���������� ������ �� ������ �� �����
        loop FROM_ASCII_LOOP;
        imul ebx, znak; // �������� ����� �� ����
        mov razr, 1;
        mov znak, 1;
        pop ebp;
        ret;

        // ------------------- //
    TO_ASCII:
        push ebp;
        mov ebp, esp;
        mov ecx, 0;
    TO_ASCII_LOOP:
        mov eax, yInt; // �������� �����
        cmp eax, 0;
        jnl PLUS_T;
        jmp MINUS_T;
    PLUS_T:

    MINUS_T:
        imul -1;
    END_TA_LOOP:
        inc ecx;
        test ecx, ecx;
        jnz TO_ASCII_LOOP;


        pop ebp;
        ret;
#pragma endregion

    EXIT:
    }

    printf("%d, %d, %d, %d, %d", aInt, bInt, cInt, dInt, eInt);

	return 0;
}
