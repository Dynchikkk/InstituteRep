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
	_asm {
#pragma region StandartWay
		mov ax, a;
		mov bx, b;
		mov cx, c;

		sar bx, 2; // B/4
		jo ANOTHERWAY;
		add bx, b; // B/4 + B
		jo ANOTHERWAY;

		sub ax, bx; // A - B/4 - B
		jo ANOTHERWAY;

		sar cx, 2; // C/4
		add ax, cx; // A - B/4 - B + C/4
		jo ANOTHERWAY;

		sal ax, 2;
		jo ANOTHERWAY;
		jmp ALLGOOD;
#pragma endregion

#pragma region AnotherWay
	ANOTHERWAY:
		mov ax, a;
		mov bx, b;
		mov cx, c;

		sar bx, 4;
		mov dx, b;
		sar dx, 2;
		add bx, dx;
		xor dx, dx;

		sar ax, 2;
		sub ax, bx;

		sar cx, 4;
		add ax, cx;

		sal ax, 4;

#pragma endregion

	ALLGOOD:
		inc good;

	mov y, ax;

	EXIT:

	}

	printf("%d %d", y, good);
}