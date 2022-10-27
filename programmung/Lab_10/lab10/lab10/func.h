#pragma once
#include <stdlib.h>
#include <time.h> 
#include <stdio.h>

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

