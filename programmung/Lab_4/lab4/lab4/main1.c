#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdbool.h>

void number1_1()
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
	
	int sum = 0;
	bool sign = true;
	// заменяем эдементы кратные k на 0
	for (int i = 0; i < lenA; i++)
	{
		if (true)
			sum += a[i];
		else
			sum += -a[i];

		sign = !sign;
	}

	printf("\nTotal: %d", sum);
}

void number1_2()
{
	// создаем массив и задаем значения элемантам
	int x[6][8];
	int colR = sizeof(x) / sizeof(x[0]);
	int colC = sizeof(x[0]) / sizeof(x[0][0]);

	printf("Array:\n");
	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			x[i][j] = random();
			printf("%d ", x[i][j]);
		}
		printf("\n");
	}

	int k = 0;
	printf("\nInsert dop num: ");
	scanf("%d", &k);

	int sum = 0;

	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			if ((i + j) % 2 == 0)
			{
				sum += x[i][j];
			}
		}
	}

	printf("The sum of matrix elements whose sum of\n");
	printf("indices is equal to dop num: %d", sum);
}
