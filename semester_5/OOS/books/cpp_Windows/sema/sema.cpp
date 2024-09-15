//=============================================================================
/**
* Пример синхронизации процессов с помощью семафоров
* Курс "Системное программное обеспечение"
*
* The sample of process synchronization by the semaphore
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hSema;

	// Create the semaphore object
	hSema = CreateSemaphore(NULL, 0, 5, "SPO_Semaphore");
	if (!hSema)
	{
		printf("Error at create semaphore\n");
		return 1;
	}

	// If semaphore already exist that it is a client
	if (GetLastError() != ERROR_ALREADY_EXISTS)
	{
		char szAnyWord[80]; 
		printf("This process is Server\n");
		printf("Type \"exit\" to stop the process or other word to increment semaphore object\n");

		while (1)
		{
			scanf("%s", &szAnyWord);
			if (!strcmp(szAnyWord, "exit"))
				return 0;

			// Increment the count of the specified semaphore object 
			ReleaseSemaphore(hSema, 1, NULL);
		}

	} else
	{
		printf("This process is Client\n");
		// Wait infinetely for increase the semaphore object value
		// Reducing the semaphore object count is automatically
		WaitForSingleObject(hSema, INFINITE);
		printf("Semaphore increment detected\n");
	}

	CloseHandle(hSema);
	return 0;
}
