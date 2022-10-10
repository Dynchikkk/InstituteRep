#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdbool.h>

void var1();
void var2();

int main()
{
	var1();
	printf("---------\n");
	//var2();

	return 0;
}

void var1()
{
	int n = 0;
	printf("Insert num: ");
	scanf("%d", &n);

	float res = 0;
	int counter = 1;
	while (true)
	{
		res += 1.0 / counter;
		if (res > n)
		{
			printf("Number that satisfies condition: %.3f\n", res);
			return;
		}

		counter++;
	}
}

void var2()
{
	int a = 0;
	printf("Insert num: ");
	scanf("%d", &a);

	float res = 0;
	int counter = 1;
	while (true)
	{
		res += 1.0 / counter;
		if (res > a)
		{
			printf("Number that satisfies condition: %d\n", counter);
			return;
		}

		counter++;
	}
}