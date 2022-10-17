#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int num_2a()
{
	// создаем массив и задаем значения элемантам
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	printf("Array before:\n\t");
	for (int* pArr = a; pArr < &a[lenA]; pArr++)
	{
		*pArr = random();
		printf("%d ", *pArr);
	}

	printf("\nInsert dop number: ");
	int k = 0;
	scanf("%d", &k);

	printf("Array after:\n\t");
	for (int* pArr = a; pArr < &a[lenA]; pArr++)
	{
		if (*pArr % k == 0)
			*pArr = 0;
		printf("%d ", *pArr);
	}

	return 0;
}

int num_2b()
{
	int n[6][5];
	int colR = sizeof(n) / sizeof(n[0]);
	int colC = sizeof(n[0]) / sizeof(n[0][0]);

	int* finEl = n[0] + colC * colR - 1;

	printf("Array:\n");
	for (int* pArr = n[0], i = 1; pArr <= finEl; pArr++, i++)
	{
		*pArr = random();
		printf("%d ", *pArr);

		if (i % colC == 0)
			printf("\n");
	}

	int maxSum = 0;
	int rowNum = 0;
	int i = 0;

	for (int* pArr = n[0]; pArr <= finEl; pArr += colC)
	{
		int rowSum = summ(pArr, colC);

		if (maxSum < rowSum)
		{
			maxSum = rowSum;
			rowNum = i;
		}

		i++;
	}

	printf("\nSum: %d - %d", rowNum + 1, maxSum);

	return 0;
}