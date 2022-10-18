#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int num1_1()
{
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	fillArray(a, lenA);
	writeOneArray(a, lenA);

	int sum = 0;
	int n = 1;

	for (int* pArr = a; pArr < &a[lenA]; pArr++)
	{
		sum += n * *pArr;
		n *= -1;
	}
	printf("\nSum: %d", sum);

	return 0;
}

int num1_2()
{
	int x[6][6];
	int colR = sizeof(x) / sizeof(x[0]);
	int colC = sizeof(x[0]) / sizeof(x[0][0]);

	//int* finEl = *x + colC * colR - 1;
	fillArray(x, colR * colC);
	writeTwoArray(x, colR, colC);

	int k = 0;
	printf("Insert dop num: ");
	scanf("%d", &k);

	int sum = 0;

	printf("Elements which indexes sum equals '%d': ", k);
	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			if (i + j == k)
			{
				int el = *(*(x + i) + j);
				sum += el;
				printf("%d ", el);
			}
		}
	}

	printf("\nSum: %d", sum);

	return 0;
}