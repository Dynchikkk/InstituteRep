#ifndef PATIENT
#define PATIENT
#include <string>

class Patient;

class Observer
{
public:
	void GetInfo(Patient& patient);
};

class Patient
{
public:
	friend void Observer::GetInfo(Patient& patient);

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

	// Method overloading
	bool operator == (const Patient& pat) const { return _cardNumb == pat._cardNumb; }
	bool operator != (const Patient& pat) const { return _cardNumb != pat._cardNumb; }
	Patient& operator = (const Patient& pat)
	{
		this->SetFio(pat._name, pat._secName, pat._otch);
		this->SetCardNumb(pat._cardNumb);
		this->SetDiseaseNumb(pat._diseaseNumb);
		return *this;
	}
	
private:
	std::string _name;
	std::string _secName;
	std::string _otch;

	int _cardNumb;
	int _diseaseNumb;
};

#endif // !PATIENT
