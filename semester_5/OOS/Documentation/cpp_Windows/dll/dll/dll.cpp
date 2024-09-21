//=============================================================================
/**
* Пример подключения динамически загружаемой библиотеки
* Курс "Системное программное обеспечение"
*
* The sample of dynamic-link library
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov 
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>

//=============================================================================
/** Variables in shared section */
#pragma data_seg(".datashr")
DWORD dwProcessesAttached = 0;
DWORD dwAllThreadsAttached = 0;
#pragma data_seg() 
#pragma comment(linker, "/SECTION:.datashr,RWS") 

//=============================================================================
DWORD dwThreadsAttached = 0;
/** Exported variable */
__declspec(dllexport) int i = 0;

//=============================================================================
/** Exported entry */
__declspec(dllexport) void GetState()
{
	char szMessage[200];
	wsprintf(szMessage, "Processes attached: %d\nAll threads attached %d\n\
Threads in current process: %d", 
		dwProcessesAttached, dwAllThreadsAttached, dwThreadsAttached);
	MessageBox(0, szMessage, "Sample DLL", MB_OK);
}

//=============================================================================
/** Main DLL function */
BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		++dwProcessesAttached;
		++dwAllThreadsAttached;
		++dwThreadsAttached;
		break;

	case DLL_THREAD_ATTACH:
		++dwAllThreadsAttached;
		++dwThreadsAttached;
		break;

	case DLL_THREAD_DETACH:
		--dwAllThreadsAttached;
		--dwThreadsAttached;
		break;

	case DLL_PROCESS_DETACH:
		--dwProcessesAttached;
		--dwAllThreadsAttached;
		--dwThreadsAttached;
		break;
	}
    return TRUE;
}

