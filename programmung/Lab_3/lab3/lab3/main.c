#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>

void var1();
void var2();

int main() 
{
	var1();
	printf("------\n");
	var2();

	return 0;
}

void var1()
{
	int a, b, c, d;
	scanf("%d", &a);
	getchar();
	scanf("%d", &b);
	getchar();
	scanf("%d", &c);
	getchar();
	scanf("%d", &d);

	int n1, n2, n3, n4, n5, n6, x;


	n1 = fabs(a - b);
	n2 = fabs(a - c);
	n3 = fabs(a - d);
	n4 = fabs(b - c);
	n5 = fabs(b - d);
	n6 = fabs(c - d);

	x = n1;

	if (x > n2)
	{
		x = n2;
	}

	if (x > n3)
	{
		x = n3;
	}

	if (x > n4)
	{
		x = n4;
	}

	if (x > n5)
	{
		x = n5;
	}

	if (x > n6)
	{
		x = n6;
	}

	printf("%d\n", x);
}

void var2()
{

	int a, b, c, d;
	scanf("%d", &a);
	getchar();
	scanf("%d", &b);
	getchar();
	scanf("%d", &c);
	getchar();
	scanf("%d", &d);

	int k1, k2;
	scanf("%d", &k1);
	scanf("%d", &k2);

	int counter = 0;

	if (a > 0)
	{
		if (a % k1 == 0 && a % k2 != 0)
		{
			counter++;
		}
	}

	if (b > 0)
	{
		if (b % k1 == 0 && b % k2 != 0)
		{
			counter++;
		}
	}

	if (c > 0)
	{
		if (c % k1 == 0 && c % k2 != 0)
		{
			counter++;
		}
	}

	if (d > 0)
	{
		if (d % k1 == 0 && d % k2 != 0)
		{
			counter++;
		}
	}

	printf("%d\n", counter);

}