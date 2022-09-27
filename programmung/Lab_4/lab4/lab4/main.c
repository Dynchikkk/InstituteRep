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
	// ����� ������������ �� 10 �� 99
	int n = 10;
	int m = 99;
	// ������������ ��������� �����
	int r = n + rand() % (m - n + 1);
	return r;
}

void number1()
{
	// ������� ������ � ������ �������� ���������
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
	// �������� �������� ������� k �� 0
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
	// ������� ������ � ������ �������� ���������
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

	// ������� ������ � ���������� ������
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
