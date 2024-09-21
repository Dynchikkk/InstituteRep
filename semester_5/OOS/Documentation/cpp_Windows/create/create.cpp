//=============================================================================
/**
* Пример создания процесса
* Курс "Системное программное обеспечение"
*
* The sample of process creation
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>

//=============================================================================
int APIENTRY WinMain(HINSTANCE hInstance,
					 HINSTANCE hPrevInstance,
					 LPSTR     lpCmdLine,
					 int       nCmdShow)
{
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	DWORD dwExitCode;

	// Preliminary memory clearing
	ZeroMemory( &si, sizeof(si) );
	si.cb = sizeof(si);
	ZeroMemory( &pi, sizeof(pi) );

	MessageBox(0, "Press OK to start other process", "The SaMpLe", MB_OK);

	// Creation of process
	if (!CreateProcess(0, "notepad.exe", 0, 0, 0, 0, 0, 0, &si, &pi))
	{
		MessageBox(0, "Error at process creation", "The SaMpLe", MB_OK);
		ExitProcess(1);
	}

	if (!CreateProcess(0, "calc.exe", 0, 0, 0, 0, 0, 0, &si, &pi))
	{
		MessageBox(0, "Error at process creation", "The SaMpLe", MB_OK);
		ExitProcess(1);
	}
	// Closing of unneeded handle to first created thread
	CloseHandle(pi.hThread);

	// Waiting for the exiting of created process
	WaitForSingleObject(pi.hProcess, INFINITE);

	// Get the process exit code
	GetExitCodeProcess(pi.hProcess, &dwExitCode);

	// Closing the last handle
	CloseHandle(pi.hProcess);

	char szMessage[200];
	wsprintf(szMessage, "The exit code of process is 0x%X", dwExitCode);
	MessageBox(0, szMessage, "The sample", MB_OK);

	return 0;
}



