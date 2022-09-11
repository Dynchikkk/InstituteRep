// Лабораторная работа 1
// Выполнили студенты группы 22ВВ2
// Беляев Д. И., Ипполитов И. Д., Захаров А. С.
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>

int main()
{
	// Задаем переменные
	float x;
	float res1, res2, res3, finRes;

	// Запрашиваем переменную
	printf("Insert number: ");
	scanf("%f", &x);

	// Вычисления
	res1 = sin(fabs(3 * x));
	res2 = (2 * x + res1);
	res3 = res2 / 3.56f;
	finRes = sqrt(fabs(res3));

	// Выводим результат
	printf("Result: %.2f\n", finRes);
	getch();
	return 0;
}
