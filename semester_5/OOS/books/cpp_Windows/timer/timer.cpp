//=============================================================================
/**
* Пример функционирования ждущего таймера
* Курс "Системное программное обеспечение"
*
* The sample of waitable timer processing
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#define _WIN32_WINNT 0x0400
#include <windows.h> 
#include <stdio.h> 

VOID CALLBACK TimerAPCProc(
  LPVOID lpArgToCompletionRoutine,
  DWORD dwTimerLowValue,
  DWORD dwTimerHighValue
);

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hTimer;
	LARGE_INTEGER lnTime;

	// Create manual reset timer
	hTimer = CreateWaitableTimer(NULL, TRUE, "SPO_Timer");
	if (!hTimer)
	{
		printf("Error at create timer\n");
		return 1;
	}

	// 1 second in 100 nanosecond intervals
	lnTime.QuadPart = -10000000; 

	printf("Waiting for timer\n");

	// Set timer with the relative time and 3 second period, in 1 milliseconds intervals
	if (!SetWaitableTimer(hTimer, &lnTime, 3000, TimerAPCProc, NULL, FALSE))
	{
		printf("Error at set timer\n");
		return 1;
	}

	// Sleep while 3 APC routine is to be processed
	while (1)
	{
		static int nCount = 0;
		// Set thread to alertable state
		SleepEx(INFINITE, TRUE);
		if (3 <= ++nCount)
			break;
	}

	CancelWaitableTimer(hTimer);
	CloseHandle(hTimer);

	return 0;
}

//=============================================================================
/** 
 * Timer function
 * CALLBACK
 */
VOID CALLBACK TimerAPCProc(
  LPVOID lpArgToCompletionRoutine,
  DWORD dwTimerLowValue,
  DWORD dwTimerHighValue
)
{
	printf("Timer APC routine\n");
}
