#ifndef EXAM
#define EXAM
#include "Challenge.h"

class Exam : public Challenge
{
public:
	Exam() : Challenge() { _studentCount = -1; }
	Exam(int maxScore, std::string name, int studentCount);

	void PrintInfo();

	// Setters
	void SetStudentCount(int studentCount) { _studentCount = studentCount; }

	// Getters
	int GetStudentCount() { return _studentCount; }

private:
	int _studentCount = -1;
};
#endif
