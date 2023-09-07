#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int arr[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

int ind_max = 0;
int ind_min = 0;


int main()
{
	_asm
	{
		//min
		mov ecx, 0;
		lea eax, [arr];
		mov ebx, [eax]
	MIN:
		cmp ebx, [eax];
		jl N1;
		mov ebx, [eax];
		mov ind_min, ecx;
	N1:
		add eax, 4;
		inc ecx;
		cmp ecx, 10;
		jl MIN;

		//max
		mov ecx, 0;
		lea eax, [arr];
		mov ebx, [eax];
	MAX:
		cmp ebx, [eax];
		jg N2;
		mov ebx, [eax];
		mov ind_max, ecx;
	N2:
		add eax, 4;
		inc ecx;
		cmp ecx, 10;
		jl MAX;
		
		//swap
		lea eax, arr;
		mov edi, ind_min;
		mov esi, ind_max;
		mov ebx, [eax + edi * 4];
		mov edx, [eax + esi * 4];
		mov [eax + edi * 4], edx;
		mov[eax + esi * 4], ebx;
	}

	for (int i = 0; i < 10; i++)
	{
		printf("%d ", arr[i]);
	}

	return 0;
}
