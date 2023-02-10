#ifndef ARRAY_WORK_H_INCLUDED
#define ARRAY_WORK_H_INCLUDED

#include "func.h"
#include <stdlib.h>
#include <stdio.h>;

int fillArray(int* pLocalArr, int len);

int writeOneArray(int* pLocalArr, int colC);

int writeTwoArray(int* pLocalArr, int colR, int colC);

// find sum of array
int arraySum(int* pLocalArr, int len);


#endif // !ARRAY_WORK_H_INCLUDED

