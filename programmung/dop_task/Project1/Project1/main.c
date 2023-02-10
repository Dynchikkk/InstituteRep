#include <stdio.h>
#include <stdlib.h>

void f1()
{
	printf("f1");
}

void f2()
{
	printf("f2");
}

void main()
{
	int a = 18;
	int b = 16;

	void(*arr[2]) (void);
	arr[1] = &f1;
	arr[0] = &f2;

	arr[a > b]();
}
