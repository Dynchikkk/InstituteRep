#include "Exam.h"

Exam::Exam(int maxScore, std::string name, int studentCount) : Challenge(maxScore, name)
{
	_studentCount = studentCount;
}

void Exam::PrintInfo()
{
	std::cout << "Exam " << _name << " Max score: " << _maxScore;
	std::cout << " Students count " << _studentCount << std::endl;
}