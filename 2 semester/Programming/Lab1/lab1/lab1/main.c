#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int y = 0;

int prom1 = 0;

int main()
{
	printf("Insert 5 num:\n");
	scanf("%d %d %d %d %d", &a, &b, &c, &d, &e);

	//y=a + b - c*d/e

	_asm
	{
		// a + b
		mov eax, a;
		add eax, b;
		mov prom1, eax;
		
		// c * d
		mov eax, c;
		imul d;

		// c*d/e
		mov edx, 0;
		idiv e;

		// a + b - c*d/e
		mov ecx, prom1;
		sub ecx, eax;

		mov y, ecx;
	}

	printf("Result: %d", y);

	return 0;
}
