#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define BUFFER_SIZE 4096

typedef struct {
    const WCHAR* srcPath;
    const WCHAR* dstPath;
} CopyFileParams;

DWORD WINAPI CopyFileThread(LPVOID params) {
    CopyFileParams* paths = (CopyFileParams*)params;
    HANDLE hSrcFile = CreateFileW(paths->srcPath, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
    if (hSrcFile == INVALID_HANDLE_VALUE) {
        wprintf(L"Failed to open source file.\n");
        return 1;
    }

    HANDLE hDstFile = CreateFileW(paths->dstPath, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_FLAG_OVERLAPPED, NULL);
    if (hDstFile == INVALID_HANDLE_VALUE) {
        wprintf(L"Failed to create destination file.\n");
        CloseHandle(hSrcFile);
        return 1;
    }

    BYTE buffer[BUFFER_SIZE];
    OVERLAPPED olRead = { 0 };
    OVERLAPPED olWrite = { 0 };

    olRead.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
    olWrite.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);

    if (olRead.hEvent == NULL || olWrite.hEvent == NULL) {
        wprintf(L"Failed to create events.\n");
        CloseHandle(hSrcFile);
        CloseHandle(hDstFile);
        return 1;
    }

    DWORD bytesRead, bytesWritten;
    bool isReading = true;

    while (isReading) {
        if (!ReadFile(hSrcFile, buffer, BUFFER_SIZE, NULL, &olRead)) {
            if (GetLastError() == ERROR_IO_PENDING) {
                WaitForSingleObject(olRead.hEvent, INFINITE);
            }
            else {
                wprintf(L"ReadFile failed.\n");
                break;
            }
        }

        if (GetOverlappedResult(hSrcFile, &olRead, &bytesRead, FALSE) && bytesRead > 0) {
            if (!WriteFile(hDstFile, buffer, bytesRead, NULL, &olWrite)) {
                if (GetLastError() == ERROR_IO_PENDING) {
                    WaitForSingleObject(olWrite.hEvent, INFINITE);
                }
                else {
                    wprintf(L"WriteFile failed.\n");
                    break;
                }
            }

            if (!GetOverlappedResult(hDstFile, &olWrite, &bytesWritten, FALSE) || bytesWritten != bytesRead) {
                wprintf(L"WriteFile incomplete.\n");
                break;
            }

            olRead.Offset += bytesRead;
            olWrite.Offset += bytesWritten;
        }
        else {
            isReading = false;
        }
    }

    CloseHandle(olRead.hEvent);
    CloseHandle(olWrite.hEvent);
    CloseHandle(hSrcFile);
    CloseHandle(hDstFile);
    free(paths);
    return 0;
}

int main() {
    const WCHAR* srcPath = L"E:\\Study\\InstituteRep\\semester_5\\OOS\\lab7\\from\\temp.txt";
    const WCHAR* dstPath = L"E:\\Study\\InstituteRep\\semester_5\\OOS\\lab7\\to\\temp.txt";
    CopyFileParams* params = (CopyFileParams*)malloc(sizeof(CopyFileParams));
    params->srcPath = srcPath;
    params->dstPath = dstPath;
    HANDLE hThread = CreateThread(NULL, 0, CopyFileThread, params, 0, NULL);

    if (hThread == NULL) {
        wprintf(L"Failed to create thread.\n");
        free(params);
    }
    else {
        WaitForSingleObject(hThread, INFINITE);
        CloseHandle(hThread);
    }
    return 0;
}
