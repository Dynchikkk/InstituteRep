#include "Test.h"

Test::Test(int maxScore, std::string name, int passScore) : Challenge(maxScore, name)
{
	_passScore = passScore;
}

void Test::PrintInfo()
{
	std::cout << "Test " << _name << " Max score: " << _maxScore;
	std::cout << " Pass if more then " << _passScore << std::endl;
}
