#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#define MAX_STR_LEN 20

#pragma region Struct

typedef struct
{
	char company[MAX_STR_LEN];
	char country[MAX_STR_LEN];
} Production;

typedef struct
{
	char name[MAX_STR_LEN];
	int size;
	Production production;
	char material[MAX_STR_LEN];
} Wear;

#pragma endregion

Wear fillWearStruct();
int printInfoWear(Wear wear);
int replaceTwoObjectsWear(Wear arr[]);

int main1()
{

	Wear wears[3];

	for (Wear* pWear = wears; pWear < &wears[3]; pWear++)
	{
		*pWear = fillWearStruct();
	}

	while (1 == 1)
	{
		printf("=============\n");
		int step = 1;
		printf("Choose next step\n	1 - print info about wear\n	2 - replace elements\n	0 - break\nNext step: ");
		scanf("%d", &step);
		if (step == 0)
		{
			break;
		}
		else if (step == 1)
		{
			int numEl = 1;
			printf("Choose wear number: ");
			scanf("%d", &numEl);
			printInfoWear(wears[numEl]);
		}
		else if (step == 2)
		{
			replaceTwoObjectsWear(wears);
		}
		else
		{
			continue;
		}

		printf("=============\n");
	}

	return 0;
}

Wear fillWearStruct()
{
	Wear localWear;

	printf("------------\n");

	printf("Enter wear name: ");
	fgets(localWear.name, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localWear.name);

	printf("Enter wear size: ");
	scanf("%d", &localWear.size);

	printf("Enter wear company: ");
	getchar();
	fgets(localWear.production.company, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localWear.production.company);

	printf("Enter wear country production: ");
	fgets(localWear.production.country, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localWear.production.country);

	printf("Enter wear material: ");
	fgets(localWear.material, MAX_STR_LEN, stdin);
	clean();
	removeTransition(localWear.material);


	printf("------------\n");

	return localWear;
}

int printInfoWear(Wear wear)
{
	printf("------------\n");

	printf("Wear name: %s\n", wear.name);
	printf("Wear size: %d\n", wear.size);
	printf("Wear company: %s\n", wear.production.company);
	printf("Wear country production: %s\n", wear.production.country);
	printf("Wear material: %s\n", wear.material);

	printf("------------\n");

	return 0;
}

int replaceTwoObjectsWear(Wear arr[])
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

	Wear dop = arr[first];

	arr[first] = arr[second];
	arr[second] = dop;

	return 0;
}