#ifndef PATIENT
#define PATIENT
#include <string>

class Patient
{
public:
	Patient(std::string name, std::string secName, std::string otch, int cardNumb, int diseaseNumb);
	~Patient();

	// Getter
	std::string GetFio();
	int GetCardNumb();
	int GetDiseaseNumb();

	// Setter
	void SetFio(std::string name, std::string secName, std::string otch);
	void SetCardNumb(int cardNumb);
	void SetDiseaseNumb(int diseaseNumb);
	
private:
	std::string _name;
	std::string _secName;
	std::string _otch;

	int _cardNumb;
	int _diseaseNumb;
};

#endif // !PATIENT
