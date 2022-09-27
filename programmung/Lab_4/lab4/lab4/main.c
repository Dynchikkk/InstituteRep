#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "random.h"

void number1_1();
void number1_2();
void number2_1();
void number2_2();

int main()
{
	printf("Var1\n\n");
	number1_1();
	printf("\n--------\n");
	number1_2();

	printf("\n");
	printf("\n--------\n");
	printf("\n");

	printf("Var2\n\n");
	number2_1();
	printf("\n--------\n");
	number2_2();

	return 0;
}
