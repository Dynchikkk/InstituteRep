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
	int j = 0, i = 0;

	for (int* pArr = n[0]; pArr <= finEl; pArr += colC)
	{
		int rowSum = 0;
		int sum = summ(pArr, colC);
		rowSum += sum;

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

//void number2_1()
//{
//	// создаем массив и задаем значения элемантам
//	int a[20];
//	int lenA = sizeof(a) / sizeof(int);
//	printf("Array before: ");
//	for (int i = 0; i < lenA; i++)
//	{
//		a[i] = random();
//		printf("%d ", a[i]);
//	}
//
//	printf("\nInsert dop number: ");
//	int k = 0;
//	scanf("%d", &k);
//
//	printf("Array after: ");
//	// заменяем эдементы кратные k на 0
//	for (int i = 0; i < lenA; i++)
//	{
//		if (a[i] % k == 0)
//		{
//			a[i] = 0;
//		}
//
//		printf("%d ", a[i]);
//	}
//}
//
//void number2_2()
//{
//	// создаем массив и задаем значения элемантам
//	int n[6][5];
//	int colR = sizeof(n) / sizeof(n[0]);
//	int colC = sizeof(n[0]) / sizeof(n[0][0]);
//	printf("Array:\n");
//	for (int i = 0; i < colR; i++)
//	{
//		for (int j = 0; j < colC; j++)
//		{
//			n[i][j] = random();
//			printf("%d ", n[i][j]);
//		}
//		printf("\n");
//	}
//
//	// находим строку с наибольшей суммой
//	int maxSum = 0;
//	int rowNum = 0;
//	for (int i = 0; i < colR; i++)
//	{
//		int rowSum = 0;
//		for (int j = 0; j < colC; j++)
//		{
//			rowSum += n[i][j];
//		}
//
//		if (maxSum < rowSum)
//		{
//			maxSum = rowSum;
//			rowNum = i;
//		}
//	}
//	printf("\nRow with max sum - %d (%d)\n", rowNum + 1, maxSum);
//
//	int maxSumCOl = 0;
//	int colNum = 0;
//	for (int i = 0; i < colC; i++)
//	{
//		int colSum = 0;
//		for (int j = 0; j < colR; j++)
//		{
//			colSum += n[j][i];
//		}
//
//		if (maxSumCOl < colSum)
//		{
//			maxSumCOl = colSum;
//			colNum = i;
//		}
//	}
//	printf("\nCol with max sum - %d (%d)\n", colNum + 1, maxSumCOl);
//}
