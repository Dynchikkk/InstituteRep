#include <iostream>
#include "Set.h"
#include "Calculate.h"

int main()
{
#pragma region Part1
	
	
	// test 1
	// Set<int> set1;
	//set1.Insert(1);
	//set1.Insert(2);
	//set1.Insert(3);
	//set1.Insert(4);
	//std::cout << set1[0] << std::endl;
	//std::cout << set1[50] << std::endl;

	// test 2
	//Set<int>* set2 = new Set<int>(0, -1);

	// test 3
	/*Set<int>* set3 = new Set<int>(5, 2);
	set3->Insert(1);
	set3->Insert(3);
	set3->Insert(4);*/

#pragma endregion

#pragma region Part2
	std::cout << DecToBase(143.367, 5) << std::endl;
	std::cout << BaseToDec("1A3.367", 3) << std::endl;
	std::cout << BaseToBase("1.AA3367", 3) << std::endl;
#pragma endregion

	return 0;
}