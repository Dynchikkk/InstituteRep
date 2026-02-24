#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <windows.h>
#include <stdio.h>

// Task pool
typedef struct {
    Task task;
    int done;        // 1 if computed successfully
    int in_progress; // 1 if currently assigned to a client
} TaskEntry;

CRITICAL_SECTION queueLock;
CRITICAL_SECTION resultLock;

TaskEntry tasks[256];
int totalTasks = 0;
double finalResult = 0.0;
int activeClients = 0;
int computationFailed = 0;

// Network and tools

SOCKET CreateServerSocket() {
    SOCKET s = socket(AF_INET, SOCK_STREAM, 0);
    if (s == INVALID_SOCKET) {
        printf("socket() failed\n");
        return INVALID_SOCKET;
    }

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(PORT);

    if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
        printf("bind() failed\n");
        closesocket(s);
        return INVALID_SOCKET;
    }

    if (listen(s, MAX_CLIENTS) == SOCKET_ERROR) {
        printf("listen() failed\n");
        closesocket(s);
        return INVALID_SOCKET;
    }

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
    if (gethostname(hostname, sizeof(hostname)) != 0) {
        printf("gethostname() failed\n");
        return;
    }
    struct hostent* host = gethostbyname(hostname);
    if (host == NULL) {
        printf("gethostbyname() failed\n");
        return;
    }
    struct in_addr addr;
    memcpy(&addr, host->h_addr_list[0], sizeof(struct in_addr));

    printf("Server started\n");
    printf("IP: %s\n", inet_ntoa(addr));
    printf("Port: %d\n\n", PORT);
}

void PrintProgress() {
    int doneCount = 0;
    EnterCriticalSection(&queueLock);
    for (int i = 0; i < totalTasks; i++) {
        if (tasks[i].done) {
            doneCount++;
        }
    }
    LeaveCriticalSection(&queueLock);

    int percent = (doneCount * 100) / totalTasks;
    static int lastPrintedPercent = -1;
    if (percent != lastPrintedPercent) {
        lastPrintedPercent = percent;
        printf("\rProgress: %d%%", percent);
        fflush(stdout);
    }
}

// Client handling

int AcceptClients(SOCKET serverSocket, SOCKET clients[]) {
    int count = 0;
    printf("Waiting for clients...\n");
    printf("Press SPACE to start computation\n\n");

    while (!GetAsyncKeyState(VK_SPACE)) {
        fd_set set;
        struct timeval timeout = { 0, 200000 }; // 0.2 sec
        FD_ZERO(&set);
        FD_SET(serverSocket, &set);

        int sel = select(0, &set, NULL, NULL, &timeout);
        if (sel == SOCKET_ERROR) {
            printf("select() failed\n");
            break;
        }

        if (sel > 0) {
            SOCKET client = accept(serverSocket, NULL, NULL);
            if (client == INVALID_SOCKET) {
                printf("accept() failed\n");
                continue;
            }

            if (count < MAX_CLIENTS) {
                // Timeouts will be set later, before computation starts
                clients[count++] = client;
                printf("Client connected. Total: %d\n", count);
            }
            else {
                printf("Max clients reached, rejecting connection\n");
                closesocket(client);
            }
        }
    }

    return count;
}

// Initialize task pool
void InitTasks() {
    double pos = A;
    totalTasks = 0;
    while (pos < B - 1e-12) {
        TaskEntry* te = &tasks[totalTasks];
        te->task.start = pos;
        te->task.end = pos + CHUNK_SIZE;
        if (te->task.end > B) {
            te->task.end = B;
        }
        te->task.step = STEP;
        te->done = 0;
        te->in_progress = 0;
        totalTasks++;
        pos = te->task.end;
    }
}

// Find next available task
// Returns index or -1 if none
int GetNextTaskIndex() {
    for (int i = 0; i < totalTasks; i++) {
        if (!tasks[i].done && !tasks[i].in_progress) {
            tasks[i].in_progress = 1;
            return i;
        }
    }
    return -1;
}

DWORD WINAPI ClientThread(LPVOID param) {
    SOCKET sock = *(SOCKET*)param;

    while (1) {
        // Get a task index
        EnterCriticalSection(&queueLock);
        int taskIdx = GetNextTaskIndex();
        LeaveCriticalSection(&queueLock);

        if (taskIdx == -1) {
            // No more tasks
            break;
        }

        // Prepare message
        ServerMessage msg;
        msg.type = MSG_TASK;
        msg.task = tasks[taskIdx].task;

        // Send task
        if (!SendAll(sock, (char*)&msg, sizeof(msg))) {
            // Client disconnected or timeout
            EnterCriticalSection(&queueLock);
            tasks[taskIdx].in_progress = 0; // make task available again
            LeaveCriticalSection(&queueLock);
            break;
        }

        // Receive result
        double result;
        if (!RecvAll(sock, (char*)&result, sizeof(double))) {
            // Client disconnected or timeout
            EnterCriticalSection(&queueLock);
            tasks[taskIdx].in_progress = 0; // make task available again
            LeaveCriticalSection(&queueLock);
            break;
        }

        // Task completed successfully
        EnterCriticalSection(&queueLock);
        tasks[taskIdx].done = 1;
        tasks[taskIdx].in_progress = 0;
        LeaveCriticalSection(&queueLock);

        // Add to final result
        EnterCriticalSection(&resultLock);
        finalResult += result;
        PrintProgress();
        LeaveCriticalSection(&resultLock);
    }

    // Send STOP message and close socket
    ServerMessage stopMsg;
    stopMsg.type = MSG_STOP;
    SendAll(sock, (char*)&stopMsg, sizeof(stopMsg));

    closesocket(sock);

    EnterCriticalSection(&queueLock);
    activeClients--;
    LeaveCriticalSection(&queueLock);

    return 0;
}

void StartComputation(SOCKET clients[], int count) {
    HANDLE threads[MAX_CLIENTS];

    for (int i = 0; i < count; i++) {
        if (!SetSocketTimeouts(clients[i], SERVER_SOCKET_TIMEOUT)) {
            printf("Warning: could not set timeouts on client %d socket\n", i);
        }
    }

    printf("\nStarting computation...\n\n");

    activeClients = count;
    InitTasks();

    for (int i = 0; i < count; i++) {
        threads[i] = CreateThread(NULL, 0, ClientThread, &clients[i], 0, NULL);
        if (threads[i] == NULL) {
            printf("CreateThread() failed\n");
            activeClients--; // adjust count
        }
    }

    // Wait for all tasks to complete or all clients to disconnect
    while (1) {
        Sleep(100);

        EnterCriticalSection(&queueLock);
        int allDone = 1;
        for (int i = 0; i < totalTasks; i++) {
            if (!tasks[i].done) {
                allDone = 0;
                break;
            }
        }
        int anyActive = (activeClients > 0);
        LeaveCriticalSection(&queueLock);

        if (allDone) {
            break;
        }
        if (!anyActive) {
            printf("\nError: Not all tasks could be computed. All clients disconnected.\n");
            computationFailed = 1;
            break;
        }
    }

    // Wait for threads to finish
    WaitForMultipleObjects(count, threads, TRUE, INFINITE);
    for (int i = 0; i < count; i++) {
        if (threads[i] != NULL) {
            CloseHandle(threads[i]);
        }
    }
}

int main() {
    if (InitWinSock() != 0) {
        printf("WinSock init failed\n");
        return 1;
    }

    InitializeCriticalSection(&queueLock);
    InitializeCriticalSection(&resultLock);

    SOCKET serverSocket = CreateServerSocket();
    if (serverSocket == INVALID_SOCKET) {
        printf("Failed to create server socket\n");
        DeleteCriticalSection(&queueLock);
        DeleteCriticalSection(&resultLock);
        CleanupWinSock();
        return 1;
    }

    PrintServerInfo();

    SOCKET clients[MAX_CLIENTS] = { INVALID_SOCKET };
    int count = AcceptClients(serverSocket, clients);

    if (count == 0) {
        printf("No clients connected\n");
        CleanupServer(serverSocket);
        return 0;
    }

    StartComputation(clients, count);

    if (computationFailed) {
        printf("Computation finished with errors. Partial result: %.10lf\n", finalResult);
    }
    else {
        printf("\nComputation finished successfully\n");
        printf("Final result: %.10lf\n", finalResult);
    }

    CleanupServer(serverSocket);

    getchar();
    return 0;
}