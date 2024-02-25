#ifndef TEST
#define TEST
#include "Challenge.h"

class Test : public Challenge
{
public:
	Test() : Challenge() { _passScore = -1; }
	Test(int maxScore, std::string name, int passScore);

	void PrintInfo();

	// Setters
	void SetPassScore(int passScore) { _passScore = passScore; }

	// Getters
	int GetPassScore() { return _passScore; }

private:
	int _passScore = -1;
};
#endif
