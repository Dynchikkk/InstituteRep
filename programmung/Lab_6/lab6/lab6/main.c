#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "func.h"

int main()
{
	srand(time(NULL));
	printf("Var1\n\n");
	num_1a();
	printf("\n--------\n");
	num_1b();

	printf("\n");
	printf("\n--------\n");
	printf("\n");

	printf("Var2\n\n");
	num_2a();
	printf("\n--------\n");
	num_2b();
	return 0;
}