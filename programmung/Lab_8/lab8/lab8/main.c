#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "arrayWork.h"

int main()
{
	srand(time(NULL));

	printf("==Var1==\n\n");
	num1_1();
	printf("\n-------------\n");
	num1_2();

	printf("\n\n-------------\n-------------\n\n");

	printf("==Var2==\n\n");
	num2_1();
	printf("\n-------------\n");
	num2_2();

	return 0;
}