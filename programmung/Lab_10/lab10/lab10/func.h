#pragma once
#include <stdlib.h>
#include <time.h> 
#include <stdio.h>

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
