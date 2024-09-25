#include <stdio.h>
#include <windows.h>
#include <time.h>

#define THREAD_COUNT 9

static LONG volatile STATUS = 0;
static int SHARED_DATA = 0;

typedef struct {
	int number;
} ThreadData;

DWORD WINAPI WorkThread(void* p)
{
    ThreadData* data = (ThreadData*)p;
	// Start CRITICAL_SECTION 
	while (InterlockedExchange(&STATUS, TRUE) == TRUE) {
		Sleep(0);
	}
	wprintf(L"%d work. Shared data: %d\n", data->number, SHARED_DATA);
	SHARED_DATA++;
	InterlockedExchange(&STATUS, FALSE);
	// End CRITICAL_SECTION 
	free(data);
    return 0;
}

int main()
{
	HANDLE threads[THREAD_COUNT];
	for (size_t i = 0; i < THREAD_COUNT; i++) {
		ThreadData* data = (ThreadData*)malloc(sizeof(ThreadData));
		data->number = i;
		HANDLE thread = CreateThread(NULL, 0, WorkThread, data, 0, NULL);
		if (thread == NULL) {
			wprintf(L"CreateThread failed (%d).\n", GetLastError());
			exit(EXIT_FAILURE);
		}
		threads[i] = thread;
	}
	WaitForMultipleObjects(THREAD_COUNT, threads, FALSE, INFINITE);
	return 0;
}