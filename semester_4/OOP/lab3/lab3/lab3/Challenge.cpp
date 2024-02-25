#include <iostream>
#include "Challenge.h"

Challenge::Challenge(int maxScore, std::string name)
{
	_maxScore = maxScore;
	_name = name;
}

void Challenge::PrintInfo()
{
	std::cout << "Challenge " << _name << " Max score: " << _maxScore << std::endl;
}