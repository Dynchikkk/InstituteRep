#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int a, b, c, d, e, y;
int boolean;

// (a>b)and(c<>d)
// y=a+b-c*d/e
// y=a*b+c-d/e

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
		mov eax, a;
		cmp eax, b;
		seta ebx; // if a > b => ebx = 1
		mov eax, c;
		cmp eax, d;
		setne edx; // if c != d => edx = 1
		and ebx, edx; // if ebx and edx => ebx = 1

		cmp ebx, 1;
		je UR1; // if ebx == 1 => jmp UR1
		
		jmp UR2; // else

	UR1: // y=a+b-c*d/e
		mov eax, c;
		cdq;
		imul c;
		xor edx, edx;
		cdq;
		idiv e;
		push eax;
		mov eax, a;
		add eax, b;
		pop ebx;
		sub eax, ebx;
		mov y, eax;
		jmp EXIT;

	UR2: // y=a*b+c-d/e
		mov eax, a;
		cdq;
		imul b;
		add eax, c;
		push eax;
		mov eax, d;
		xor edx, edx;
		cdq;
		idiv e;
		pop ecx;
		sub ecx, eax;
		mov y, ecx;

	EXIT:
	}

	printf("Result: %d", y);

	return 0;
}
