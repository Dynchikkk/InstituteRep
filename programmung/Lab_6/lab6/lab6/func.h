#pragma once
#include <stdlib.h>
#include <time.h> 

int random()
{
	// ����� ������������ �� 10 �� 99
	int n = 10;
	int m = 99;
	// ������������ ��������� �����
	int r = n + rand() % (m - n + 1);
	return r;
}

int summ(int *pLocalArr, int len)
{
	int *pFinal = pLocalArr + len;
	int sum = 0;

	for (pLocalArr; pLocalArr < pFinal; pLocalArr++)
	{
		sum += *pLocalArr;
	}

	return sum;
}