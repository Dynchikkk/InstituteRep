#pragma once
#include "func.h"
#include <stdlib.h>
#include <stdio.h>

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

	for (int* pInt = pLocalArr; pInt < pFinalEl; pInt++)
	{
		printf("%d ", *pInt);
	}

	return 0;
}

int writeTwoArray(int* pLocalArr, int colR, int colC)
{
	int* pFinalEl = pLocalArr + colR * colC;

	for (int* pInt = pLocalArr, i = 1; pInt < pFinalEl; pInt++, i++)
	{
		printf("%d ", *pInt);

		if (i % colC == 0)
			printf("\n");
	}

	return 0;
}

