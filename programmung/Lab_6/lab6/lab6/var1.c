#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int num_1a()
{
	// создаем массив и задаем значения элемантам
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	printf("Array before:\n");
	for (int *pArr = a; pArr < &a[lenA]; pArr++)
	{
		int n = random();
		*pArr = n;
		printf("%d ", n);
	}

	printf("%d", *(a + 1));

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

int num_1b()
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
			if ((i + j + 2) % k == 0)
			{
				sum += x[i][j];
				printf("%d", x[i][j]);
			}
		}
	}

	printf("The sum of matrix elements whose sum of\n");
	printf("indices is equal to dop num: %d", sum);

	return 0;
}