#define _CRT_SECURE_NO_WARNINGS
#include "arrayWork.h"

int numA();
int numB();

int main()
{
	srand(time(NULL));

	numA();
	printf("\n-------------\n");
	numB();

	return 0;
}

int random()
{
	// числа генерируются от 10 до 99
	int n = 10;
	int m = 99;
	// генерируется рандомное число
	int r = n + rand() % (m - n + 1);
	return r;
}

int fillArray(int* pLocalArr, int len)
{
	int* pFinalEl = pLocalArr + len;

	for (int* pInt = &pLocalArr[0]; pInt < pFinalEl; pInt++)
	{
		*pInt = random();
	}

	return 0;
}

int writeOneArray(int* pLocalArr, int colC)
{
	int* pFinalEl = pLocalArr + colC;

	printf("Array:\n\t");
	for (int* pInt = pLocalArr; pInt < pFinalEl; pInt++)
	{
		printf("%d ", *pInt);
	}

	printf("\n");

	return 0;
}

int writeTwoArray(int* pLocalArr, int colR, int colC)
{
	int* pFinalEl = &pLocalArr[0] + colR * colC;

	printf("Array:\n\t");
	for (int* pInt = &pLocalArr[0], i = 1; pInt < pFinalEl; pInt++, i++)
	{
		printf("%d ", *pInt);

		if (i % colC == 0)
			printf("\n\t");
	}

	printf("\n");

	return 0;
}

// find sum of array
int arraySum(int* pLocalArr, int len)
{
	int* pFinal = pLocalArr + len;
	int sum = 0;

	for (pLocalArr; pLocalArr < pFinal; pLocalArr++)
	{
		sum += *pLocalArr;
	}

	return sum;
}


int numA()
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

int numB()
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