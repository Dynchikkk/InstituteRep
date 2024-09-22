#include <iostream>
#include <map>
#include "RightFormatter.h"

std::map<std::string, NUMBER_NS> dict = {
	{"1", NUMBER_NS::DEC},
	{"+1", NUMBER_NS::DEC},
	{"-1", NUMBER_NS::DEC},
	{"0x1", NUMBER_NS::HEX},
	{"0xb", NUMBER_NS::HEX},
	{"0012", NUMBER_NS::OCT},
	{"1l", NUMBER_NS::DEC},
	{"+1l", NUMBER_NS::DEC},
	{"-1l", NUMBER_NS::DEC},
	{"0x1l", NUMBER_NS::HEX},
	{"0xbl", NUMBER_NS::HEX},
	{"0012l", NUMBER_NS::OCT},
	{"1u", NUMBER_NS::DEC},
	{"+1u", NUMBER_NS::DEC},
	{"-1u", NUMBER_NS::DEC},
	{"0x1u", NUMBER_NS::HEX},
	{"0xbu", NUMBER_NS::HEX},
	{"0012u", NUMBER_NS::OCT},
	{"1ul", NUMBER_NS::DEC},
	{"+1ul", NUMBER_NS::DEC},
	{"-1ul", NUMBER_NS::DEC},
	{"0x1ul", NUMBER_NS::HEX},
	{"0xbul", NUMBER_NS::HEX},
	{"0012ul", NUMBER_NS::OCT},
	{"1lu", NUMBER_NS::DEC},
	{"+1lu", NUMBER_NS::DEC},
	{"-1lu", NUMBER_NS::DEC},
	{"0x1lu", NUMBER_NS::HEX},
	{"0xblu", NUMBER_NS::HEX},
	{"0012lu", NUMBER_NS::OCT},
	{"0x01v2lu", NUMBER_NS::NONE},
	{"0xABalu", NUMBER_NS::HEX},
	{"+++--0xABalu", NUMBER_NS::NONE},
	{"0xABalu++", NUMBER_NS::NONE},
	{"xABalu", NUMBER_NS::NONE},
	{"0ABalu", NUMBER_NS::NONE},
	{"01ABalu", NUMBER_NS::NONE},
	{"", NUMBER_NS::NONE},
	{"0", NUMBER_NS::DEC},
	{" ", NUMBER_NS::NONE},
	{"+", NUMBER_NS::NONE},
	{"l", NUMBER_NS::NONE},
	{"+l", NUMBER_NS::NONE},
	{"+1uul", NUMBER_NS::NONE},
	{"+0xlU", NUMBER_NS::NONE},
	{"+0lU", NUMBER_NS::DEC},
	{"+0x1lU", NUMBER_NS::HEX},
	{"+0x-", NUMBER_NS::NONE},
	{"+01x1lU", NUMBER_NS::NONE},
	{"+0101lAU", NUMBER_NS::NONE},
	{"+0101ll", NUMBER_NS::OCT},
	{"+101ll", NUMBER_NS::DEC},
	{"+101uu", NUMBER_NS::NONE},
	{"+101Ll", NUMBER_NS::DEC},
	{"+101Lll", NUMBER_NS::NONE},
	{"+101uLL", NUMBER_NS::DEC},
	{"+101llu", NUMBER_NS::DEC},
	{"+101lLu", NUMBER_NS::DEC},
	{"+0x101luL", NUMBER_NS::NONE},
};

std::string ConvertFormatToString(NUMBER_NS ns)
{
	switch (ns) {
	case NUMBER_NS::DEC:
		return std::string{"number is dec"};
	case NUMBER_NS::OCT:
		return std::string{ "number is oct" };
	case NUMBER_NS::HEX:
		return std::string{ "number is hex" };
	default:
		return std::string{ "invalid number format" };
	}
}

int main()
{
	RightFormatChecker formatter;
	for (auto& element : dict) {
		NUMBER_NS ns = formatter.canNumberExist(element.first);
		bool actualResult = (int)element.second == (int)ns;
		std::cout << actualResult << " '" << element.first << "' " << ConvertFormatToString(ns) << std::endl;
	}
	return 0;
}