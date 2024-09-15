//=============================================================================
/**
* Пример установки и снятия системной службы
* См. также пример системной службы
* Курс "Системное программное обеспечение"
*
* The sample of service installation and uninstallation
* See also the sample of service
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>

//=============================================================================
/** Name of service */
const char *SERVICE_NAME = "Test SPO service";
/** Path to service program. Must be present. */
const char szPath[MAX_PATH] = "c:\\service.exe";

//=============================================================================
int APIENTRY WinMain(HINSTANCE hInstance,
					 HINSTANCE hPrevInstance,
					 LPSTR     lpCmdLine,
					 int       nCmdShow)
{
	SC_HANDLE   schService;
	SC_HANDLE   schSCManager;
	BOOL bResult = FALSE;

	schSCManager = OpenSCManager(
		NULL,                   // machine (NULL == local)
		NULL,                   // database (NULL == default)
		SC_MANAGER_ALL_ACCESS   // access required
		);
	if ( schSCManager )
	{

		if (MessageBox(0, "Hit 'Yes' to create or 'No' to delete the service", 
			"Service", MB_YESNO) == IDYES)
		{
			// Service installation

			schService = CreateService(
				schSCManager,               // SCManager database
				SERVICE_NAME,		        // name of service
				SERVICE_NAME,				// name to display
				SERVICE_ALL_ACCESS,         // desired access
				SERVICE_WIN32_OWN_PROCESS
				| SERVICE_INTERACTIVE_PROCESS ,  // service type
				SERVICE_AUTO_START,		      // start type
				SERVICE_ERROR_IGNORE,       // error control type
				szPath,                     // service's binary
				NULL,                       // no load ordering group
				NULL,                       // no tag identifier
				NULL,				        // dependencies
				NULL,                       // LocalSystem account
				NULL);                      // no password
			// If service created
			if ( schService )
			{
				// than start service
				if (StartService(schService, 0, 0))
					bResult = TRUE;
				CloseServiceHandle(schService);
			}
		} else
		{
			// Service uninstallation

			schService = OpenService(schSCManager, SERVICE_NAME, SERVICE_ALL_ACCESS);
			// If service present
			if (schService)
			{
				SERVICE_STATUS ss;
				// Stop service
				ControlService(schService, SERVICE_CONTROL_STOP, &ss);

				// Delete service
				if (DeleteService(schService))
					bResult = TRUE;

				CloseServiceHandle(schService);
			}
		}

		CloseServiceHandle(schSCManager);
	}

	if (bResult)
		MessageBox(0, "Success", "Service", 0);
	else
		MessageBox(0, "Error", "Service", 0);

	return 0;
}



