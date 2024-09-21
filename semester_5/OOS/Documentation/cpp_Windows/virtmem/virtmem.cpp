//=============================================================================
/**
* Пример использования виртуальной памяти для работы с данными
* Курс "Системное программное обеспечение"
*
* The sample of using virtual memory to work with data
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <stdio.h>
#include <windows.h>

//=============================================================================
/** Type for 1000000 data bytes */ 
typedef int Data[100][100][100];

//=============================================================================
int main(int argc, char* argv[])
{
	Data *pData;

	// Reserve the address space
	pData = (Data*)VirtualAlloc(0, sizeof(Data), MEM_RESERVE, PAGE_READWRITE);

	// Make a pointer into a reserved space
	int *pSomeData = &(*pData)[50][50][50];

	__try
	{
		// Set value by pointer
		// Will occur a exception
		*pSomeData = 1;
	}
	// By exception allocate 4 bytes of memory and return to assignation
	// Actually will be allocated 4 Kilobytes of memory
	__except(VirtualAlloc(pSomeData, sizeof(DWORD), MEM_COMMIT, PAGE_READWRITE), -1) 
	{}

	// Normally working with data
	// Using 4 bytes from allocated 4096 bytes from reserved 1000000 bytes
	printf("SomeData == %d", *pSomeData);

	// Free all reserved space with allocated memory including
	VirtualFree(pData, sizeof(Data), MEM_DECOMMIT);

	return 0;
}

