#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <stdio.h>
#include <math.h>
#include <windows.h>

int ConnectToServer(const char* ip, int port, SOCKET* sock) {
    *sock = socket(AF_INET, SOCK_STREAM, 0);
    if (*sock == INVALID_SOCKET) {
        printf("Error: socket() failed with error %d\n", WSAGetLastError());
        return -1;
    }

    if (!SetSocketTimeouts(*sock, CLIENT_SOCKET_TIMEOUT)) {
        printf("Warning: could not set socket timeouts\n");
    }

    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr(ip);
    server.sin_port = htons(port);

    int res = connect(*sock, (struct sockaddr*)&server, sizeof(server));
    if (res < 0) {
        printf("Error: connect() failed with error %d\n", WSAGetLastError());
        closesocket(*sock);
        *sock = INVALID_SOCKET;
    }
    return res;
}

double ComputeIntegral(Task task) {
    //
    // Sleep(3000);
    //

    double sum = 0.0;
    for (double x = task.start; x < task.end; x += task.step) {
        // Check for invalid logarithm input
        if (x <= 0.0 || x + task.step <= 0.0) {
            printf("Error: invalid argument for log\n");
            return 0.0;
        }
        double f1 = 1.0 / log(x);
        double f2 = 1.0 / log(x + task.step);
        sum += (f1 + f2) * 0.5 * task.step;
    }
    return sum;
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

    Task task;
    if (!RecvAll(sock, (char*)&task, sizeof(Task))) {
        printf("Error: failed to receive task (server may have disconnected or timeout)\n");
        closesocket(sock);
        CleanupWinSock();
        return 1;
    }

    printf("Task received: [%.5lf ; %.5lf]\n", task.start, task.end);

    printf("Start calculating... ");
    double result = ComputeIntegral(task);
    printf("result: %.5lf\n", result);

    if (!SendAll(sock, (char*)&result, sizeof(double))) {
        printf("Error: failed to send result to server\n");
        closesocket(sock);
        CleanupWinSock();
        return 1;
    }

    closesocket(sock);
    CleanupWinSock();

    printf("Press any key to exit...\n");
    getchar(); getchar();
    return 0;
}