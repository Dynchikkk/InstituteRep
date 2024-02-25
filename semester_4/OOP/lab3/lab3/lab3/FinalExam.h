#ifndef FINAL_EXAM
#define FINAL_EXAM
#include "Challenge.h"

class FinalExam : public Challenge
{
public:
	FinalExam() : Challenge() { _maxPassedCount = -1; }
	FinalExam(int maxScore, std::string name, int passedCount);

	void PrintInfo();

	// Setters
	void SetPassedCount(int maxPassedCount) { _maxPassedCount = maxPassedCount; }

	// Getters
	int GetPassedCount() { return _maxPassedCount; }

private:
	int _maxPassedCount = -1;
};
#endif
