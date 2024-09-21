//=============================================================================
/**
* Пример межпроцессного взаимодействия с помощью сигналов
* Курс "Системное программное обеспечение"
*
* The sample of interprocess communication by the event
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
	HANDLE hEvent;

	// Create the named automatic event
	hEvent = CreateEvent(NULL, FALSE, FALSE, "Sample event");
	if (!hEvent)
	{
		printf("Error while create the event\n");
		return 1;
	}

	// The first copy of process become a server
	// If the event already exists this mean second (and more) sample process
	if (GetLastError() != ERROR_ALREADY_EXISTS)
	{
		char szAnyWord[80]; 
		printf("This process is Server\n");
		printf("Type \"exit\" to stop the process or other word to set the event\n");

		while (1)
		{
			scanf("%s", &szAnyWord);
			if (!strcmp(szAnyWord, "exit"))
				return 0;

			// Set event for one waiting process
			if (SetEvent(hEvent))
			{
				printf("Set event\n");
			} else
			{
				printf("Error while set the event\n");
			}
		}

	} else
	{
		printf("This process is Client\n");
		printf("Client infinitely wait for the event\n");
		// Waiting for the event
		WaitForSingleObject(hEvent, INFINITE);
		printf("Event detected!\n");
	}

	CloseHandle(hEvent);
	printf("Bye!");
	return 0;
}
