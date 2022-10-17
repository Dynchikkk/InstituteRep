#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdbool.h>

void var1();
void var2();

int main()
{
	var1();
	printf("---------\n");
	var2();

	return 0;
}

void var1()
{
	int n = 0;
	printf("Insert num: ");
	scanf("%d", &n);

	float res = 0;
	int counter = 1;
	for (;res < n;)
	{
		res += 1.0 / counter;

		counter++;
	}
	printf("Number that satisfies condition: %.3f\n", res);
}

void var2()
{
	int a = 0;
	printf("Insert num: ");
	scanf("%d", &a);

	float res = 0;
	int counter = 0;
	while (res < a)
	{
		counter++;
		res += 1.0 / counter;

	}

	printf("Number that satisfies condition: %d\n", counter);
}