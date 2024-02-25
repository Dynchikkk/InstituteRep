#include "FinalExam.h"

FinalExam::FinalExam(int maxScore, std::string name, int passedCount) : Challenge(maxScore, name)
{
	_maxPassedCount = passedCount;
}

void FinalExam::PrintInfo()
{
	std::cout << "Final Exam " << _name << " Max score: " << _maxScore;
	std::cout << " Max count of passed students " << _maxPassedCount << std::endl;
}