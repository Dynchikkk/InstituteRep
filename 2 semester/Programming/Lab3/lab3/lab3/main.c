#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define EXTERNAL_RES_SIZE 10
#define INTERNAL_RES_SIZE 3

//y = (a + b - c) * d / e

int a, b, c, d, e, y;
int h = 5;
int res[EXTERNAL_RES_SIZE][INTERNAL_RES_SIZE] = {0};
int externalLevel = 0;
//int internalLevel = 0;

int main()
{
#pragma region Numbers Input
	printf("Insert a: ");
	scanf("%d", &a);

	printf("Insert b: ");
	scanf("%d", &b);

	printf("Insert c: ");
	scanf("%d", &c);

	printf("Insert d: ");
	scanf("%d", &d);

	printf("Insert e: ");
	scanf("%d", &e);
#pragma endregion

	_asm
	{
		mov cx, EXTERNAL_RES_SIZE;
	FOR:
		// calculating
		mov eax, a;
		add eax, b;
		sub eax, c;
		cdq;
		imul d;
		cdq;
		idiv e;
		mov y, eax;

		// fill array
		mov eax, [externalLevel];
		mov ebx, INTERNAL_RES_SIZE;
		cdq;
		imul ebx;
		mov edx, externalLevel;
		mov[res + 4 * eax + 0], edx;
		mov edx, a;
		mov[res + 4 * eax + 4], edx;
		mov edx, y;
		mov[res + 4 * eax + 8], edx;

		// a += h
		mov eax, a;
		add eax, h;
		mov a, eax;
		// externalLevel++
		mov eax, externalLevel;
		add eax, 1;
		mov externalLevel, eax;
		dec cx;

		jnz FOR;
	}

	for (int i = 0; i < EXTERNAL_RES_SIZE; i++)
		printf("num = %d\ta = %d\ty = %d\n", res[i][0], res[i][1], res[i][2]);

}