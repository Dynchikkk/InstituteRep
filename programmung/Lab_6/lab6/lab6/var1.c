#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>


int num_1a()
{
	// ������� ������ � ������ �������� ���������
	int a[20];
	int lenA = sizeof(a) / sizeof(int);
	printf("Array before:\n");
	for (int *pArr = a; pArr < &a[lenA]; pArr++)
	{
		*pArr = random();
		printf("%d ", *pArr);
	}

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
	// ������� ������ � ������ �������� ���������
	int x[6][6];
	int colR = sizeof(x) / sizeof(x[0]);
	int colC = sizeof(x[0]) / sizeof(x[0][0]);

	int *finEl = *x + colC * colR - 1;

	printf("Array:\n");
	for (int *pArr = x[0], i = 1; pArr <= finEl; pArr++, i++)
	{
		*pArr = random();
		printf("%d ", *pArr);

		if (i % colC == 0)
			printf("\n");
	}
	int* pArr = x[0];
	printf("%d", *(*(x + 1)+2));

	int k = 0;
	printf("\nInsert dop num: ");
	scanf("%d", &k);

	int sum = 0;
	int j = 0, i = 0;

	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			if (i == j)
			{
				int el = *(*(x + i) + j);
				//sum += el;
				printf("%d ", el);
			}
		}
	}

	/*for (int* pArr = x[0]; pArr <= finEl; pArr++)
	{
		if ((i + j) == k)
		{
			sum += *pArr;
			printf("%d ", *pArr);
		}

		j++;

		if (j < colC)
			continue;

		j = 0;
		i++;	
	}*/

	//printf("\nSum: %d", sum);

	return 0;
}