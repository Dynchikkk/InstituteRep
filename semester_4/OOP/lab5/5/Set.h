#ifndef SET
#define SET
#include <iostream>
#include <algorithm>
#include <iterator>
#include <stdlib.h>

template<typename T>
class Set
{
public:
	const unsigned int MAX_SIZE = 20;
	// Construct
	Set()
	{
		_size = 0;
		_set = new T[_size];
	}
	Set(T startVal, unsigned int size)
	{
		if (size <= 0 || size > MAX_SIZE)
			throw "Size too small or too big";

		_size = size;
		_set = new T[_size];
		_set[0] = startVal;
	}

	// Default
	void Insert(T val)
	{
		if (this->Contains(val))
			return;

		_size++;
		size_t size = sizeof(T) * _size;
		T* new_ptr = new T[_size];
		if (new_ptr == NULL)
			throw "Can't Insert Value";

		for (size_t i = 0; i < _size - 1; i++)
			new_ptr[i] = _set[i];

		_set = new_ptr;
		_set[_size - 1] = val;
	}

	void Erase(T val)
	{
		if (!this->Contains(val))
			return;

		if (_size <= 0)
			throw "Cant erase value";

		int index = 0;
		for (size_t i = 0; i < _size; i++)
		{
			if (_set[i] == val)
			{
				index = i;
				break;
			}
		}

		for (size_t i = 0; i < _size - 1; i++)
		{
			if (i >= index)
				*(_set + i) = *(_set + (i + 1));
		}
		_size--;
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

	void Print()
	{
		for (int i = 0; i < _size; i++)
			std::cout << _set[i] << " ";

		std::cout << std::endl;
	}

	// Overload
	Set operator +(T value)
	{
		this->Insert(value);
		return *this;
	}
	Set operator -(T value)
	{
		this->Erase(value);
		return *this;
	}
	int operator ()()
	{
		return this->_size;
	}
	T& operator [](int index)
	{
		if (index < 0 || index > _size)
			throw "Index out of range";

		return _set[index];
	}

private:
	unsigned int _size = MAX_SIZE;
	T* _set;
};

#endif // !
