#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "arrayWork.h"
#include "dataWork.h"

int main()
{
	writeData("1 2 3 4 5 6");

	// Читаем первую строку
	char f[255];
	int len = sizeof(f) / sizeof(char);
	readData(f, len, 0);
	
	// Преобразуем в массив
	/*int s[6];
	reworkData(f, s);*/

	// Преобразуем в массив
	int n[2][3];
	reworkData(f, n[0]);

	/*srand(time(NULL));

	printf("==Var1==\n\n");
	num1_1();
	printf("\n-------------\n");
	num1_2();

	printf("\n\n-------------\n-------------\n\n");

	printf("==Var2==\n\n");
	num2_1();
	printf("\n-------------\n");
	num2_2();*/

	return 0;
}