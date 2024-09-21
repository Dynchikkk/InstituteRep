#include "RightFormatter.h"
#include <iostream>
#include <algorithm>

int a = 0xAb; 

bool RightFormatChecker::canNumberExist(const std::string number) const
{
	if (!isRightLength(number, ALL)) {
		return false;
	}
	bool result = false;
	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (length >= 3 && trimNumber[0] == '0' && trimNumber[1] == 'x') {
		result = isRightHexFormat(number);
	}
	else if (length >= 2 && trimNumber[0] == '0') {
		result = isRightOctFormat(number);
	}
	else {
		result = isRightDecFormat(number);
	}
	return result;
}

bool RightFormatChecker::isRightOctFormat(std::string number) const
{
	if (!isRightLength(number, OCT) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (trimNumber[0] != '0') {
		std::cout << number << " has incorrect oct format. First sign is not '0'" << std::endl;
		return false;
	}
	for (int i = 0; i < length; i++) {
		char symbol = trimNumber[i];
		size_t pos = OCT_SYMBOLS.find(symbol);
		if (pos != std::string::npos) {
			continue;
		}
		std::cout << "Symbol " << symbol << " in " << number << " on " << i << " position can't be in oct number" << std::endl;
		return false;
	}
	std::cout << number << " is oct" << std::endl;
	return true;
}

bool RightFormatChecker::isRightHexFormat(const std::string number) const
{
	if (!isRightLength(number, HEX) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (trimNumber[0] != '0' || trimNumber[1] != 'x') {
		std::cout << number << " has incorrect hex format. First sign is not '0x'" << std::endl;
		return false;
	}
	for (int i = 0; i < length; i++) {
		char symbol = trimNumber[i];
		size_t pos = HEX_SYMBOLS.find(symbol);
		if (pos != std::string::npos) {
			continue;
		}
		std::cout << "Symbol " << symbol << " in " << number << " on " << i << " position can't be in hex number" << std::endl;
		return false;
	}
	std::cout << number << " is hex" << std::endl;
	return true;
}

bool RightFormatChecker::isRightDecFormat(const std::string number) const
{
	if (!isRightLength(number, DEC) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	for (int i = 0; i < length; i++) {
		char symbol = trimNumber[i];
		size_t pos = DEC_SYMBOLS.find(symbol);
		if (pos != std::string::npos) {
			continue;
		}
		std::cout << "Symbol " << symbol << " in " << number << " on " << i << " position can't be in dec number" << std::endl;
		return false;
	}
	std::cout << number << " is dec" << std::endl;
	return true;
}

std::string RightFormatChecker::trimString(const std::string number) const
{
	std::string trimNumber = number;
	for (char symbol : LU_SYMBOLS) {
		trimNumber.erase(std::remove(trimNumber.begin(), trimNumber.end(), symbol), trimNumber.end());
	}
	for (char symbol : SIGN_SYMBOLS) {
		trimNumber.erase(std::remove(trimNumber.begin(), trimNumber.end(), symbol), trimNumber.end());
	}
	return trimNumber;
}

bool RightFormatChecker::isRightLength(const std::string number, NUMBER_NS ns) const
{
	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	switch (ns) {
	case ALL:
		if (length < 1) {
			std::cout << number << " lenght < 1" << std::endl;
			return false;
		}
		return true;
	case DEC:
		if (length < 1) {
			std::cout << "Dec " << number << " lenght < 1" << std::endl;
			return false;
		}
		return true;
	case OCT:
		if (length < 2) {
			std::cout << "Oct " << number << " lenght < 2" << std::endl;
			return false;
		}
		return true;
	case HEX:
		if (length < 3) {
			std::cout << "Hex " << number << " lenght < 3" << std::endl;
			return false;
		}
		return true;
	}

	return false;
}

bool RightFormatChecker::isRightSignFormat(const std::string number) const
{
	std::string signNumber = SIGN_SYMBOLS.find(number[0]) == std::string::npos ? '+' + number : number;
	int length = signNumber.length();
	if (length < 2)	{
		std::cout << number << " can't consist only of sign symbol" << std::endl;
		return false;
	}

	for (int i = 1; i < length; i++) {
		char symbol = number[i];
		if (SIGN_SYMBOLS.find(symbol) == std::string::npos) {
			continue;
		}
		std::cout << symbol << " in " << number << " can't be on " << i << " position" << std::endl;
		return false;
	}
	return true;
}

bool RightFormatChecker::isRightSizeFormat(const std::string number) const
{
	int length = number.length();
	for (char symbol : LU_SYMBOLS) {
		int count = std::count(number.begin(), number.end(), symbol);
		if (count > 1) {
			std::cout << symbol << " in " << number << " occurs more than once" << std::endl;
			return false;
		}
		size_t position = number.find(symbol);
		if (position == std::string::npos || position == length - 1) {
			continue;
		}
		if (LU_SYMBOLS.find(number[position + 1]) != std::string::npos) {
			continue;
		}
		std::cout << symbol << " in " << number << " not in right place: " << position << std::endl;
		return false;
	}

	return true;
}
