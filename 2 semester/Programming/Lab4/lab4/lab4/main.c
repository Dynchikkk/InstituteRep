#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define SIZE 12

char wrd[SIZE] = "-11101001010";
int prom[SIZE] = {0};
char res[SIZE] = {0};

int main()
{
	_asm
	{
		// from ascii
		mov ecx, SIZE;
		lea eax, [prom];
	FROM_ASCII_LOOP:
		movzx edx, [wrd + ecx - 1];
		mov[eax], edx;
		add eax, 4;
		loop FROM_ASCII_LOOP;

		// to ascii
		mov ecx, SIZE;
		lea eax, [res];
		lea ebx, [prom]
	TO_ASCII_LOOP:
		mov edx, [ebx];
		mov[eax], dl;
		add eax, 1;
		add ebx, 4;
		loop TO_ASCII_LOOP;
	}

	printf("Initial value (ASCII): %s\n", wrd);
	printf("Normal form: ");
	for (int i = 0; i < SIZE; i++)
		printf("%d ", prom[i]);
	printf("\nResult (ASCII): %s\n", res);
}