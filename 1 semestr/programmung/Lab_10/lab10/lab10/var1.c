#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_ARR_LEN 20
#define MAX_STR_LEN 100

int num1_1()
{
	//������������� ������ 20 34 35 65 75 87 64 32 15 89 65 78 34 12 11 99 37 69 42 55
	int a[MAX_ARR_LEN];

	printf("Insert array (one line): ");
	// ��������� data
	char line[MAX_STR_LEN];
	fgets(line, MAX_STR_LEN, stdin);
	clean();
	writeData(line);

	// ����������� �� data
	char getsLine[MAX_STR_LEN];
	readData(getsLine, MAX_STR_LEN, 0);
	reworkDataToInt(getsLine, a);

	// ������� ������
	writeOneArray(a, MAX_ARR_LEN);

	// �������� ���
	int sum = 0;
	int n = 1;

	for (int* pArr = a; pArr < &a[MAX_ARR_LEN]; pArr++)
	{
		sum += n * *pArr;
		n *= -1;
	}

	// ����������� ��� data
	char reworked[MAX_STR_LEN];
	_itoa(sum, reworked, 10);
	//reworkDataToChar(sum, reworked, 1);

	// ��������� � data
	appendData(reworked);
	appendData("\n");

	// ����������� �� data
	int res[1];
	char getsLineDop[MAX_STR_LEN];
	readData(getsLineDop, MAX_STR_LEN, 1);
	reworkDataToInt(getsLineDop, res);

	// ������� �����
	printf("\nSum: %d", res[0]);

	return 0;
}

int num1_2()
{
	// ������������� ������ 12 14 56 43 98 76 45 23 10
	int x[3][3];
	int colR = sizeof(x) / sizeof(x[0]);
	int colC = sizeof(x[0]) / sizeof(x[0][0]);

	printf("Insert array (one line): ");
	// ��������� � data
	clean();
	char line[MAX_STR_LEN];
	fgets(line, MAX_STR_LEN, stdin);
	clean();
	appendData(line);

	// ����������� �� data
	char getsLine[MAX_STR_LEN];
	readData(getsLine, MAX_STR_LEN, 2);
	reworkDataToInt(getsLine, x);

	// ������� ������
	writeTwoArray(x, colR, colC);

	// �������� ���
	int k = 0;
	printf("Insert dop num: ");
	scanf("%d", &k);

	int sum = 0;
	char lineEl[MAX_STR_LEN];
	strcpy(lineEl, "");

	for (int i = 0; i < colR; i++)
	{
		for (int j = 0; j < colC; j++)
		{
			if (i + j == k)
			{
				int el = *(*(x + i) + j);
				sum += el;

				char local[10];
				_itoa(el, local, 10);
				strcat(lineEl, local);
				strcat(lineEl, " ");
			}
		}
	}

	// ����������� ��� data
	char reworked[MAX_STR_LEN];
	int results[1] = { sum };
	reworkDataToChar(results, reworked, 1);

	// ��������� � data
	appendData(reworked);
	appendData("\n");
	appendData(lineEl);
	appendData("\n");

	// ����������� �� data
	// 1
	int res[1];
	char getsLineDop[MAX_STR_LEN];
	readData(getsLineDop, MAX_STR_LEN, 3);
	reworkDataToInt(getsLineDop, res);
	// 2
	char elementsLine[MAX_STR_LEN];
	readData(elementsLine, MAX_STR_LEN, 4);

	printf("\nElements: %s", elementsLine);
	printf("Sum: %d", res[0]);

	return 0;
}