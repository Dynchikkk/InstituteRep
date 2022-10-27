#pragma once
#include <stdlib.h>
#include <string.h>

int clean()
{
	fseek(stdin, 0, SEEK_SET);

	return 0;
}

int removeTransition(char* string)
{
	int* pTr = strchr(string, '\n');
	if (pTr != NULL)
		*pTr = NULL;

	return 0;
}

