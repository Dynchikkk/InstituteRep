#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <time.h> 

void number1();
void number2();
int random();

int main()
{
	srand(time(NULL));
	number1();
	printf("\n-----------\n");
	number2();

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

void number1()
{
	// создаем массив и задаем значения элемантам
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	printf("Array before: ");
	for (int i = 0; i < lenA; i++)
	{
		a[i] = random();
		printf("%d ", a[i]);
	}

	printf("\nInsert dop number: ");
	int k = 0;
	scanf("%d", &k);

	printf("Array after: ");
	// заменяем эдементы кратные k на 0
	for (int i = 0; i < lenA; i++)
	{
		if (a[i] % k == 0)
		{
			a[i] = 0;
		}

		printf("%d ", a[i]);
	}
}

void number2()
{
	// создаем массив и задаем значения элемантам
	int n[6][5];
	int colR = sizeof(n) / sizeof(n[0]);
	int colC = sizeof(n[0]) / sizeof(n[0][0]);
	printf("Array:\n");
	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			n[i][j] = random();
			printf("%d ", n[i][j]);
		}
		printf("\n");
	}

	// находим строку с наибольшей суммой
	int maxSum = 0;
	int rowNum = 0;
	for (int i = 0; i < colR; i++)
	{
		int rowSum = 0;
		for (int j = 0; j < colC; j++)
		{
			rowSum += n[i][j];
		}

		if (maxSum < rowSum)
		{
			maxSum = rowSum;
			rowNum = i;
		}
	}
	printf("\nRow with max sum - %d (%d)\n", rowNum + 1, maxSum);
}
