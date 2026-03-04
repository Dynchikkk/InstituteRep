#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include "common.h"
#include <windows.h>
#include <stdio.h>
#include <time.h>

// Task pool
typedef struct {
    Task task;
    int done;       
    int in_progress; 
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
    memcpy(&addr, host->h_addr_list[1], sizeof(struct in_addr));

    printf("Server started\n");
    printf("IP: %s\n", inet_ntoa(addr));
    printf("Port: %d\n\n", PORT);
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

int AcceptFirstClient(SOCKET serverSocket, SOCKET* firstClient) {
    printf("Waiting for the first client to start...\n");
    while (1) {
        SOCKET client = accept(serverSocket, NULL, NULL);
        if (client != INVALID_SOCKET) {
            *firstClient = client;
            printf("First client connected. Starting computation...\n");
            return 1;
        }
    }
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
            tasks[taskIdx].in_progress = 0;
            LeaveCriticalSection(&queueLock);
            break;
        }

        // Receive result
        double result;
        if (!RecvAll(sock, (char*)&result, sizeof(double))) {
            // Client disconnected or timeout
            EnterCriticalSection(&queueLock);
            tasks[taskIdx].in_progress = 0;
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
        LeaveCriticalSection(&resultLock);
    }

    ServerMessage stopMsg;
    stopMsg.type = MSG_STOP;
    SendAll(sock, (char*)&stopMsg, sizeof(stopMsg));
    closesocket(sock);
    EnterCriticalSection(&queueLock);
    activeClients--;
    LeaveCriticalSection(&queueLock);
    return 0;
}

void StartComputation(SOCKET serverSocket, SOCKET firstClient) {
    HANDLE threads[MAX_CLIENTS] = { NULL };
    SOCKET clients[MAX_CLIENTS];
    int clientCount = 0;

    // Инициализация задач
    InitTasks();
    printf("\nComputation in progress...\n");

    // Добавляем первого клиента
    clients[clientCount] = firstClient;
    SetSocketTimeouts(clients[clientCount], SERVER_SOCKET_TIMEOUT);
    threads[clientCount] = CreateThread(NULL, 0, ClientThread, &clients[clientCount], 0, NULL);
    clientCount++;

    EnterCriticalSection(&queueLock);
    activeClients = 1;
    LeaveCriticalSection(&queueLock);

    // Основной цикл: следим за задачами и принимаем новых клиентов
    while (1) {
        // 1. Пытаемся принять новых клиентов без блокировки
        fd_set set;
        struct timeval timeout = { 0, 10000 }; // 10ms
        FD_ZERO(&set);
        FD_SET(serverSocket, &set);

        if (select(0, &set, NULL, NULL, &timeout) > 0) {
            SOCKET newClient = accept(serverSocket, NULL, NULL);
            if (newClient != INVALID_SOCKET && clientCount < MAX_CLIENTS) {
                clients[clientCount] = newClient;
                SetSocketTimeouts(clients[clientCount], SERVER_SOCKET_TIMEOUT);

                EnterCriticalSection(&queueLock);
                activeClients++;
                LeaveCriticalSection(&queueLock);

                threads[clientCount] = CreateThread(NULL, 0, ClientThread, &clients[clientCount], 0, NULL);
                printf("New client joined during computation. Total: %d\n", clientCount + 1);
                clientCount++;
            }
        }

        // 2. Проверяем состояние задач
        EnterCriticalSection(&queueLock);
        int allDone = 1;
        for (int i = 0; i < totalTasks; i++) {
            if (!tasks[i].done) { allDone = 1; break; } // Ошибка в логике была в оригинале: надо allDone = 0
        }
        // Исправленная проверка:
        allDone = 1;
        for (int i = 0; i < totalTasks; i++) if (!tasks[i].done) { allDone = 0; break; }

        int running = activeClients;
        LeaveCriticalSection(&queueLock);

        if (allDone) break;
        if (running <= 0) {
            printf("\nError: All clients lost.\n");
            computationFailed = 1;
            break;
        }
        Sleep(50);
    }

    // Ожидание завершения всех запущенных потоков
    for (int i = 0; i < clientCount; i++) {
        if (threads[i]) {
            WaitForSingleObject(threads[i], 2000);
            CloseHandle(threads[i]);
        }
    }
}

int main() {
    // Init
    if (InitWinSock() != 0) {
        printf("WinSock init failed\n");
        return 1;
    }

    InitializeCriticalSection(&queueLock);
    InitializeCriticalSection(&resultLock);

    // Create socket
    SOCKET serverSocket = CreateServerSocket();
    if (serverSocket == INVALID_SOCKET) {
        printf("Failed to create server socket\n");
        DeleteCriticalSection(&queueLock);
        DeleteCriticalSection(&resultLock);
        CleanupWinSock();
        return 1;
    }

    PrintServerInfo();

    // Wait first client
    SOCKET firstClient = INVALID_SOCKET;
    printf("Waiting for the first client to start computation...\n");

    while (firstClient == INVALID_SOCKET) {
        firstClient = accept(serverSocket, NULL, NULL);
        if (firstClient == INVALID_SOCKET) {
            Sleep(100);
        }
    }

    printf("First client connected! Starting work immediately...\n");

    // Start computation
    clock_t start_work = clock();
    StartComputation(serverSocket, firstClient);
    clock_t end_work = clock();

    // Result
    if (computationFailed) {
        printf("\nComputation finished with errors. Partial result: %.10lf\n", finalResult);
    }
    else {
        printf("\nComputation finished successfully\n");
        printf("Final result: %.10lf\n", finalResult);
        printf("Work time: %.3f seconds\n", (double)(end_work - start_work) / CLOCKS_PER_SEC);
    }

    
    CleanupServer(serverSocket);
    printf("\nPress Enter to exit...");
    getchar();
    return 0;
}
