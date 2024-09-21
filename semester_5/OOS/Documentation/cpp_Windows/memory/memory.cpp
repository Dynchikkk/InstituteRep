//=============================================================================
/**
* Пример разделяемой памяти через отображение виртуального файла
* Курс "Системное программное обеспечение"
*
* The sample of shared memory
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>

//=============================================================================
const DWORD MEMORY_SIZE = 100;

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hMemory;
	char*  szAddress;
	// first 4 bytes for synchronize
	char  Word[MEMORY_SIZE - 4];
	BOOL  bServer = FALSE;

	// Creating of file mapping in paging file
	hMemory = CreateFileMapping(INVALID_HANDLE_VALUE, 0, 
		PAGE_READWRITE, 0, MEMORY_SIZE, "SPO_Memory");

	if (!hMemory)
	{
		printf("Error at create file mapping\n");
		return 1;
	}

	// First instance of program - server, other - clients
	if (GetLastError() != ERROR_ALREADY_EXISTS)
		bServer = TRUE;

	// Get the address of shared memory
	szAddress = (char *)MapViewOfFile(hMemory, FILE_MAP_ALL_ACCESS, 0, 0, 0);
	if (!szAddress)
	{
		printf("Error at map view of file\n");
		CloseHandle(hMemory);
		return 1;
	}

	if (bServer)
	{ 
		// In the first instance the program initialize the memory
		*(LONG *)szAddress = 0;
		*(szAddress+4) = 0;
	}

	while(1)
	{
		printf("Enter a word or \"exit\":");
		scanf("%s", Word);

		// Enter critical section
		while(InterlockedExchange((LONG *)szAddress, 1))
		{
			Sleep(20);
		}

		printf("Previous word:%s\n", szAddress+4);
		strcpy(szAddress+4, Word);

		// Leave critical section
		*(DWORD *)szAddress = 0;

		if (strcmp(Word, "exit") == 0)
			break;
	}

	UnmapViewOfFile(szAddress);
	CloseHandle(hMemory);
	return 0;

}

