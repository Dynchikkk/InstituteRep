#include <windows.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>

#define BUFFER_SIZE 67108864  // Размер буфера для чтения и записи (64 MB)

void swapBuffers(char** buffer1, char** buffer2) {
    char* temp = *buffer1;
    *buffer1 = *buffer2;
    *buffer2 = temp;
}

void CopyFileAsync(const WCHAR* srcPath, const WCHAR* destPath) {
    HANDLE hSrcFile = CreateFileW(srcPath, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_FLAG_OVERLAPPED | FILE_FLAG_NO_BUFFERING, NULL);
    if (hSrcFile == INVALID_HANDLE_VALUE) {
        fwprintf(stderr, L"Failed to open source file. Error: %lu\n", GetLastError());
        return;
    }

    HANDLE hDestFile = CreateFileW(destPath, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_FLAG_OVERLAPPED | FILE_FLAG_NO_BUFFERING, NULL);
    if (hDestFile == INVALID_HANDLE_VALUE) {
        fwprintf(stderr, L"Failed to open destination file. Error: %lu\n", GetLastError());
        CloseHandle(hSrcFile);
        return;
    }

    OVERLAPPED overlappedRead = { 0 };
    OVERLAPPED overlappedWrite = { 0 };

    overlappedRead.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
    overlappedWrite.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);

    if (overlappedRead.hEvent == NULL || overlappedWrite.hEvent == NULL) {
        fwprintf(stderr, L"Failed to create events. Error: %lu\n", GetLastError());
        CloseHandle(hSrcFile);
        CloseHandle(hDestFile);
        return;
    }

    char* buffer1 = (char*)_aligned_malloc(BUFFER_SIZE, BUFFER_SIZE);
    char* buffer2 = (char*)_aligned_malloc(BUFFER_SIZE, BUFFER_SIZE);

    if (buffer1 == NULL || buffer2 == NULL) {
        fwprintf(stderr, L"Failed to allocate aligned buffers.\n");
        CloseHandle(hSrcFile);
        CloseHandle(hDestFile);
        return;
    }

    char* currentBuffer = buffer1;
    char* processingBuffer = buffer2;

    DWORD bytesRead = 0, bytesWritten = 0, bytesReadBefore = 0;
    LARGE_INTEGER fileSize;
    GetFileSizeEx(hSrcFile, &fileSize);
    LONGLONG remainingBytes = fileSize.QuadPart;

    wprintf(L"Starting file copy...\n");
    clock_t startTime = clock();

    for (int i = 0; remainingBytes > 0; i++) {
        if (!ReadFile(hSrcFile, currentBuffer, BUFFER_SIZE, &bytesRead, &overlappedRead)) {
            DWORD error = GetLastError();
            if (error != ERROR_IO_PENDING && error != ERROR_HANDLE_EOF) {
                fwprintf(stderr, L"ReadFile failed. Error: %lu\n", error);
                break;
            }
        }

        if (i == 0) {
            WaitForSingleObject(overlappedRead.hEvent, INFINITE);
            if (!GetOverlappedResult(hSrcFile, &overlappedRead, &bytesRead, FALSE)) {
                fwprintf(stderr, L"GetOverlappedResult failed for ReadFile. Error: %lu\n", GetLastError());
                break;
            }
            if (bytesRead == 0) {
                break; // достигнут конец файла
            }
            swapBuffers(&currentBuffer, &processingBuffer);
            overlappedRead.Offset += bytesRead;
            bytesReadBefore = bytesRead;
            continue;
        }

        if (!WriteFile(hDestFile, processingBuffer, bytesReadBefore, &bytesWritten, &overlappedWrite)) {
            if (GetLastError() != ERROR_IO_PENDING) {
                fwprintf(stderr, L"WriteFile failed. Error: %lu\n", GetLastError());
                break;
            }
        }

        WaitForSingleObject(overlappedWrite.hEvent, INFINITE);
        if (!GetOverlappedResult(hDestFile, &overlappedWrite, &bytesWritten, FALSE)) {
            fwprintf(stderr, L"GetOverlappedResult failed for WriteFile. Error: %lu\n", GetLastError());
            break;
        }

        WaitForSingleObject(overlappedRead.hEvent, INFINITE);
        if (!GetOverlappedResult(hSrcFile, &overlappedRead, &bytesRead, FALSE)) {
            DWORD error = GetLastError();
            if (error == ERROR_HANDLE_EOF) {
                break; // достигнут конец файла
            }
            fwprintf(stderr, L"GetOverlappedResult failed for ReadFile. Error: %lu\n", error);
            break;
        }

        if (bytesRead == 0) {
            break; // достигнут конец файла
        }

        bytesReadBefore = bytesRead;
        overlappedRead.Offset += bytesRead;
        overlappedWrite.Offset += bytesWritten;
        swapBuffers(&currentBuffer, &processingBuffer);
        remainingBytes -= bytesRead;
    }

    clock_t endTime = clock();
    double elapsed = ((double)(endTime - startTime)) / CLOCKS_PER_SEC;

    wprintf(L"File copy completed.\n");
    wprintf(L"Time taken: %.2f seconds.\n", elapsed);

    CloseHandle(hSrcFile);
    CloseHandle(hDestFile);
    CloseHandle(overlappedRead.hEvent);
    CloseHandle(overlappedWrite.hEvent);
    _aligned_free(buffer1);
    _aligned_free(buffer2);
}

int wmain() {
    const WCHAR* srcPath = L"E:\\Study\\InstituteRep\\semester_5\\OOS\\lab7\\from\\temp.txt";
    const WCHAR* dstPath = L"E:\\Study\\InstituteRep\\semester_5\\OOS\\lab7\\to\\temp.txt";

    CopyFileAsync(srcPath, dstPath);

    wprintf(L"Press any key to exit...");
    getchar();  // Ожидание ввода символа

    return 0;
}
