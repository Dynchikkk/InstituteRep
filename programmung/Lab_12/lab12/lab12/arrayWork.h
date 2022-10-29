#ifndef ARRAY_WORK_H_INCLUDED
#define ARRAY_WORK_H_INCLUDED

#include "func.h"
#include <stdlib.h>
#include <stdio.h>;

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
	int* pFinal = pLocalArr + len;
	int sum = 0;

	for (pLocalArr; pLocalArr < pFinal; pLocalArr++)
	{
		sum += *pLocalArr;
	}

	return sum;
}


#endif // !ARRAY_WORK_H_INCLUDED

