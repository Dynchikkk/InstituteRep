#include <iostream>
#include "Set.h"
#include "Calculate.h"

int main()
{
//#pragma region Part1
//	Set<int> set1;
//	set1.Insert(1);
//	set1.Insert(2);
//	set1.Insert(3);
//	set1.Insert(4);
//
//	Set<int> set2;
//	set2.Insert(4);
//	set2.Insert(2);
//	set2.Insert(6);
//	set2.Insert(7);
//
//	std::cout << "Set1: ";
//	set1.Print();
//	std::cout << "Set2: ";
//	set2.Print();
//
//	Set<int> set3 = set1 - 1;
//	std::cout << "Set3 = set1 - 1: ";
//	set3.Print();
//
//	Set<int> set4 = set2 + 10;
//	std::cout << "Set4 = set2 + 10: ";
//	set4.Print();
//
//	Set<int> set5 = set3 * set4;
//	std::cout << "Set5 = set3 * set4: ";
//	set5.Print();
//
//	std::cout << "Power of set5: " << set5() << std::endl;
//#pragma endregion

	std::cout << DecToBase(143.367, 5) << std::endl;
	std::cout << BaseToDec("1A3.367", 3) << std::endl;
	std::cout << BaseToBase("1AAA3.367", 3) << std::endl;

	return 0;
}