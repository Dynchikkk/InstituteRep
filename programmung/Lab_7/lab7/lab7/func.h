#pragma once
#include <stdlib.h>
#include <time.h> 

// generate random bumber
int random()
{
	// ����� ������������ �� 10 �� 99
	int n = 10;
	int m = 99;
	// ������������ ��������� �����
	int r = n + rand() % (m - n + 1);
	return r;
}

// find sum of array
int summ(int* pLocalArr, int len)
{
	int* pFinal = pLocalArr + len;
	int sum = 0;

	for (pLocalArr; pLocalArr < pFinal; pLocalArr++)
	{
		sum += *pLocalArr;
	}

	return sum;
}

int clean()
{
	fseek(stdin, 0, SEEK_SET);

	return 0;
}
