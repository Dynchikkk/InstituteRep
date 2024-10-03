#include <windows.h>
#include <stdio.h>

#define SHARED_MEMORY_NAME L"SharedMemory"
#define MUTEX_NAME L"SharedMemoryMutex"
#define INITIAL_VALUE 0
#define PROCESS_COUNT 3

void Increment(int val)
{
    HANDLE hMapFile = OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, SHARED_MEMORY_NAME);
    int* pSharedMemory = (int*)MapViewOfFile(hMapFile, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(int));
    HANDLE hMutex = OpenMutex(SYNCHRONIZE, FALSE, MUTEX_NAME);

    for (int i = 0; i < 10; ++i) {
        WaitForSingleObject(hMutex, INFINITE);
        (*pSharedMemory) += val;
        wprintf(L"Increment: %d\n", *pSharedMemory);
        ReleaseMutex(hMutex);
        Sleep(100);
    }

    UnmapViewOfFile(pSharedMemory);
    CloseHandle(hMapFile);
    CloseHandle(hMutex);
}
    
void Decrement(int val)
{
    HANDLE hMapFile = OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, SHARED_MEMORY_NAME);
    int* pSharedMemory = (int*)MapViewOfFile(hMapFile, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(int));
    HANDLE hMutex = OpenMutex(SYNCHRONIZE, FALSE, MUTEX_NAME);

    for (int i = 0; i < 10; ++i) {
        WaitForSingleObject(hMutex, INFINITE);
        (*pSharedMemory) -= val;
        wprintf(L"Decrement: %d\n", *pSharedMemory);
        ReleaseMutex(hMutex);
        Sleep(100);
    }

    UnmapViewOfFile(pSharedMemory);
    CloseHandle(hMapFile);
    CloseHandle(hMutex);
}

LPWSTR CreateStartPath(char argv)
{
    WCHAR path[MAX_PATH];
    GetModuleFileName(NULL, path, sizeof(path) / sizeof(path[0]));

    LPWSTR pathArgs = (LPWSTR)malloc(MAX_PATH * sizeof(WCHAR));
    swprintf(pathArgs, MAX_PATH, L"%s %c", path, argv);

    return pathArgs;
}

int main(int argc, char* argv[])
{
    if (argc > 1) {
        if (argv[1][0] == 'i') {
            Increment(1);
        }
        else if (argv[1][0] == 'd') {
            Decrement(2);
        }
        return 0;
    }

    HANDLE hMapFile = CreateFileMapping(INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE, 0, sizeof(int), SHARED_MEMORY_NAME);
    int* pSharedMemory = (int*)MapViewOfFile(hMapFile, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(int));
    *pSharedMemory = INITIAL_VALUE;

    HANDLE hMutex = CreateMutex(NULL, FALSE, MUTEX_NAME);

    PROCESS_INFORMATION pi[PROCESS_COUNT] = { 0 };
    for (size_t i = 0; i < PROCESS_COUNT; i++) {
        STARTUPINFO si = { sizeof(si) };
        LPWSTR startPath = CreateStartPath(i % 2 == 0 ? 'i' : 'd');
        CreateProcess(NULL, startPath, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi[i]);
        free(startPath);
    }

    HANDLE handles[PROCESS_COUNT] = { 0 };
    for (size_t i = 0; i < PROCESS_COUNT; i++) {
        handles[i] = pi[i].hProcess;
    }
    WaitForMultipleObjects(3, handles, TRUE, INFINITE);
    wprintf(L"Final value: %d\n", *pSharedMemory);

    UnmapViewOfFile(pSharedMemory);
    CloseHandle(hMapFile);
    CloseHandle(hMutex);
    for (int i = 0; i < PROCESS_COUNT; ++i) {
        CloseHandle(pi[i].hProcess);
        CloseHandle(pi[i].hThread);
    }

    return 0;
}