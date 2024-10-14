#include <stdio.h>
#include <windows.h>
// #include "serverLib.h"

// Прототип функции из клиентской библиотеки
typedef void (*StartClientFunc)();
typedef void (*StartServerFunc)();

int main() {
    // Загрузка библиотеки клиента с использованием LoadLibrary
    HMODULE hClientLib = LoadLibrary(TEXT("clientLib.dll"));
    if (!hClientLib) {
        printf("Failed to load client library. Error: %d\n", GetLastError());
        return 1;
    }

    // Получение адреса функции StartClient из библиотеки клиента
    StartClientFunc StartClient = (StartClientFunc)GetProcAddress(hClientLib, "StartClient");
    if (!StartClient) {
        printf("Failed to get StartClient function address. Error: %d\n", GetLastError());
        FreeLibrary(hClientLib);
        return 1;
    }

    // Загрузка библиотеки клиента с использованием LoadLibrary
    HMODULE hServerLib = LoadLibrary(TEXT("serverLib.dll"));
    if (!hServerLib) {
        printf("Failed to load server library. Error: %d\n", GetLastError());
        return 1;
    }

    // Получение адреса функции StartServer из библиотеки клиента
    StartServerFunc StartServer = (StartServerFunc)GetProcAddress(hServerLib, "StartServer");
    if (!StartServer) {
        printf("Failed to get StartServer function address. Error: %d\n", GetLastError());
        FreeLibrary(hServerLib);
        return 1;
    }

    // Запуск серверного кода
    StartServer();

    // Запуск клиентского кода
    StartClient();

    // Освобождение библиотеки клиента
    FreeLibrary(hClientLib);

    return 0;
}
