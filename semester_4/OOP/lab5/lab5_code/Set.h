#ifndef SET
#define SET
#include <iostream>
#include <algorithm>
#include <iterator>

template<typename T>
class Set
{
public:
	const unsigned int MAX_SIZE = 20;
	// Construct
	Set()
	{
		_size = MAX_SIZE;
		_set = new T[_size]{ (T)nullptr };
	}
	Set(T startVal, unsigned int size)
	{
		if (size <= 0 || size > MAX_SIZE)
		{
			std::cout << "Size too small or too big" << std::endl;
			throw "Size too small or too big";
		}

		_size = size;
		_set = new T[_size]{ (T)nullptr };
		_set[0] = startVal;
	}
	Set(T src[])
	{
		_size = MAX_SIZE;
		_set = new T[_size]{ (T)nullptr };
		for (size_t i = 0; i < _size; i++)
		{
			_set[i] = src[i];
		}
	}

	// Default
	void Insert(T val)
	{
		if (this->Contains(val))
			return;

		int index = this->FindFreeSpace();

		if (index == -1)
		{
			std::cout << "No free space" << std::endl;
			throw "No free space";
		}

		_set[index] = val;
	}

	void Erase(T val)
	{
		if (!this->Contains(val))
			return;

		int counter = 0;
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == (T)nullptr)
				counter++;
		}

		if(counter == _size)
		{
			std::cout << "No space" << std::endl;
			throw "No space";
		}

		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == val)
				_set[i] = (T)nullptr;
		}
	}

	bool Contains(T val)
	{
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == val)
				return true;
		}

		return false;
	}

	int Size()
	{
		int count = 0;
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] != (T)nullptr)
				count++;
		}
		return count;
	}

	void Print()
	{
		for (int i = 0; i < _size; i++)
		{
			if (_set[i] == (T)nullptr)
				continue;

			std::cout << _set[i] << " ";
		}

		std::cout << std::endl;
	}

	T* Values()
	{
		T* tmp = new T[_size]{ (T)nullptr };
		int index = 0;
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == (T)nullptr)
				continue;

			tmp[index] = _set[i];
			index++;
		}

		return tmp;
	}

	// Overload
	Set operator +(T value)
	{
		Set<T>* tmp = new Set<T>(this->Values());
		tmp->Insert(value);
		return *tmp;
	}
	Set operator -(T value)
	{
		Set<T>* tmp = new Set<T>(this->Values());
		tmp->Erase(value);
		return *tmp;
	}
	Set operator *(Set<T> secondSet)
	{
		T* secVal = secondSet.Values();
		Set<T>* tmp = new Set<T>();
		for (size_t i = 0; i < _size; i++)
		{
			if (secVal[i] == (T)nullptr)
				continue;

			if (this->Contains(secVal[i]))
				tmp->Insert(secVal[i]);
		}
		for (int i = 0; i < _size; i++)
		{
			if (_set[i] == (T)nullptr)
				continue;

			if (secondSet.Contains(_set[i]))
				tmp->Insert(_set[i]);
		}
		return *tmp;
	}
	int operator ()()
	{
		return this->Size();
	}
	T& operator [](int index)
	{
		if (index < 0 || index > _size)
		{ 
			std::cout << "Index out of range" << std::endl;
			throw "Index out of range";
		}
		return _set[index];
	}

private:
	unsigned int _size = MAX_SIZE;
	T* _set;

	int FindFreeSpace()
	{
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == (T)nullptr)
				return i;
		}

		return -1;
	}
};

#endif // !
