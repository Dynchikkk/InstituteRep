#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int num2_1()
{
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	fillArray(a, lenA);
	writeOneArray(a, lenA);

	printf("\nInsert dop number: ");
	int k = 0;
	scanf("%d", &k);

	printf("\n");
	for (int* pArr = a; pArr < &a[lenA]; pArr++)
	{
		if (*pArr % k == 0)
			*pArr = 0;
	}
	writeOneArray(a, lenA);

	return 0;
}

int num2_2()
{
	int n[6][5];
	int colR = sizeof(n) / sizeof(n[0]);
	int colC = sizeof(n[0]) / sizeof(n[0][0]);

	fillArray(n, colR * colC);
	writeTwoArray(n, colR, colC);

	int maxSum = 0;
	int rowNum = 0;
	int i = 0;

	int* finEl = n[0] + colC * colR - 1;
	for (int* pArr = n[0]; pArr <= finEl; pArr += colC)
	{
		int rowSum = arraySum(pArr, colC);

		if (maxSum < rowSum)
		{
			maxSum = rowSum;
			rowNum = i;
		}

		i++;
	}

	printf("Max sum: %d - %d\n", rowNum + 1, maxSum);

	return 0;
}