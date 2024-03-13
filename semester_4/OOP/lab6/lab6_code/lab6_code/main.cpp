#include <iostream>
#include <string>
#include <set>

using namespace std;

template<class T> 
class MySet : public set<T> {

public:
	using set<T>::set;

	void PrintData()
	{
		for (T i : *this)
			cout << i << " ";

		cout << endl;
	}
};

int main() {

	cout << "P1-2" << endl;
	MySet<int> set12 = { 1, 2 };
	cout << "set12 = ";
	set12.PrintData();

	cout << "\nP3-4" << endl;
	set12.erase(1);
	set12.insert(4);
	set12.insert(10);
	set12.insert(11);
	cout << "set12 = ";
	set12.PrintData();

	cout << "\nP5" << endl;
	MySet<int> set123 = { 15, 26, 39 };
	cout << "set123 = ";
	set123.PrintData();

	cout << "\nP6-7" << endl;
	int index = 0;
	for (auto pos = set12.begin(); pos != set12.end();)
	{
		if (index > 2)
			break;

		pos = set12.erase(pos);
		index++;
	}

	for (int i : set123)
		set12.insert(i);

	cout << "set12 = ";
	set12.PrintData();
	cout << "set123 = ";
	set123.PrintData();
	
	return 0;
}
