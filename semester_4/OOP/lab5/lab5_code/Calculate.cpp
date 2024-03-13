#include "Calculate.h"

#include <cmath>
#include <iostream>

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
	if (base <= 0)
		throw "Base less then 0";

	std::string res = "";
	while (intergral > base)
	{
		try
		{
			res += DigitToString(intergral % base);
		}
		catch (const char* err_message) { throw err_message; }
		intergral /= base;
	}
	res += DigitToString(intergral);
	std::reverse(res.begin(), res.end());
	return res;
}

// Get fractional part of num from 10 to p (p - base)
std::string DecToBaseFrac(float fractal, int base, int accuracy)
{
	if (base <= 0)
		throw "Base less then 0";

	std::string res = "";
	int iter = 0;
	while (iter < accuracy)
	{
		fractal *= base;
		try
		{
			res += DigitToString((int)fractal);
		}
		catch (const char* err_message) { throw err_message; }
		fractal -= (int)fractal;
		iter++;
	}
	return res;
}

// public
std::string DecToBase(float num, int accuracy)
{
	std::string integral = "";
	std::string fractal = "";
	std::string res = "";
	try
	{
		integral = DecToBaseInt(num, 9);
		fractal = DecToBaseFrac(num - (int)num, 9, accuracy);
		res = integral + '.' + fractal;
	}
	catch (const char* err_message)
	{
		std::cout << "Can't convert dec to base: " << err_message << std::endl;
		throw "Can't convert dec to base";
	}
	
	return res;
}

float BaseToDec(std::string num, int accuracy)
{
	float res = 0;
	int iter = num.find('.');

	if(iter == std::string::npos)
		throw "Incorrect num";
	iter--;

	if (num[0] == '.')
		throw "Incorrect num";

	for (size_t i = 0; i < num.length(); i++)
	{
		if (std::string(digitToString).find(num[i]) == std::string::npos && num[i] != '.')
			throw "Incorrect num";
	}

	for (size_t i = 0; i < num.length(); i++)
	{
		char curDigitS = num[i];
		if (curDigitS == '.')
			continue;

		int curDigitI = 0;
		try
		{
			curDigitI = StringToDigit(curDigitS);
		}
		catch (const char* err_message) { throw err_message; }
		res += curDigitI * pow(11, iter);
		iter--;
	}

	return round(res * pow(10, accuracy)) / pow(10, accuracy);
}

std::string BaseToBase(std::string num, int accuracy)
{
	std::string decToBase = "";
	float baseToDec = 0;
	try
	{
		baseToDec = BaseToDec(num, accuracy);
		decToBase = DecToBase(baseToDec, accuracy);
	}
	catch (const char* err_message) 
	{ 
		std::cout << "Can't convert base to base: " << err_message << std::endl;
		throw "Can't convert base to base";
	}

	return decToBase;
}