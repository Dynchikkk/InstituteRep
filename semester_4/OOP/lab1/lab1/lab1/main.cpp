#include <iostream>
#include <vector>
#include "Patient.h"

const int LIST_SIZE = 3;

Patient* CreatePatient();
void FindByDisease(int diseaseNumber, std::vector<Patient*> ptList);
void FindByCardInRange(int rangeMin, int rangeMax, std::vector<Patient*> ptList);

int main()
{
	std::vector<Patient*> ptList;
	for (size_t i = 0; i < LIST_SIZE; i++)
	{
		ptList.push_back(CreatePatient());
		std::cout << "\n";
	}

	int disNumb = 0;
	std::cout << "Insert disease number: ";
	std::cin >> disNumb;
	FindByDisease(disNumb, ptList);

	int cardNumbMin = 0;
	int cardNumbMax = 0;
	std::cout << "Insert card range number min and max: ";
	std::cin >> cardNumbMin >> cardNumbMax;
	FindByCardInRange(cardNumbMin, cardNumbMax, ptList);

	return 0;
}

Patient* CreatePatient()
{
	std::string name;
	std::string secName;
	std::string otch;
	int cardNumb;
	int diseaseNumb;

	std::cout << "Create Patient\n";
	std::cout << "Insert name: ";
	std::cin >> name;
	std::cout << "Insert second name: ";
	std::cin >> secName;
	std::cout << "Insert otch: ";
	std::cin >> otch;

	std::cout << "Insert card number: ";
	std::cin >> cardNumb;
	std::cout << "Insert disease number: ";
	std::cin >> diseaseNumb;

	return new Patient(name, secName, otch, cardNumb, diseaseNumb);
}

void FindByCardInRange(int rangeMin, int rangeMax, std::vector<Patient*> ptList)
{
	std::cout << "Patient with card in range(" << rangeMin << ", " << rangeMax << "):\n";
	for (size_t i = 0; i < LIST_SIZE; i++)
	{
		int cardNumb = ptList[i]->GetCardNumb();
		if (cardNumb >= rangeMin && cardNumb <= rangeMax)
			std::cout << ptList[i]->GetFio() << "\n";
	}
}

void FindByDisease(int diseaseNumber, std::vector<Patient*> ptList)
{
	std::cout << "Patient with disease " << diseaseNumber << ":\n";
	for (size_t i = 0; i < LIST_SIZE; i++)
	{
		if (ptList[i]->GetDiseaseNumb() != diseaseNumber)
			continue;

		std::cout << ptList[i]->GetFio() << "\n";
	}
	std::cout << "\n";
}