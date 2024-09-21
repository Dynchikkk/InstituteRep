//=============================================================================
/**
* Пример подключения динамически загружаемой библиотеки
* Курс "Системное программное обеспечение"
*
* The sample of loading dynamic-link library
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov 
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>

//=============================================================================
/** Type of imported entry */
typedef void (*PGetState)();

//=============================================================================
int APIENTRY WinMain(HINSTANCE hInstance,
					 HINSTANCE hPrevInstance,
					 LPSTR     lpCmdLine,
					 int       nCmdShow)
{
	HMODULE hDll;
	PGetState pGetState;
	
	// Loading library
	hDll = LoadLibrary("dll.dll");
	if (!hDll)
	{
		MessageBox(0, "Error loading dll", "Sample loader", MB_OK);
		return 1;
	}

	// Getting address of imported entry
	pGetState = (PGetState)GetProcAddress(hDll, "?GetState@@YAXXZ");
	if (!pGetState)
	{
		MessageBox(0, "Error getting address of function", "Sample loader", MB_OK);
		return 1;
	}

	// Call imported entry
	pGetState();

	FreeLibrary(hDll);

	return 0;
}