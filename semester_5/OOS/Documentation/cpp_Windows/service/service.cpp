//=============================================================================
/**
* Пример системной службы
* См. также пример установки и снятия системной службы
* Курс "Системное программное обеспечение"
*
* The sample of service
* See also the sample of service installation and uninstallation
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>

//=============================================================================
const char *SERVICE_NAME = "Test SPO service";
const char *LOG_FILE_NAME = "c:\\servicelog.txt";

//=============================================================================
/** Current status of the service */
SERVICE_STATUS          ssS;       
/** Handle to service status */
SERVICE_STATUS_HANDLE   ssH;
/** Check point number */
DWORD                   dwCheckPoint = 0;
/** Status of service working */
BOOL					bWorkEnable = TRUE;

//=============================================================================
/**
 * Main service function
 * Callback
 * @param dwArgc - arguments count
 * @param lpszArgv - argumets
 */
VOID WINAPI ServiceMain(DWORD dwArgc, LPTSTR *lpszArgv);
/**
 * Service control
 * Callback
 * @param dwCtrlCode - control code
 */
VOID WINAPI ServiceCtrl(DWORD dwCtrlCode);
/**
 * Service start pending
 */
VOID RunService();
/**
 * Service stop pending
 */
VOID StopService();
/**
 * Working of service
 */
VOID WorkService();
/**
 * Simple log
 */
VOID Log(PCHAR Message);

//=====================================================================
int APIENTRY WinMain(HINSTANCE hInstance,
					 HINSTANCE hPrevInstance,
					 LPSTR     lpCmdLine,
					 int       nCmdShow)
{
	// List of services at this process
	SERVICE_TABLE_ENTRY dispatchTable[] =
	{
		// We have one service at a process
		{ (LPSTR)SERVICE_NAME, (LPSERVICE_MAIN_FUNCTION)ServiceMain},
		{ NULL, NULL }
	};

	// Start dispather to control of services
	StartServiceCtrlDispatcher(dispatchTable);

	return 0;
}

//=====================================================================
/**
 * Main service function
 * Callback
 * @param dwArgc - arguments count
 * @param lpszArgv - argumets
 */
void WINAPI ServiceMain(DWORD dwArgc, LPTSTR *lpszArgv)
{
	// Register the service control function
	ssH = RegisterServiceCtrlHandler( SERVICE_NAME, ServiceCtrl);
	if (!ssH)
	{
		// failure
		ssS.dwCurrentState = SERVICE_STOPPED;
		SetServiceStatus( ssH, &ssS);
		return;
	}

	ssS.dwServiceType = SERVICE_WIN32_OWN_PROCESS;
	ssS.dwServiceSpecificExitCode = 0;
	ssS.dwWin32ExitCode = NO_ERROR;

	// Start pending
	RunService();

	// Working
	WorkService();
}

//=====================================================================
/**
 * Service control
 * Callback
 * @param dwCtrlCode - control code
 */
VOID WINAPI ServiceCtrl(DWORD dwCtrlCode)
{
	// At every call just increment check point
	ssS.dwCheckPoint = dwCheckPoint++;
	ssS.dwWin32ExitCode = NO_ERROR;
	ssS.dwWaitHint = 0;

	switch(dwCtrlCode)
	{
	case SERVICE_CONTROL_INTERROGATE:
		// Checking for living of service from Windows
		break;

	case SERVICE_CONTROL_STOP:
		// Stop pending
		StopService();
		break;
	}

	// n check point
	SetServiceStatus( ssH, &ssS);
}

//=====================================================================
/**
 * Service start pending
 */
VOID RunService()
{
	Log("\nNew run pending\n"); 

	// First check point
	ssS.dwCurrentState = SERVICE_START_PENDING;
	ssS.dwControlsAccepted = SERVICE_CONTROL_INTERROGATE;
	ssS.dwWin32ExitCode = NO_ERROR;
	ssS.dwCheckPoint = dwCheckPoint++;
	ssS.dwWaitHint = 3000; // Windows will wait 3 seconds 
	SetServiceStatus( ssH, &ssS);

	Sleep(1000); // do something...
	Log("Running\n"); 

	// Second check point
	ssS.dwCurrentState = SERVICE_RUNNING;
	ssS.dwControlsAccepted = SERVICE_ACCEPT_STOP;
	ssS.dwWin32ExitCode = NO_ERROR;
	ssS.dwCheckPoint = dwCheckPoint++;
	ssS.dwWaitHint = 0;
	SetServiceStatus( ssH, &ssS);

	dwCheckPoint = 0;
}

//=====================================================================
/**
 * Service stop pending
 */
VOID StopService()
{
	Log("\nStop pending\n"); 

	// First check point
	ssS.dwCurrentState = SERVICE_STOP_PENDING;
	ssS.dwControlsAccepted = SERVICE_CONTROL_INTERROGATE;
	ssS.dwWin32ExitCode = NO_ERROR;
	ssS.dwCheckPoint = dwCheckPoint++;
	ssS.dwWaitHint = 3000; // Windows will wait 3 seconds 
	SetServiceStatus( ssH, &ssS);

	Sleep(1000); // do something...
	bWorkEnable = FALSE;
	Log("Stopped\n"); 

	// Second check point
	ssS.dwCurrentState = SERVICE_STOPPED;
	ssS.dwControlsAccepted = SERVICE_CONTROL_INTERROGATE;
	ssS.dwWin32ExitCode = NO_ERROR;
	ssS.dwCheckPoint = dwCheckPoint++;
	ssS.dwWaitHint = 0;
	SetServiceStatus( ssH, &ssS);
}

//=====================================================================
/**
 * Working of service
 */
VOID WorkService()
{
	// While working log a dot every ten seconds
	while(bWorkEnable)
	{
		Sleep(10000);
		Log("."); 
	}
}

//=====================================================================
/**
 * Simple log
 */
void Log(char *Message)
{
	FILE *f = fopen(LOG_FILE_NAME, "a");
	if (f)
	{
		fwrite(Message, strlen(Message), 1, f);
		fclose(f);
	}
}