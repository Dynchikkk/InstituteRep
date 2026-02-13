#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <math.h>
#include "common.h"

// Networking

int ConnectToServer(const char* ip, int port, SOCKET* sock) {
    *sock = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr(ip);
    server.sin_port = htons(port);

    return connect(*sock, (struct sockaddr*)&server, sizeof(server));
}

// Calculation

double ComputeIntegral(Task task) {
    double sum = 0.0;

    for (double x = task.start; x < task.end; x += task.step) {
        double f1 = 1.0 / log(x);
        double f2 = 1.0 / log(x + task.step);
        sum += (f1 + f2) * 0.5 * task.step;
    }

    return sum;
}

// Main

int main() {

    if (InitWinSock() != 0) {
        printf("WinSock initialization failed\n");
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

    // Receive task
    Task task;
    if (!RecvAll(sock, (char*)&task, sizeof(Task))) {
        printf("Failed to receive task\n");
        closesocket(sock);
        CleanupWinSock();
        return 1;
    }

    printf("Task received: [%.5lf ; %.5lf]\n", task.start, task.end);

    // Calculate
    printf("Start calculating... ");
    double result = ComputeIntegral(task);
    printf("result: %.5lf\n", result);

    // Send Result
    SendAll(sock, (char*)&result, sizeof(double));

    closesocket(sock);
    CleanupWinSock();

    getchar();
    return 0;
}
