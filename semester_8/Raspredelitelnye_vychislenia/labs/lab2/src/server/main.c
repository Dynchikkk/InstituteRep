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

// Global error flag
int computation_failed = 0;

// Networking
SOCKET CreateServerSocket() {
    SOCKET s = socket(AF_INET, SOCK_STREAM, 0);
    if (s == INVALID_SOCKET) {
        printf("Error: socket() failed with error %d\n", WSAGetLastError());
        return INVALID_SOCKET;
    }

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(PORT);

    if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
        printf("Error: bind() failed with error %d\n", WSAGetLastError());
        closesocket(s);
        return INVALID_SOCKET;
    }

    if (listen(s, MAX_CLIENTS) == SOCKET_ERROR) {
        printf("Error: listen() failed with error %d\n", WSAGetLastError());
        closesocket(s);
        return INVALID_SOCKET;
    }

    return s;
}

void PrintServerInfo() {
    char hostname[256];
    if (gethostname(hostname, sizeof(hostname)) == SOCKET_ERROR) {
        printf("Warning: gethostname() failed with error %d\n", WSAGetLastError());
        return;
    }
    struct hostent* host = gethostbyname(hostname);
    if (host == NULL) {
        printf("Warning: gethostbyname() failed\n");
        return;
    }
    struct in_addr addr;
    memcpy(&addr, host->h_addr_list[0], sizeof(struct in_addr));
    printf("IP: %s\n", inet_ntoa(addr));
    printf("Port: %d\n", PORT);
}

int AcceptClients(SOCKET serverSocket, SOCKET clients[]) {
    int count = 0;
    printf("Press SPACE to start computation\n");

    while (!GetAsyncKeyState(VK_SPACE)) {
        fd_set set;
        struct timeval timeout = { 0, 100000 }; // 0.1 sec
        FD_ZERO(&set);
        FD_SET(serverSocket, &set);

        int sel = select(0, &set, NULL, NULL, &timeout);
        if (sel == SOCKET_ERROR) {
            printf("Error: select() failed with error %d\n", WSAGetLastError());
            continue;
        }

        if (sel > 0) {
            SOCKET clientSock = accept(serverSocket, NULL, NULL);
            if (clientSock == INVALID_SOCKET) {
                printf("Error: accept() failed with error %d\n", WSAGetLastError());
                continue;
            }

            if (count < MAX_CLIENTS) {
                clients[count++] = clientSock;
                printf("Client connected. Total: %d\n", count);
            }
            else {
                printf("Max clients reached, rejecting connection\n");
                closesocket(clientSock);
            }
        }
    }

    return count;
}

// Thread
DWORD WINAPI ClientThread(LPVOID param) {
    ClientData* data = (ClientData*)param;

    if (!SendAll(data->socket, (char*)&data->task, sizeof(Task))) {
        printf("Error: failed to send task to client\n");
        computation_failed = 1;
        closesocket(data->socket);
        return 1;
    }

    if (!RecvAll(data->socket, (char*)&data->result, sizeof(double))) {
        printf("Error: failed to receive result from client\n");
        computation_failed = 1;
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
    int thread_created[MAX_CLIENTS] = { 0 };
    double result = 0.0;

    for (int i = 0; i < count; i++) {
        if (!SetSocketTimeouts(clients[i], SERVER_SOCKET_TIMEOUT)) {
            printf("Warning: could not set timeouts on client %d socket\n", i);
        }
    }

    double interval = (B - A) / count;

    // Prepare tasks
    for (int i = 0; i < count; i++) {
        data[i].socket = clients[i];
        data[i].task.start = A + i * interval;
        data[i].task.end = A + (i + 1) * interval;
        data[i].task.step = STEP;
        data[i].result = 0.0;
    }

    // Create threads
    int threads_created = 0;
    for (int i = 0; i < count; i++) {
        threads[i] = CreateThread(NULL, 0, ClientThread, &data[i], 0, NULL);
        if (threads[i] == NULL) {
            printf("Error: CreateThread() failed for client %d\n", i);
            computation_failed = 1;
        }
        else {
            thread_created[i] = 1;
            threads_created++;
        }
    }

    if (threads_created == 0) {
        printf("Error: no client threads created\n");
        return 0.0;
    }

    // Wait for all threads to finish
    DWORD waitResult = WaitForMultipleObjects(count, threads, TRUE, INFINITE);
    if (waitResult == WAIT_FAILED) {
        printf("Error: WaitForMultipleObjects() failed\n");
        computation_failed = 1;
    }

    // Collect results only if no error occurred
    if (!computation_failed) {
        for (int i = 0; i < count; i++) {
            if (thread_created[i]) {
                result += data[i].result;
            }
        }
    }

    // Close thread handles
    for (int i = 0; i < count; i++) {
        if (thread_created[i]) {
            CloseHandle(threads[i]);
        }
    }

    return result;
}

// Main
int main() {
    if (InitWinSock() != 0) {
        printf("Error: WinSock initialization failed\n");
        return 1;
    }

    SOCKET serverSocket = CreateServerSocket();
    if (serverSocket == INVALID_SOCKET) {
        CleanupWinSock();
        return 1;
    }

    printf("Server started\n");
    PrintServerInfo();

    SOCKET clients[MAX_CLIENTS] = { INVALID_SOCKET };
    int count = AcceptClients(serverSocket, clients);

    if (count == 0) {
        printf("No clients connected\n");
        closesocket(serverSocket);
        CleanupWinSock();
        return 0;
    }

    printf("Starting computation...\n");

    double result = StartDistributedComputation(clients, count);

    if (computation_failed) {
        printf("Error: Computation failed due to client disconnect or timeout.\n");
    }
    else {
        printf("Final result: %.10lf\n", result);
    }

    // Clean up remaining client sockets
    for (int i = 0; i < count; i++) {
        if (clients[i] != INVALID_SOCKET) {
            closesocket(clients[i]);
        }
    }

    closesocket(serverSocket);
    CleanupWinSock();

    printf("Press any key to exit...\n");
    getchar();
    return 0;
}