#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <windows.h>
#include <stdio.h>

typedef struct {
    SOCKET socket;
    Task task;
    double result;
} ClientData;

// Networking

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

void PrintServerInfo() {
    char hostname[256];

    if (gethostname(hostname, sizeof(hostname)) == SOCKET_ERROR) {
        printf("Failed to get hostname\n");
        return;
    }

    struct hostent* host = gethostbyname(hostname);
    if (host == NULL) {
        printf("Failed to get host info\n");
        return;
    }

    struct in_addr addr;
    memcpy(&addr, host->h_addr_list[0], sizeof(struct in_addr));

    printf("IP: %s\n Port: %d\n", inet_ntoa(addr), PORT);
}

int AcceptClients(SOCKET serverSocket, SOCKET clients[]) {
    int count = 0;

    printf("Press SPACE to start computation\n");

    while (!GetAsyncKeyState(VK_SPACE)) {
        fd_set set;
        struct timeval timeout = { 0, 100000 };

        FD_ZERO(&set);
        FD_SET(serverSocket, &set);

        if (select(0, &set, NULL, NULL, &timeout) > 0) {
            clients[count++] = accept(serverSocket, NULL, NULL);
            printf("Client connected. Total: %d\n", count);
        }
    }

    return count;
}

// Thread

DWORD WINAPI ClientThread(LPVOID param) {
    ClientData* data = (ClientData*)param;

    if (!SendAll(data->socket, (char*)&data->task, sizeof(Task))) {
        closesocket(data->socket);
        return 1;
    }

    if (!RecvAll(data->socket, (char*)&data->result, sizeof(double))) {
        closesocket(data->socket);
        return 1;
    }

    closesocket(data->socket);
    return 0;
}

// Computation

double StartDistributedComputation(SOCKET clients[], int count) {
    ClientData data[MAX_CLIENTS];
    HANDLE threads[MAX_CLIENTS];

    double interval = (B - A) / count;
    double result = 0.0;

    // Prepare task
    for (int i = 0; i < count; i++) {
        data[i].socket = clients[i];
        data[i].task.start = A + i * interval;
        data[i].task.end = A + (i + 1) * interval;
        data[i].task.step = STEP;
        data[i].result = 0.0;
    }

    // Create threads
    for (int i = 0; i < count; i++) {
        threads[i] = CreateThread(NULL, 0, ClientThread, &data[i], 0, NULL);
    }

    // Collect result
    WaitForMultipleObjects(count, threads, TRUE, INFINITE);
    for (int i = 0; i < count; i++) {
        result += data[i].result;
        CloseHandle(threads[i]);
    }

    return result;
}

// Main

int main() {

    if (InitWinSock() != 0) {
        printf("WinSock initialization failed\n");
        return 1;
    }

    SOCKET serverSocket = CreateServerSocket();
    printf("Server started\n");
    PrintServerInfo();

    SOCKET clients[MAX_CLIENTS];
    int count = AcceptClients(serverSocket, clients);

    if (count == 0) {
        printf("No clients connected\n");
        closesocket(serverSocket);
        CleanupWinSock();
        return 0;
    }

    printf("Starting computation...\n");

    double result = StartDistributedComputation(clients, count);

    printf("Final result: %.10lf\n", result);

    closesocket(serverSocket);
    CleanupWinSock();

    getchar();
    return 0;
}
