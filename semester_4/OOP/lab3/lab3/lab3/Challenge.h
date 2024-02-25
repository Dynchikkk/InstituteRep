#ifndef CHALLENGE
#define CHALLENGE
#include <iostream>
#include <string>

class Challenge
{
public:
	Challenge()
	{
		_name = "";
		_maxScore = -1;
	}
	Challenge(int maxScore, std::string name);
	~Challenge() { std::cout << "Challenge destroyed" << std::endl; }

	virtual void PrintInfo();

	// Setters
	void SetName(std::string name) { _name = name; }
	void SetMaxScore(int maxScore) { _maxScore = maxScore; }

	//Getters
	std::string GetName() { return _name; }
	int GetMaxScore() { return _maxScore; }

protected:
	std::string _name;
	int _maxScore;
};

#endif // !CHALLENGE

