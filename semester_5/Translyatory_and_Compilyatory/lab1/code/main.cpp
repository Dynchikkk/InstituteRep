#include <iostream>
#include "RightFormatter.h"

std::string arr[] = {
	"1",
	"+1",
	"-1",
	"0x1",
	"0xb",
	"0012",
	"1l",
	"+1l",
	"-1l",
	"0x1l",
	"0xbl",
	"0012l",
	"1u",
	"+1u",
	"-1u",
	"0x1u",
	"0xbu",
	"0012u",
	"1ul",
	"+1ul",
	"-1ul",
	"0x1ul",
	"0xbul",
	"0012ul",
	"1lu",
	"+1lu",
	"-1lu",
	"0x1lu",
	"0xblu",
	"0012lu",
	"0x01v2lu",
	"0xABalu",
	"+++--0xABalu",
	"0xABalu++",
	"xABalu",
	"0ABalu",
	"01ABalu",
	"", 
	"+",
	"l",
	"+l",
	"+1uul",
	"+0xlU",
	"+0lU",
	"+0x1lU",
	"+0x-",
	"+01x1lU",
	"+0101lAU",
};

int main()
{
	RightFormatChecker formatter;
	for (std::string number : arr) {
		formatter.canNumberExist(number);
	}
	return 0;
}