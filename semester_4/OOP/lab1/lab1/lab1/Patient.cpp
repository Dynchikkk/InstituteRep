#include <iostream>
#include "Patient.h"

Patient::Patient(std::string name, std::string secName, std::string otch, int cardNumb, int diseaseNumb)
{
	SetFio(name, secName, otch);
	_cardNumb = cardNumb;
	_diseaseNumb = diseaseNumb;

	std::cout << "Patient " << GetFio() << " with card: " << GetCardNumb() << " with disease " << GetDiseaseNumb() << " created\n";
}

Patient::~Patient()
{
	std::cout << "Patient deleted\n";
}

#pragma region Getter
int Patient::GetCardNumb() { return _cardNumb; }
int Patient::GetDiseaseNumb() { return _diseaseNumb; }
std::string Patient::GetFio() { return "FIO: " + _name + "_" + _secName + "_" + _otch; }
#pragma endregion


#pragma region Setter
void Patient::SetFio(std::string name, std::string secName, std::string otch)
{
	_name = name;
	_secName = secName;
	_otch = otch;
}

void Patient::SetCardNumb(int cardNumb) { _cardNumb = cardNumb; }
void Patient::SetDiseaseNumb(int diseaseNumb) { _diseaseNumb = diseaseNumb; }
#pragma endregion

