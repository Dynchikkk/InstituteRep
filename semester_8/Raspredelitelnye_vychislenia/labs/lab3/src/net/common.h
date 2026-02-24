#ifndef COMMON_H
#define COMMON_H

#include <winsock2.h>

#define A 10.0
#define B 20.0
#define STEP 0.0000001
#define PORT 54000
#define MAX_CLIENTS 64
#define CHUNK_SIZE 0.1

// Timeout values
#define SERVER_SOCKET_TIMEOUT 5   // 5 seconds for operations during computation
#define CLIENT_SOCKET_TIMEOUT 60  // 60 seconds for client to wait for server start

typedef struct {
    double start;
    double end;
    double step;
} Task;

typedef enum {
    MSG_TASK = 1,
    MSG_STOP = 2
} MessageType;

typedef struct {
    MessageType type;
    Task task;
} ServerMessage;

// WinSock
int InitWinSock();
void CleanupWinSock();

// Send / Recv with timeouts
int SendAll(SOCKET sock, const char* buffer, int size);
int RecvAll(SOCKET sock, char* buffer, int size);
int SetSocketTimeouts(SOCKET sock, int timeout_seconds);

#endif