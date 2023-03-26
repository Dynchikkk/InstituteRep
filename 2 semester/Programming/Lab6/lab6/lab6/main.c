#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

#define alow(num)     \
{                    \
		__asm mov eax, num \
		__asm inc eax      \
		__asm imul eax, 5     \
}

#define ahigh(num)    \
{                        \
		__asm mov eax, num \
		__asm imul eax, 2     \
		__asm dec eax     \
}

// y=a+b-c*d/e
#define func(a, b, c, d, e, res) \
{                          \
		__asm push res \
		__asm mov eax, a         \
		__asm add eax, b         \
		__asm push eax          \
		__asm mov eax, c         \
		__asm imul eax, d           \
		__asm mov ebx, e         \
		__asm cdq               \
		__asm xor edx, edx       \
		__asm idiv ebx           \
		__asm pop ecx            \
		__asm sub ecx, eax       \
		__asm pop res \
		__asm mov[res], ecx          \
}

int dannye[5] = { 1, 2, 3, 4, 5 }; //a, b, c, d, e
int izmenArg[10] = { 0 };
int y[10] = { 0 };

int main()
{
	_asm {
		mov ecx, 10;
		lea eax, [izmenArg];
		mov edx, [dannye];
		mov[eax], edx;
		add eax, 4;
		lea ebx, [y];
	CALCULATION:
		push ecx;
		push eax;
		push ebx;
		func([dannye], [dannye + 4], [dannye + 8], [dannye + 12], [dannye + 16], ebx);// считаем функцию
		pop ebx;
		pop eax;
		pop ecx;
		cmp ecx, 6; // —читаем а
		jl MEN;
	BOL:
		push ecx;
		push eax;
		push ebx;
		ahigh(ecx);
		jmp EXIT;
	MEN:
		push ecx;
		push eax;
		push ebx;
		alow(ecx);
	EXIT:
		mov[dannye], eax; // замен€ем а
		pop ebx;
		pop eax;
		pop ecx;
		mov edx, [dannye];
		mov[eax], edx; // заносим а в список измененных аргументов
		add eax, 4;
		add ebx, 4;
		loop CALCULATION;
	}

	for (int i = 0; i < 10; i++)
	{
		printf("a = %d => y=%d+%d-%d*%d/%d => y = %d\n", izmenArg[i], izmenArg[i], dannye[1], dannye[2], dannye[3], dannye[4], y[i]);
	}

	return 0;
}