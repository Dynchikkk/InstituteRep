#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <stdio.h>
#include <math.h>
#include <windows.h>

typedef struct {
    Task task;
    double result;
} ThreadData;

// ===== Integral Worker =====

DWORD WINAPI WorkerThread(LPVOID param) {
    ThreadData* data = (ThreadData*)param;

    double sum = 0.0;
    for (double x = data->task.start; x < data->task.end; x += data->task.step) {
        double f1 = 1.0 / log(x);
        double f2 = 1.0 / log(x + data->task.step);
        sum += (f1 + f2) * 0.5 * data->task.step;
    }

    data->result = sum;
    return 0;
}

// ===== Split Task Across Threads =====

double ComputeParallel(Task task) {

    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    int threadCount = sysInfo.dwNumberOfProcessors;

    HANDLE threads[64];
    ThreadData data[64];

    double interval = (task.end - task.start) / threadCount;

    for (int i = 0; i < threadCount; i++) {
        data[i].task.start = task.start + i * interval;
        data[i].task.end = task.start + (i + 1) * interval;
        data[i].task.step = task.step;
        data[i].result = 0.0;

        threads[i] = CreateThread(NULL, 0, WorkerThread, &data[i], 0, NULL);
    }

    WaitForMultipleObjects(threadCount, threads, TRUE, INFINITE);

    double total = 0.0;
    for (int i = 0; i < threadCount; i++) {
        total += data[i].result;
        CloseHandle(threads[i]);
    }

    return total;
}

// ===== Networking =====

int ConnectToServer(const char* ip, int port, SOCKET* sock) {
    *sock = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr(ip);
    server.sin_port = htons(port);

    return connect(*sock, (struct sockaddr*)&server, sizeof(server));
}

// ===== Main =====

int main() {

    if (InitWinSock() != 0) {
        printf("WinSock init failed\n");
        return 1;
    }

    char ip[64];
    int port;

    printf("Enter server IP: ");
    scanf("%s", ip);
    printf("Enter server port: ");
    scanf("%d", &port);

    SOCKET sock;

    if (ConnectToServer(ip, port, &sock) < 0) {
        printf("Connection failed\n");
        CleanupWinSock();
        return 1;
    }

    while (1) {

        ServerMessage msg;

        if (!RecvAll(sock, (char*)&msg, sizeof(msg)))
            break;

        if (msg.type == MSG_STOP)
            break;

        double result = ComputeParallel(msg.task);

        if (!SendAll(sock, (char*)&result, sizeof(double)))
            break;
    }

    closesocket(sock);
    CleanupWinSock();
    return 0;
}
