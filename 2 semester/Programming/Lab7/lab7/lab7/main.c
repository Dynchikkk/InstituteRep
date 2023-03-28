#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int a = 1, b = 2, c = 3, d = 4, e = 0;
int y = 0;

char input[] = "%d %d %d %d %d"; // a, b, c, d, e
char output[] = "y = %d";

// y=a-b+c*d/e
int main()
{
	printf("Func: y=a-b+c*d/e\n");
	printf("Insert a, b, c, d, e: ");
	_asm {
		lea eax, e;
		push eax;
		lea eax, d;
		push eax;
		lea eax, c;
		push eax;
		lea eax, b;
		push eax;
		lea eax, a;
		push eax;
		lea eax, input;
		push eax;

		call scanf;

		pop ebx;
		pop ebx;
		pop ebx;
		pop ebx;
		pop ebx;
		pop ebx;

		mov eax, a;
		sub eax, b;
		push eax;
		mov eax, c;
		imul eax, d;
		mov ecx, e;
		idiv ecx;
		pop ecx;
		add eax, ecx;
		mov y, eax;

		push y;
		lea eax, output;
		push eax;
		call printf;
		pop ebx;
		pop ebx;
	}

	return 0;
}