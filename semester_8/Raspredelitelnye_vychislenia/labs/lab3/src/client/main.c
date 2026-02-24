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

// Worker thread for computing a sub-range of the integral
DWORD WINAPI WorkerThread(LPVOID param) {
    ThreadData* data = (ThreadData*)param;
    double sum = 0.0;

    if (data->task.start <= 0.0 || data->task.end <= 0.0) {
        printf("Error: invalid task range for logarithm\n");
        data->result = 0.0;
        return 1;
    }

    for (double x = data->task.start; x < data->task.end; x += data->task.step) {
        if (x <= 0.0 || x + data->task.step <= 0.0) {
            printf("Error: invalid argument for log\n");
            return 0.0;
        }

        double f1 = 1.0 / log(x);
        double f2 = 1.0 / log(x + data->task.step);
        sum += (f1 + f2) * 0.5 * data->task.step;
    }

    data->result = sum;
    return 0;
}

// Split a task into chunks and compute in parallel using all CPU cores
double ComputeParallel(Task task, int* errorFlag) {
    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    int threadCount = sysInfo.dwNumberOfProcessors;

    HANDLE threads[64];
    ThreadData data[64];
    double interval = (task.end - task.start) / threadCount;
    int threadsCreated = 0;

    // Create worker threads
    for (int i = 0; i < threadCount; i++) {
        data[i].task.start = task.start + i * interval;
        data[i].task.end = task.start + (i + 1) * interval;
        data[i].task.step = task.step;
        data[i].result = 0.0;
        // Adjust the last chunk to exactly match task.end
        if (i == threadCount - 1) {
            data[i].task.end = task.end;
        }

        threads[i] = CreateThread(NULL, 0, WorkerThread, &data[i], 0, NULL);
        if (threads[i] == NULL) {
            printf("Error: CreateThread() failed for worker %d, error %lu\n", i, GetLastError());
            *errorFlag = 1;
            for (int j = 0; j < i; j++) {
                CloseHandle(threads[j]);
            }
            return 0.0;
        }
        threadsCreated++;
    }

    // Wait for all worker threads to finish
    DWORD waitResult = WaitForMultipleObjects(threadsCreated, threads, TRUE, INFINITE);
    if (waitResult == WAIT_FAILED) {
        printf("Error: WaitForMultipleObjects() failed, error %lu\n", GetLastError());
        *errorFlag = 1;
    }

    // Collect results and close thread handles
    double total = 0.0;
    for (int i = 0; i < threadsCreated; i++) {
        total += data[i].result;
        CloseHandle(threads[i]);
    }

    return total;
}

// Connect to the server with a long timeout to survive startup delay
int ConnectToServer(const char* ip, int port, SOCKET* sock) {
    *sock = socket(AF_INET, SOCK_STREAM, 0);
    if (*sock == INVALID_SOCKET) {
        printf("Error: socket() failed, error %d\n", WSAGetLastError());
        return -1;
    }

    if (!SetSocketTimeouts(*sock, CLIENT_SOCKET_TIMEOUT)) {
        printf("Warning: could not set socket timeouts, error %d\n", WSAGetLastError());
    }

    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr(ip);
    server.sin_port = htons(port);

    int res = connect(*sock, (struct sockaddr*)&server, sizeof(server));
    if (res == SOCKET_ERROR) {
        printf("Error: connect() failed, error %d\n", WSAGetLastError());
        closesocket(*sock);
        *sock = INVALID_SOCKET;
    }
    return res;
}

int main() {
    if (InitWinSock() != 0) {
        printf("Error: WinSock initialization failed\n");
        return 1;
    }

    char ip[64];
    int port;
    printf("Enter server IP: ");
    scanf("%s", ip);
    printf("Enter server port: ");
    scanf("%d", &port);

    SOCKET sock = INVALID_SOCKET;
    if (ConnectToServer(ip, port, &sock) < 0) {
        printf("Connection failed\n");
        CleanupWinSock();
        return 1;
    }

    printf("Connected to server. Waiting for tasks...\n");

    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    int cpuCount = sysInfo.dwNumberOfProcessors;
    printf("This machine has %d CPU cores.\n", cpuCount);

    int taskCounter = 0;
    while (1) {
        ServerMessage msg;

        // Receive message from server
        if (!RecvAll(sock, (char*)&msg, sizeof(msg))) {
            printf("Server connection closed or timeout.\n");
            break;
        }

        if (msg.type == MSG_STOP) {
            printf("Received stop signal from server.\n");
            break;
        }

        if (msg.type != MSG_TASK) {
            printf("Warning: unknown message type %d, ignoring\n", msg.type);
            continue;
        }

        taskCounter++;
        printf("\n--- Task %d ---\n", taskCounter);
        printf("Range: [%.5lf ; %.5lf]\n", msg.task.start, msg.task.end);
        printf("Computing using %d threads...\n", cpuCount);

        int computationError = 0;
        double result = ComputeParallel(msg.task, &computationError);

        if (computationError) {
            printf("Error during computation of task %d, sending 0.0 as result.\n", taskCounter);
            result = 0.0;
        }
        else {
            printf("Task %d computed successfully.\n", taskCounter);
        }

        printf("Result = %.5lf\n", result);

        // Send result back to server
        if (!SendAll(sock, (char*)&result, sizeof(double))) {
            printf("Error: failed to send result for task %d, error %d\n", taskCounter, WSAGetLastError());
            break;
        }

        printf("Result sent to server.\n");
    }

    closesocket(sock);
    CleanupWinSock();
    printf("\nClient finished. Press any key to exit...\n");
    getchar(); getchar();
    return 0;
}