#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#define MAX_ARR_LEN 20
#define MAX_STR_LEN 100

int num2_1()
{
	//загатовленный массив 20 34 35 65 75 87 64 32 15 89 65 78 34 12 11 99 37 69 42 55
	int a[MAX_ARR_LEN];

	// Заполняем data
	char line[MAX_STR_LEN];
	fgets(line, MAX_STR_LEN, stdin);
	clean();
	writeData(line);

	// Преобразуем data
	char getsLine[MAX_STR_LEN];
	readData(getsLine, MAX_STR_LEN, 0);
	reworkDataToInt(getsLine, a);

	// Выводим массив
	writeOneArray(a, MAX_ARR_LEN);

	// Основной код
	printf("\nInsert dop number: ");
	int k = 0;
	scanf("%d", &k);

	printf("\n");
	for (int* pArr = a; pArr < &a[MAX_ARR_LEN]; pArr++)
	{
		if (*pArr % k == 0)
			*pArr = 0;
	}

	// Преобразуем для data
	clean();
	char reworked[MAX_STR_LEN];
	reworkDataToChar(a, reworked, MAX_ARR_LEN);

	// Сохраняем в data
	appendData(reworked);

	// Преобразуем data
	int aDop[MAX_ARR_LEN];
	char getsLineDop[MAX_STR_LEN];
	readData(getsLineDop, MAX_STR_LEN, 1);
	reworkDataToInt(getsLineDop, aDop);

	// Выводим массив
	writeOneArray(aDop, MAX_ARR_LEN);

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