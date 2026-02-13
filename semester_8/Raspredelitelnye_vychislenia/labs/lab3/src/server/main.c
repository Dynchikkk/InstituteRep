#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <windows.h>
#include <stdio.h>

CRITICAL_SECTION queueLock;
CRITICAL_SECTION resultLock;

double currentTaskStart = A;
double finalResult = 0.0;

double totalRange = B - A;
int lastPrintedPercent = -1;

// Network and tools

SOCKET CreateServerSocket() {

    SOCKET s = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(PORT);

    bind(s, (struct sockaddr*)&addr, sizeof(addr));
    listen(s, MAX_CLIENTS);

    return s;
}

void CleanupServer(SOCKET serverSocket) {

    DeleteCriticalSection(&queueLock);
    DeleteCriticalSection(&resultLock);

    closesocket(serverSocket);
    CleanupWinSock();
}



void PrintServerInfo() {

    char hostname[256];

    gethostname(hostname, sizeof(hostname));
    struct hostent* host = gethostbyname(hostname);

    struct in_addr addr;
    memcpy(&addr, host->h_addr_list[0], sizeof(struct in_addr));

    printf("Server started\n");
    printf("IP: %s\n", inet_ntoa(addr));
    printf("Port: %d\n\n", PORT);
}

void PrintProgress() {

    double completed = currentTaskStart - A;
    int percent = (int)((completed / totalRange) * 100.0);

    if (percent != lastPrintedPercent) {
        lastPrintedPercent = percent;
        printf("\rProgress: %d%%", percent);
        fflush(stdout);
    }
}

// Client handle

int AcceptClients(SOCKET serverSocket, SOCKET clients[]) {

    int count = 0;

    printf("Waiting for clients...\n");
    printf("Press SPACE to start computation\n\n");

    while (!GetAsyncKeyState(VK_SPACE)) {

        fd_set set;
        struct timeval timeout = { 0, 200000 };

        FD_ZERO(&set);
        FD_SET(serverSocket, &set);

        if (select(0, &set, NULL, NULL, &timeout) > 0) {

            SOCKET client = accept(serverSocket, NULL, NULL);

            if (client != INVALID_SOCKET && count < MAX_CLIENTS) {
                clients[count++] = client;
                printf("Client connected. Total: %d\n", count);
            }
        }
    }

    return count;
}

int GetNextTask(Task* task) {

    if (currentTaskStart >= B)
        return 0;

    task->start = currentTaskStart;
    task->end = currentTaskStart + CHUNK_SIZE;

    if (task->end > B)
        task->end = B;

    task->step = STEP;

    currentTaskStart = task->end;

    return 1;
}

DWORD WINAPI ClientThread(LPVOID param) {

    SOCKET sock = *(SOCKET*)param;

    while (1) {

        Task task;
        ServerMessage msg;

        EnterCriticalSection(&queueLock);
        int hasTask = GetNextTask(&task);
        LeaveCriticalSection(&queueLock);

        if (!hasTask)
            break;

        msg.type = MSG_TASK;
        msg.task = task;

        if (!SendAll(sock, (char*)&msg, sizeof(msg)))
            break;

        double result;

        if (!RecvAll(sock, (char*)&result, sizeof(double)))
            break;

        EnterCriticalSection(&resultLock);
        finalResult += result;
        PrintProgress(); 
        LeaveCriticalSection(&resultLock);
    }

    ServerMessage stopMsg;
    stopMsg.type = MSG_STOP;
    SendAll(sock, (char*)&stopMsg, sizeof(stopMsg));

    closesocket(sock);
    return 0;
}

// Computation

void StartComputation(SOCKET clients[], int count) {

    HANDLE threads[MAX_CLIENTS];

    printf("\nStarting computation...\n\n");

    for (int i = 0; i < count; i++) {
        threads[i] = CreateThread(NULL, 0, ClientThread, &clients[i], 0, NULL);
    }

    WaitForMultipleObjects(count, threads, TRUE, INFINITE);

    for (int i = 0; i < count; i++)
        CloseHandle(threads[i]);

    printf("\rProgress: 100%%\n");
}

// Main

int main() {

    if (InitWinSock() != 0) {
        printf("WinSock init failed\n");
        return 1;
    }

    InitializeCriticalSection(&queueLock);
    InitializeCriticalSection(&resultLock);

    SOCKET serverSocket = CreateServerSocket();
    PrintServerInfo();

    SOCKET clients[MAX_CLIENTS];

    int count = AcceptClients(serverSocket, clients);

    if (count == 0) {
        printf("No clients connected\n");
        CleanupServer(serverSocket);
        return 0;
    }

    StartComputation(clients, count);

    printf("\nComputation finished\n");
    printf("Final result: %.10lf\n", finalResult);

    CleanupServer(serverSocket);

    getchar();
    return 0;
}
