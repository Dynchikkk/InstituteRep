//=============================================================================
/**
* Пример синхронизации процессов с помощью мьютекса
* Курс "Системное программное обеспечение"
*
* The sample of process synchronization by the mutex
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

// To show synchronization peculiar properties 
// please start at one time several process of this program

//=============================================================================
#include <windows.h>
#include <stdio.h>

//=============================================================================
int main(int argc, char* argv[])
{
	DWORD dwResult;
	DWORD dwCount = 0;

	HANDLE hMutex = CreateMutex(NULL, FALSE, "SPO_Mutex");
	if (!hMutex)
	{
		printf("Error at create mutex\n");
		return 1;
	}

	// 50 tacts of working
	while(dwCount < 50)
	{
		// 100 milliseconds of wait
		dwResult = WaitForSingleObject(hMutex, 100);
		switch (dwResult)
		{
		case WAIT_TIMEOUT:
			// wait timeout signal
			printf("*");
			break;

		case WAIT_ABANDONED:
			// Some process was killed in sleeping
			printf("\nSome process was killed\n");
		case WAIT_OBJECT_0:
			printf("\n%d\n", ++dwCount);
			Sleep(200); // some working emulation
			ReleaseMutex(hMutex);
			Sleep(200); // some working emulation
			break;
		}
	}

	CloseHandle(hMutex);
	return 0;
}

