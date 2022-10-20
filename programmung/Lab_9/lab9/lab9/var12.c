#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#define MAX_STR_LEN 20

#pragma region Struct

typedef struct
{
	int horsepower;
	char engineType[MAX_STR_LEN];

} Engine;

typedef struct
{
	char name[MAX_STR_LEN];
	char color[MAX_STR_LEN];
	float milleage;
	Engine engine;
} Car;

#pragma endregion

Car fillCarStruct();

int main12()
{
	Car cars[3];
	
	for (Car *pCars = cars; pCars < &cars[3]; pCars++)
	{
		*pCars = fillCarStruct();
	}

	return 0;
}

Car fillCarStruct()
{
	Car localCar;

	printf("Enter car name: ");
	fgets(localCar.name, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.name);

	printf("Enter car color: ");
	getchar();
	fgets(localCar.color, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.color);

	printf("Enter car milleage: ");
	//getchar();
	scanf("%f", &localCar.milleage);

	printf("Enter car horsepower: ");
	getchar();
	scanf("%d", &localCar.engine.horsepower);

	printf("Enter car engineType: ");
	getchar();
	fgets(localCar.engine.engineType, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.color);
	return localCar;
}