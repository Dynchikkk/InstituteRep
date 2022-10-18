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
	//var12();

	return 0;
}

int var1()
{
	// Задаем массив
	char row[MAX_STR_LEN];
	printf("Insert line: ");
	fgets(row, MAX_STR_LEN, stdin);
	// Убираем лишние символы из буффера
	clean();
	// Убираем \n
	int* pTr = strchr(row, '\n');
	if(pTr != NULL)
		*pTr = NULL;
	
	// Основной код
	char sep[] = " ,/?!.:";
	char wrdWithStart[] = "a";
	int wrdWithLen = 5;

	char* wrdLen = 0;
	char* wrdStart = 0;

	int wasInStart = 0;
	int wasInLen = 0;

	char* pPart;
	pPart = strtok(row, sep);
	//printf("word(s) that start with %c: ", wrdStart);
	while (pPart != NULL)
	{
		if (*pPart == *wrdWithStart && wasInStart == 0)
		{
			wrdStart = pPart;
			wasInStart++;
		}

		if (strlen(pPart) == wrdWithLen && wasInLen <= 1)
		{
			wrdLen = pPart;
			wasInLen++;
		}

		pPart = strtok(NULL, sep);
	}

	printf("%s %s\n", wrdLen, wrdStart);

	//printf("\nThere are/is '%d' word(s) that start with '%c'", counter, wrdStart);

	return 0;
}

int var12()
{
	// Задаем массив
	char row[MAX_STR_LEN];
	printf("Insert line: ");
	fgets(row, MAX_STR_LEN, stdin);
	// Убираем лишние символы из буффера
	clean();
	// Убираем \n
	int* pTr = strchr(row, '\n');
	if (pTr != NULL)
		*pTr = NULL;

	// Основной код
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

