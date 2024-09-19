#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <windows.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PROCESS_COUNT 10
#define MIN_SLEEP_TIME 10000
#define MAX_SLEEP_TIME 20000

PROCESS_INFORMATION startNextProcess(int processNum)
{
	PROCESS_INFORMATION pi;
	STARTUPINFO si;
	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);

	TCHAR cmd[MAX_PATH];
	GetModuleFileName(NULL, cmd, sizeof(cmd) / sizeof(cmd[0]));

	char* src[MAX_PATH];
	sprintf(src, "code.exe %d", processNum);
	TCHAR cmdArgs[MAX_PATH] = { 0, };
	MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, src, strlen(src), cmdArgs, MAX_PATH);

	if (!CreateProcess(cmd, cmdArgs, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)) {
		printf("CreateProcess failed (%d).\n", GetLastError());
		return;
	}
	return pi;
}

void fakeRun(int num, int runTime, PROCESS_INFORMATION subPi)
{
	// START KOSTYL
	runTime += 1000 * (num + 1) * (num % 3 + 1);
	// runTime += 1000 * num;
	// runTime -= 1000 * num;
	// START KOSTYL

	char* resultString = "Process %d end work\n";
	printf("Process %d start work for %d\n", num, runTime);
	if (num == MAX_PROCESS_COUNT - 1) {
		Sleep(runTime);
	} 
	else {
		TCHAR exCode = WaitForSingleObject(subPi.hProcess, runTime);
		if (exCode != WAIT_TIMEOUT) {
			resultString = "Process %d terminate\n";
		}
	}
	printf(resultString, num);
}

int main(int argc, char* argv[])
{
	srand(time(NULL));
	int runTime = rand() % (MAX_SLEEP_TIME - MIN_SLEEP_TIME + 1) + MIN_SLEEP_TIME;
	int processNum = argc > 1 ? atoi(argv[1]) : 0;

	PROCESS_INFORMATION subPi;
	if (processNum < MAX_PROCESS_COUNT) {
		subPi = startNextProcess(processNum + 1);
		fakeRun(processNum, runTime, subPi);
		CloseHandle(subPi.hProcess);
		CloseHandle(subPi.hThread);
	}
	return 0;
}