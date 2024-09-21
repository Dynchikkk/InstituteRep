#ifndef RIGHT_FORMATTER
#define RIGHT_FORMATTER
#include <string>

const std::string HEX_SYMBOLS = "0123456789ABCDEFabcdefx";
const std::string OCT_SYMBOLS = "01234567";
const std::string DEC_SYMBOLS = "0123456789";
const std::string LU_SYMBOLS = "LUlu";
const std::string SIGN_SYMBOLS = "+-";

enum NUMBER_NS
{
	ALL = 0,
	DEC = 1,
	OCT = 2,
	HEX = 3
};

class RightFormatChecker
{
public:
	bool isRightOctFormat(const std::string number) const;
	bool isRightHexFormat(const std::string number) const;
	bool isRightDecFormat(const std::string number) const;
	bool canNumberExist(const std::string number) const;
private:
	std::string trimString(const std::string number) const;
	bool isRightSignFormat(const std::string number) const;
	bool isRightSizeFormat(const std::string number) const;
	bool isRightLength(const std::string number, NUMBER_NS ns) const;
	
};

#endif 
