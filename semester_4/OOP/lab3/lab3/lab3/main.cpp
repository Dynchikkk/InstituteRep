#include <iostream>
#include <string>

#include "Challenge.h"
#include "Test.h"
#include "Exam.h"
#include "FinalExam.h"

#define ARRAY_SIZE 2

Challenge* CreateChallengeArray();
Test* CreateTestArray();
Exam* CreateExamArray();
FinalExam* CreateFinalExamArray();

int main()
{
	Challenge* challenge = CreateChallengeArray();
	Test* test = CreateTestArray();
	Exam* exam = CreateExamArray();
	FinalExam* finalExam = CreateFinalExamArray();

	std::cout << "Default print info: " << std::endl;
	for (size_t i = 0; i < ARRAY_SIZE * 4; i++)
	{
		switch (i) 
		{
		case 0:
		case 1:
			challenge[i % ARRAY_SIZE].PrintInfo();
			break;

		case 2:
		case 3:
			test[i % ARRAY_SIZE].PrintInfo();
			break;

		case 4:
		case 5:
			exam[i % ARRAY_SIZE].PrintInfo();
			break;

		case 6:
		case 7:
			finalExam[i % ARRAY_SIZE].PrintInfo();
			break;
		}
	}
	std::cout << "\n";

	Challenge* allChallenges{ new Challenge[ARRAY_SIZE * 4] };
	for (size_t i = 0; i < ARRAY_SIZE * 4; i++)
	{
		switch (i)
		{
		case 0:
		case 1:
			allChallenges[i] = challenge[i % ARRAY_SIZE];
			break;

		case 2:
		case 3:
			allChallenges[i] = test[i % ARRAY_SIZE];
			break;

		case 4:
		case 5:
			allChallenges[i] = exam[i % ARRAY_SIZE];
			break;

		case 6:
		case 7:
			allChallenges[i] = finalExam[i % ARRAY_SIZE];
			break;
		}
	}

	std::cout << "Cast to base class (type 1): " << std::endl;
	for (size_t i = 0; i < ARRAY_SIZE * 4; i++)
		allChallenges[i].PrintInfo();
	std::cout << "\n";

	std::cout << "Cast to base class (type 2): " << std::endl;
	for (size_t i = 0; i < ARRAY_SIZE * 4; i++)
	{
		switch (i)
		{
		case 0:
		case 1:
			static_cast<Challenge>(challenge[i % ARRAY_SIZE]).PrintInfo(); 
			break;

		case 2:
		case 3:
			static_cast<Challenge>(test[i % ARRAY_SIZE]).PrintInfo();
			break;

		case 4:
		case 5:
			static_cast<Challenge>(exam[i % ARRAY_SIZE]).PrintInfo();
			break;

		case 6:
		case 7:
			static_cast<Challenge>(finalExam[i % ARRAY_SIZE]).PrintInfo();
			break;
		}
	}

	return 0;
}

#pragma region Array create
Challenge* CreateChallengeArray()
{
	Challenge* array{ new Challenge[ARRAY_SIZE] };

	std::cout << "Create challenge array" << std::endl;
	for (int i = 0; i < ARRAY_SIZE; i++)
	{
		std::string name = "";
		int maxScore = -1;

		std::cout << "Insert name and max score: ";
		std::cin >> name >> maxScore;

		array[i].SetName(name);
		array[i].SetMaxScore(maxScore);
	}
	std::cout << "\n";

	return array;
}

Test* CreateTestArray()
{
	Test* array{ new Test[ARRAY_SIZE] };

	std::cout << "Create test array" << std::endl;
	for (int i = 0; i < ARRAY_SIZE; i++)
	{
		std::string name = "";
		int maxScore = -1;
		int passScore = -1;

		std::cout << "Insert name, max score and pass score: ";
		std::cin >> name >> maxScore >> passScore;

		array[i].SetName(name);
		array[i].SetMaxScore(maxScore);
		array[i].SetPassScore(passScore);
	}
	std::cout << "\n";

	return array;
}

Exam* CreateExamArray()
{
	Exam* array{ new Exam[ARRAY_SIZE] };

	std::cout << "Create exam array" << std::endl;
	for (int i = 0; i < ARRAY_SIZE; i++)
	{
		std::string name = "";
		int maxScore = -1;
		int studentCount = -1;

		std::cout << "Insert name, max score and student count: ";
		std::cin >> name >> maxScore >> studentCount;

		array[i].SetName(name);
		array[i].SetMaxScore(maxScore);
		array[i].SetStudentCount(studentCount);
	}
	std::cout << "\n";

	return array;
}

FinalExam* CreateFinalExamArray()
{
	FinalExam* array{ new FinalExam[ARRAY_SIZE] };

	std::cout << "Create final exam array" << std::endl;
	for (int i = 0; i < ARRAY_SIZE; i++)
	{
		std::string name = "";
		int maxScore = -1;
		int maxPassedCount = -1;

		std::cout << "Insert name, max score and max passed count: ";
		std::cin >> name >> maxScore >> maxPassedCount;

		array[i].SetName(name);
		array[i].SetMaxScore(maxScore);
		array[i].SetPassedCount(maxPassedCount);
	}
	std::cout << "\n";

	return array;
}
#pragma endregion
