#include <stdio.h>
#include <windows.h>
// #include "serverLib.h"

// �������� ������� �� ���������� ����������
typedef void (*StartClientFunc)();
typedef void (*StartServerFunc)();

int main() {
    // �������� ���������� ������� � �������������� LoadLibrary
    HMODULE hClientLib = LoadLibrary(TEXT("clientLib.dll"));
    if (!hClientLib) {
        printf("Failed to load client library. Error: %d\n", GetLastError());
        return 1;
    }

    // ��������� ������ ������� StartClient �� ���������� �������
    StartClientFunc StartClient = (StartClientFunc)GetProcAddress(hClientLib, "StartClient");
    if (!StartClient) {
        printf("Failed to get StartClient function address. Error: %d\n", GetLastError());
        FreeLibrary(hClientLib);
        return 1;
    }

    // �������� ���������� ������� � �������������� LoadLibrary
    HMODULE hServerLib = LoadLibrary(TEXT("serverLib.dll"));
    if (!hServerLib) {
        printf("Failed to load server library. Error: %d\n", GetLastError());
        return 1;
    }

    // ��������� ������ ������� StartServer �� ���������� �������
    StartServerFunc StartServer = (StartServerFunc)GetProcAddress(hServerLib, "StartServer");
    if (!StartServer) {
        printf("Failed to get StartServer function address. Error: %d\n", GetLastError());
        FreeLibrary(hServerLib);
        return 1;
    }

    // ������ ���������� ����
    StartServer();

    // ������ ����������� ����
    StartClient();

    // ������������ ���������� �������
    FreeLibrary(hClientLib);

    return 0;
}
