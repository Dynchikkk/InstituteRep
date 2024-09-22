#include "RightFormatter.h"
#include <algorithm>
#include <cctype>

int a = 10llu;

NUMBER_NS RightFormatChecker::canNumberExist(const std::string number) 
{
	if (number.length() < 1) {
		return NUMBER_NS::NONE;
	}
	
	if (isRightDecFormat(number)) {
		return NUMBER_NS::DEC;
	}
	else if (isRightOctFormat(number)) {
		return NUMBER_NS::OCT;
	}
	else if (isRightHexFormat(number)) {
		return NUMBER_NS::HEX;
	}

	return NUMBER_NS::NONE;
}

bool RightFormatChecker::isRightOctFormat(const std::string number)
{
	if (!isRightLength(number, NUMBER_NS::OCT) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (trimNumber[0] != '0') {
		return false;
	}
	for (int i = 0; i < length; i++) {
		size_t pos = OCT_SYMBOLS.find(trimNumber[i]);
		if (pos != std::string::npos) {
			continue;
		}
		return false;
	}
	return true;
}

bool RightFormatChecker::isRightHexFormat(const std::string number) 
{
	if (!isRightLength(number, NUMBER_NS::HEX) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (trimNumber[0] != '0' || trimNumber[1] != 'x') {
		return false;
	}
	for (int i = 0; i < length; i++) {
		size_t pos = HEX_SYMBOLS.find(trimNumber[i]);
		if (pos != std::string::npos) {
			continue;
		}
		return false;
	}
	return true;
}

bool RightFormatChecker::isRightDecFormat(const std::string number) 
{
	if (!isRightLength(number, NUMBER_NS::DEC) || !isRightSignFormat(number) || !isRightSizeFormat(number)) {
		return false;
	}

	std::string trimNumber = trimString(number);
	int length = trimNumber.length();
	if (trimNumber[0] == '0' && length > 1) {
		return false;
	}
	for (int i = 0; i < length; i++) {
		size_t pos = DEC_SYMBOLS.find(trimNumber[i]);
		if (pos != std::string::npos) {
			continue;
		}
		return false;
	}
	return true;
}

std::string RightFormatChecker::trimString(const std::string number) 
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

bool RightFormatChecker::isRightLength(const std::string number, NUMBER_NS ns)
{
	int length = trimString(number).length();
	switch (ns) {
	case NUMBER_NS::DEC:
		return length > 0;
	case NUMBER_NS::OCT:
		return length > 1;
	case NUMBER_NS::HEX:
		return length > 2;
	default:
		return false;
	}
}

bool RightFormatChecker::isRightSignFormat(const std::string number) 
{
	std::string signNumber = SIGN_SYMBOLS.find(number[0]) == std::string::npos ? '+' + number : number;
	int length = signNumber.length();
	if (length < 2)	{
		return false;
	}

	for (int i = 1; i < length; i++) {
		char symbol = number[i];
		if (SIGN_SYMBOLS.find(symbol) == std::string::npos) {
			continue;
		}
		return false;
	}
	return true;
}

bool RightFormatChecker::isRightSizeFormat(const std::string number) 
{
	std::string lowerNumber = number;
	for (char& c : lowerNumber) {
		c = c | ' ';
	}
	int length = lowerNumber.length();
	for (char symbol : LU_SYMBOLS) {
		int count = std::count(lowerNumber.begin(), lowerNumber.end(), symbol);
		size_t position = lowerNumber.find(symbol);
		switch (symbol)
		{
		case ('l'):
			if (count < 2) {
				if (position == std::string::npos || position == length - 1) {
					break;
				}
				if (LU_SYMBOLS.find(lowerNumber[position + 1]) != std::string::npos) {
					break;
				}
			}
			if (count == 2) {
				if (position < length - 3) {
					break;
				}
				if (lowerNumber[position] == lowerNumber[position + 1] && lowerNumber[position] == symbol) {
					break;
				}
			}
			return false;

		case ('u'):
			if (count > 1) {
				return false;
			}
			if (position == std::string::npos || position == length - 1) {
				break;
			}
			if (LU_SYMBOLS.find(lowerNumber[position + 1]) != std::string::npos) {
				break;
			}
			return false;
		}
	}

	return true;
}
