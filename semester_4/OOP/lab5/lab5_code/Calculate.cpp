#include "Calculate.h"

#include <cmath>

// private
char digitToString[11] = { '0' , '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A'};

char DigitToString(int num)
{
	if (num < 11 && num >= 0)
		return digitToString[num];

	throw "Can't convert digit to string";
}

int StringToDigit(char digit)
{
	int index = std::find(digitToString, digitToString + 12, digit) - digitToString;
	if (index < 11)
		return index;

	throw "Can't convert string to digit";
}

// Get integral part of num
std::string DecToBaseInt(int intergral, int base)
{
	std::string res = "";
	while (intergral > base)
	{
		res += DigitToString(intergral % base);
		intergral /= base;
	}
	res += DigitToString(intergral);
	std::reverse(res.begin(), res.end());
	return res;
}

// Get fractional part of num from 10 to p (p - base)
std::string DecToBaseFrac(float fractal, int base, int accuracy)
{
	std::string res = "";
	int iter = 0;
	while (iter < accuracy)
	{
		fractal *= base;
		res += DigitToString((int)fractal);
		fractal -= (int)fractal;
		iter++;
	}
	return res;
}

// public
std::string DecToBase(float num, int accuracy)
{
	std::string integral = DecToBaseInt(num, 9);
	std::string fractal = DecToBaseFrac(num - (int)num, 9, accuracy);
	std::string res = integral + '.' + fractal;

	return res;
}

float BaseToDec(std::string num, int accuracy)
{
	float res = 0;
	int iter = num.find('.') - 1;

	for (size_t i = 0; i < num.length(); i++)
	{
		char curDigitS = num[i];
		if (curDigitS == '.')
			continue;

		int curDigitI = StringToDigit(curDigitS);
		res += curDigitI * pow(11, iter);
		iter--;
	}

	return round(res * pow(10, accuracy)) / pow(10, accuracy);
}

std::string BaseToBase(std::string num, int accuracy)
{
	float baseToDec = BaseToDec(num, accuracy);
	std::string decToBase = DecToBase(baseToDec, accuracy);

	return decToBase;
}