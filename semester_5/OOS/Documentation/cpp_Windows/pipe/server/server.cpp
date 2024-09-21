//=============================================================================
/**
* File: server.cpp
*
* Пример межпроцессного взаимодействия с использованием именованных каналов
* Не забудьте подключить многонитевую библиотеку!!!
* Курс "Системное программное обеспечение"
*
* The sample of process intercommunication by the named pipe
* Don't forget set multithreading library!!!
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>
#include <process.h>
#include "..\pipe.h"

//=============================================================================
/** 
* Intercommunication cycle with a pipe
* Callback. Thread.
* @param Param - handle to a pipe
*/
UINT WINAPI PipeIO(void *Param);

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hPipe;

	printf("This process is Server\n");

	while(1)
	{
		// Create named pipe
		hPipe = CreateNamedPipe(szPIPE_NAME,
			PIPE_ACCESS_INBOUND,
			PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE | PIPE_WAIT,
			PIPE_UNLIMITED_INSTANCES,
			dwBUFSIZE, dwBUFSIZE, dwPIPE_TIMEOUT, NULL);

		if (hPipe == INVALID_HANDLE_VALUE)
		{
			DWORD dwError = GetLastError();
			printf("Error create pipe: %x\n", dwError);
			return 1;
		}

		// Enable a named pipe server process 
		// to wait for a client process to connect to an instance of a named pipe
		if ((ConnectNamedPipe(hPipe, NULL) == 0) && 
			(GetLastError() != ERROR_PIPE_CONNECTED))
		{
			CloseHandle(hPipe);
			printf("Wait timeout expired\n");
			return 0;
		}

		UINT ThreadId;
		HANDLE hThread;
		// Create a thread to intercommunication with a client
		hThread = (HANDLE)_beginthreadex(0, 0, &PipeIO,
			hPipe, 0, &ThreadId);
		if (hThread == NULL) 
		{
			CloseHandle(hPipe);
			return 1;
		} else
			CloseHandle(hThread);
	}

	return 0;
}

//=============================================================================
/** 
* Intercommunication cycle with a pipe
* Callback. Thread.
* @param Param - handle to a pipe
*/
UINT WINAPI PipeIO(void *Param)
{
	HANDLE hPipe = (HANDLE)Param;
	char szReadBuf[dwBUFSIZE];
	DWORD dwCountRead; 
	DWORD dwSizeRead;

	// Read size of a message
	if (!ReadFile(hPipe, &dwSizeRead, 4, &dwCountRead, 0) ||
		dwCountRead != 4)
	{
		printf("Error: Cannot read from pipe\n");
		return 0;
	}

	// Read message
	if (!ReadFile(hPipe, szReadBuf, dwSizeRead, &dwCountRead, 0) ||
		dwCountRead != dwSizeRead)
	{
		printf("Error: Cannot read from pipe\n");
		return 0;
	}

	szReadBuf[dwSizeRead] = 0;
	printf("Message from client: %s\n", szReadBuf);

	// In case of server should write to a pipe, we will call 
	// FlushFileBuffers(hPipe);
	DisconnectNamedPipe(hPipe);

	// If message is directive to stop server than exit process
	if (strcmp(szReadBuf, "exit") == 0)
	{
		ExitProcess(0);
	}

	printf("Bye!\n");
	return 0;
}
