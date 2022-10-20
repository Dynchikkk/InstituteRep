#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#define MAX_STR_LEN 20

#pragma region Struct

typedef struct
{
	int horsepower;
	char engineType[20];

} Engine;

typedef struct
{
	char name[20];
	char color[20];
	float milleage;
	Engine engine;
} Cars;

#pragma endregion

int fillPlaneStruct();

int main1()
{
	fillPlaneStruct();

	return 0;
}

int fillPlaneStruct()
{
	return 0;
}