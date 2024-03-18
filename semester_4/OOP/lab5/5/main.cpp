#include <iostream>
#include "Set.h"
#include "Calculate.h"

int main()
{
	try
	{
#pragma region Part1
		std::cout << "----- Part1 -----\n" << std::endl;

		Set<std::string>* setStr = new Set<std::string>("hello", 1);
		setStr->Insert("world");
		setStr->Insert("!");
		std::cout << "setStr: ";
		setStr->Print();
		setStr->Erase("world");
		std::cout << "setStr: ";
		setStr->Print();

		Set<float>* setFloat = new Set<float>(1.1, 1);
		setFloat->Insert(2.2);
		setFloat->Insert(3.3);
		std::cout << "setFloat: ";
		setFloat->Print();
		setFloat->Erase(2.2);
		std::cout << "setFloat: ";
		setFloat->Print();

		Set<int>* setInt = new Set<int>(1, 1);
		setInt->Insert(2);
		setInt->Insert(3);
		std::cout << "setInt: ";
		setInt->Print();
		setInt->Erase(2);
		std::cout << "setInt: ";
		setInt->Print();

#pragma endregion

#pragma region Part2
		std::cout << "\n----- Part2 -----\n" << std::endl;
		std::cout << "Insert val: ";
		std::string num;
		std::cin >> num;
		std::string res = BaseToBase(num, 3);
		std::cout << num << " in 11 convert to " << res << " in 9" << std::endl;
#pragma endregion
	}
	catch (const char* errMess)
	{
		std::cout << errMess << std::endl;
	}
	return 0;
}
