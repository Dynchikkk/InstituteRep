#pragma once
#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <time.h> 
#include <stdio.h>
#include <string.h>

// generate random bumber
int random()
{
	// числа генерируются от 10 до 99
	int n = 10;
	int m = 99;
	// генерируется рандомное число
	int r = n + rand() % (m - n + 1);
	return r;
}

int clean()
{
	fseek(stdin, 0, SEEK_SET);

	return 0;
}

int reworkDataToChar(int* from, char to[], int lenFrom)
{
	char separator[] = " ";

	strcpy(to, "");

	for (int i = 0; i < lenFrom; i++)
	{
		char local[10];
		_itoa(from[i], local, 10);
		strcat(to, local);
		strcat(to, separator);
	}

	return 0;
}

int reworkDataToInt(char from[], int* to)
{
	char sep[] = " \n";
	char* pPart;
	pPart = strtok(from, sep);
	int i = 0;
	while (pPart != NULL)
	{
		int num = atoi(pPart);
		*(to + i) = num;

		i++;
		pPart = strtok(NULL, sep);
	}

	return 0;
}

int readData(char line[], int len, int row)
{
	FILE* file = fopen("data.txt", "r");

	for (int i = -1; i < row; i++)
	{
		fgets(line, len, file);
	}

	fclose(file);

	return 0;
}

int appendData(char row[])
{
	FILE* file = fopen("data.txt", "a");

	fprintf(file, row);

	fclose(file);

	return 0;
}

int writeData(char row[])
{
	FILE* file = fopen("data.txt", "w");

	fprintf(file, row);

	fclose(file);

	return 0;
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
	int* pFinal = pLocalArr + len - 1;
	int sum = 0;

	for (pLocalArr; pLocalArr <= pFinal; pLocalArr++)
	{
		sum += *pLocalArr;
	}

	return sum;
}
