// ������������ ������ 1
// ��������� �������� ������ 22��2
// ������ �. �., ��������� �. �., ������� �. �.
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>

int main()
{
	// ������ ����������
	float x;
	float res1, res2, res3, finRes;

	// ����������� ����������
	printf("Insert number: ");
	scanf("%f", &x);

	// ����������
	res1 = sin(fabs(3 * x));
	res2 = (2 * x + res1);
	res3 = res2 / 3.56f;
	finRes = sqrt(fabs(res3));

	// ������� ���������
	printf("Result: %.2f\n", finRes);
	getch();
	return 0;
}
