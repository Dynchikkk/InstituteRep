#ifndef COMMON_H
#define COMMON_H

#include <winsock2.h>

#define A 10.0
#define B 20.0
#define STEP 0.0000001
#define PORT 54000
#define MAX_CLIENTS 64

typedef struct {
    double start;
    double end;
    double step;
} Task;

// WinSock
int InitWinSock();
void CleanupWinSock();

// Send and receive
int SendAll(SOCKET sock, const char* buffer, int size);
int RecvAll(SOCKET sock, char* buffer, int size);

#endif
