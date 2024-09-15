//=============================================================================
/**
* File: client.cpp
*
* Пример межпроцессного взаимодействия с использованием именованных каналов
* Курс "Системное программное обеспечение"
*
* The sample of process intercommunication by the named pipe
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>
#include "..\pipe.h"

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hPipe;
	/** Data buffer */
	char   szBuffer[dwBUFSIZE];
	/** Data size */
	DWORD  dwSizeWrite;
	/** Size of actually written data */
	DWORD  dwCountWrite;

	printf("This process is Client\n");

	while(1)
	{
		// Open a pipe
		hPipe = CreateFile(szPIPE_NAME, GENERIC_WRITE, 
			0,  NULL,  OPEN_EXISTING, 0, NULL);
		if (hPipe != INVALID_HANDLE_VALUE)
		{
			// Pipe opened
			break; 
		}

		// Pipe busy
		if (GetLastError() != ERROR_PIPE_BUSY)
		{
			printf("Error: Pipe busy\n");
			return 1; 
		}

		// Pipe instance is not available for connection. Will be wait.
		// Timeout defined by a server while creating a pipe
		if (!WaitNamedPipe(szPIPE_NAME, NMPWAIT_USE_DEFAULT_WAIT) ) 
		{
			printf("Error: timeout expired\n");
			return 1; 
		}
	}

	// Set the read mode and the blocking mode of the specified named pipe
	// Data is read from the pipe as a stream of messages
	DWORD dwMode = PIPE_READMODE_MESSAGE; 
	if(!SetNamedPipeHandleState(hPipe, &dwMode, NULL, NULL))
	{
		printf("Error: Cannot set pipe handle state\n");
		CloseHandle(hPipe); 
		return 1;
	}

	printf("Enter a word to send:");
	scanf("%s", szBuffer);
	dwSizeWrite = strlen(szBuffer);

	// Send a size of message
	if (!WriteFile(hPipe, &dwSizeWrite, 4, &dwCountWrite, 0) ||
		dwCountWrite != 4)
	{
		printf("Error: Cannot send a size of message\n");
		CloseHandle(hPipe); 
		return 1;
	}

	// Send a message
	if (!WriteFile(hPipe, szBuffer, dwSizeWrite, &dwCountWrite, 0) ||
		dwCountWrite != dwSizeWrite)
	{
		printf("Error: Cannot send a message\n");
		CloseHandle(hPipe); 
		return 1;
	}

	// Flush data to a channel
	FlushFileBuffers(hPipe);
	CloseHandle(hPipe); 
	printf("Bye!\n");
	return 0;
}
