#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

char wrd[10] = "012";

int main()
{
	_asm
	{
		mov al, [wrd];
		mov dl, [wrd + 1];
		mov cl, [wrd + 2];
	}
}