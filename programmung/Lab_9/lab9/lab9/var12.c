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
int printInfoCar(Car car);
int replaceTwoObjectsCar(Car arr[]);


int main12()
{
	Car cars[3];
	
	for (Car *pCars = cars; pCars < &cars[3]; pCars++)
	{
		*pCars = fillCarStruct();
	}

	while (1==1)
	{
		printf("=============\n");
		int step = 1;
		printf("Choose next step\n	1 - print info about car\n	2 - replace elements\n	0 - break\nNext step: ");
		scanf("%d", &step);
		if (step == 0)
		{
			break;
		}
		else if(step == 1)
		{
			int numEl = 1;
			printf("Choose car number: ");
			scanf("%d", &numEl);
			printInfoCar(cars[numEl]);
		}
		else if(step == 2)
		{
			replaceTwoObjectsCar(cars);
		}
		else
		{
			continue;
		}

		printf("=============\n");
	}

	return 0;
}

Car fillCarStruct()
{
	Car localCar;

	printf("------------\n");

	printf("Enter car name: ");
	fgets(localCar.name, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.name);

	printf("Enter car color: ");
	fgets(localCar.color, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.color);

	printf("Enter car milleage: ");
	scanf("%f", &localCar.milleage);

	printf("Enter car horsepower: ");
	getchar();
	scanf("%d", &localCar.engine.horsepower);

	printf("Enter car engineType: ");
	getchar();
	fgets(localCar.engine.engineType, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localCar.engine.engineType);

	printf("------------\n");

	return localCar;
}

int printInfoCar(Car car)
{
	printf("------------\n");

	printf("Car name: %s\n", car.name);
	printf("Car color: %s\n", car.color);
	printf("Car milleage: %f\n", car.milleage);
	printf("Car horsepower: %d\n", car.engine.horsepower);
	printf("Car engineType: %s\n", car.engine.engineType);

	printf("------------\n");

	return 0;
}

int replaceTwoObjectsCar(Car arr[])
{
	int first = 0;
	int second = 0;

	printf("------------\n");

	printf("Enter the numbers of the elements you want to swap with each other:\n");
	printf("Insert first num: ");
	scanf("%d", &first);
	printf("Insert second num: ");
	scanf("%d", &second);

	printf("------------\n");

	Car dop = arr[first];

	arr[first] = arr[second];
	arr[second] = dop;

	return 0;
}