#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <math.h>

void n1();
void n2();
void n3();
void n4();
void n5();

int main()
{
	n1();
	printf("---------\n");
	n2();
	printf("---------\n");
	n3();
	printf("---------\n");
	n4();
	printf("---------\n");
	n5();

	return 0;
}

void n1()
{
	char x;
	printf("Insert 1 symbol: ");
	scanf("%c", &x);
	printf("Symbol in Symbol and Code View: %c - %d\n", x, x);
}

void n2()
{
	char wrd[50];
	printf("Insert line: ");
	getchar();
	fgets(wrd, 50, stdin);
	printf("Your line: ");
	printf("%s", wrd);

	int wrdLen = strlen(wrd) - 1;
	printf("Your line len: %d\n", wrdLen);
}

void n3()
{
	int num1, num2;
	printf("Insert positive number: ");
	scanf("%d", &num1);
	getchar();
	printf("Insert negative number: ");
	scanf("%d", &num2);
	printf("Numbers in:\n10cc: %d, %d\n16cc: %x, %x\n16cc (8 num): %8x, %8x, %08x, %08x\n", 
		num1, num2, num1, num2, num1, num2, num1, num2);
}

void n4()
{
	float num1, num2;
	printf("Insert positive number: ");
	scanf("%f", &num1);
	getchar();
	printf("Insert negative number: ");
	scanf("%f", &num2);
	printf("Numbers in:\nf: %0.3f, %0.3f\ne: %0.3e, %0.3e\n",
		num1, num2, num1, num2);
}

void n5()
{
	unsigned int num;
	printf("Insert unsigned number: ");
	scanf("%u", &num);
	printf("Number in:\nstandart: %u\n8cc: %o\n16cc: %x\n",
		num, num, num);
}

