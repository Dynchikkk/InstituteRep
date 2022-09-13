#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

void gr1();
void gr12();

int main()
{
	gr1();
	gr12();

	return 0;
}

void gr1()
{
	//
	char x;
	scanf("%c", &x);
	printf("%c - %d\n", x, x);

	//
	char wrd[50];
	getchar();
	fgets(wrd, 50, stdin);
	puts(wrd);
	//
	int wrdLen = strlen(wrd) - 1;
	printf("%d\n", wrdLen);

	//
	int num1, num2;
	scanf("%d", &num1);
	getchar();
	scanf("%d", &num2);
	printf("cc10: %d, %d, cc16: %x, -%x", num1, num2, num1, num2 * -1);
}

void gr12()
{
	/*printf("12");*/
}

