#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "arrayWork.h"

int main()
{
	srand(time(NULL));

	/*int a[20];
	fillArray(a, 20);*/

	int b[5][5];
	fillArray(b, 25);
	writeTwoArray(b, 5, 5);


	return 0;
}