#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include "func.h"
#define MAX_STR_LEN 100

int var1();
int var12();

int main()
{
	printf("Var1\n\n");
	var1();
	printf("\n---------------\n");
	printf("Var12\n\n");
	var12();

	return 0;
}

int var1()
{
	// ������ ������
	char row[MAX_STR_LEN];
	printf("Insert line: ");
	fgets(row, MAX_STR_LEN, stdin);
	// ������� ������ ������� �� �������
	clean();
	// ������� \n
	int* pTr = strchr(row, '\n');
	if(pTr != NULL)
		*pTr = NULL;
	
	// �������� ���
	char sep[] = " ,/?!.:";
	char* pPart;

	int counter = 0;
	char wrdStart = 'a';

	pPart = strtok(row, sep);
	printf("word(s) that start with %c: ", wrdStart);
	while (pPart != NULL)
	{
		if (*pPart == wrdStart)
		{
			counter++;
			printf("%s ", pPart);
		}
		pPart = strtok(NULL, sep);
	}

	printf("\nThere are/is '%d' word(s) that start with '%c'", counter, wrdStart);

	return 0;
}

int var12()
{
	// ������ ������
	char row[MAX_STR_LEN];
	printf("Insert line: ");
	fgets(row, MAX_STR_LEN, stdin);
	// ������� ������ ������� �� �������
	clean();
	// ������� \n
	int* pTr = strchr(row, '\n');
	if (pTr != NULL)
		*pTr = NULL;

	// �������� ���
	char sep[] = " ,/?!.:";
	char* pPart;

	int counter = 0;
	int wrdLen = 5;

	pPart = strtok(row, sep);
	printf("word(s) that len is %d: ", wrdLen);
	while (pPart != NULL)
	{
		if (strlen(pPart) == wrdLen)
		{
			counter++;
			printf("%s ", pPart);
		}
		pPart = strtok(NULL, sep);
	}

	printf("\nThere are/is '%d' word(s) that len is '%d'", counter, wrdLen);

	return 0;
}
