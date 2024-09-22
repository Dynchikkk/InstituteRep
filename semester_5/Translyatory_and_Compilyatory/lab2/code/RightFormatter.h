#ifndef RIGHT_FORMATTER
#define RIGHT_FORMATTER
#include <string>

const std::string HEX_SYMBOLS = "0123456789ABCDEFabcdefx";
const std::string OCT_SYMBOLS = "01234567";
const std::string DEC_SYMBOLS = "0123456789";
const std::string LU_SYMBOLS = "luLU";
const std::string SIGN_SYMBOLS = "+-";

enum class NUMBER_NS
{
	NONE = 0,
	DEC = 2,
	OCT = 3,
	HEX = 4
};

class RightFormatChecker
{
public:
	bool isRightOctFormat(const std::string number);
	bool isRightHexFormat(const std::string number);
	bool isRightDecFormat(const std::string number);
	NUMBER_NS canNumberExist(const std::string number);
private:
	std::string trimString(const std::string number);
	bool isRightSignFormat(const std::string number);
	bool isRightSizeFormat(const std::string number);
	bool isRightLength(const std::string number, NUMBER_NS ns);
	
};

#endif 
