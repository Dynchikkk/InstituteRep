#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#define MAX_STR_LEN 8

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
			printf("----------------------------------------------\n");
			printf("|  name  |  color |milleage|     engine      |\n");
			printf("|        |        |        | horpow | enType |\n");
			printf("----------------------------------------------\n");

			for (int i = 0; i < 3; i++)
			{
				printf("|%8s|", cars[i].name);
				printf("%8s|", cars[i].color);
				printf("%8.2f|", cars[i].milleage);
				printf("%8d|", cars[i].engine.horsepower);
				printf("%8s|\n", cars[i].engine.engineType);
				printf("-----------------------------------------------\n");
			}
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

int printInfoCar(Car arr[])
{
	printf("----------------------------------------------\n");
	printf("|  name  |  color |milleage|     engine      |\n");
	printf("|        |        |        | horpow | enType |\n");
	printf("----------------------------------------------\n");

	for (int i = 0; i < 3; i++)
	{
		printf("|\t%s|", arr[i].name);
		printf("\t%s|", arr[i].color);
		printf("\t%.2f|", arr[i].milleage);
		printf("\t%d|", arr[i].engine.horsepower);
		printf("\t%s|\n", arr[i].engine.engineType);
		printf("------------------------------------------\n");
	}
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