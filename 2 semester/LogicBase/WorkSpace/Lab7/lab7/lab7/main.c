#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

short a = 0x0FFF;
short b = 0x2000;
short c = 0x0DFF;
short y;

short good = 0;

//Y = 4 * (А − 1/4 * В - B + С / 4)

void main()
{
    int result;
    int damage = 10;
    int resist = 10;

    __asm
    {
        mov ebx, resist
        mov eax, 100
        sub eax, ebx
        imul eax, damage
        mov ebx, 100
        cdq
        div ebx
        mov result, eax
    }

	printf("%d", result);
}