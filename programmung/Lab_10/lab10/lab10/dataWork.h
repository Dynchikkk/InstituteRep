#pragma once
#include <stdlib.h>
#include <time.h> 
#include <stdio.h>
#include <string.h>

int writeData(char row[])
{
	FILE* file = fopen("data.txt", "w");

	fprintf(file, row);

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

int reworkData(char from[], int* to)
{
	int numCount = 1;
	int fromLen = sizeof(from) / sizeof(char);
	for (int i = 0; i < fromLen; i++)
	{
		if (from[i] == ' ')
		{
			numCount += 1;
		}
	}

	char sep[] = " ";
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
