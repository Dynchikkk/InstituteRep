#ifndef FUNC_H_INCLUDED
#define FUNC_H_INCLUDED

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

#endif // FUNC_H_INCLUDED
