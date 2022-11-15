#pragma once
#include <stdlib.h>
#include <time.h> 
#include <stdio.h>
#include <string.h>

int writeData(char row[]);

int appendData(char row[]);

int readData(char line[], int len, int row);

int reworkDataToInt(char from[], int* to);

int reworkDataToChar(int* from, char to[], int lenFrom);
