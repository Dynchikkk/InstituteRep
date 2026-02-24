#define _WINSOCK_DEPRECATED_NO_WARNINGS
#include "common.h"
#include <stdio.h>

int InitWinSock() {
    WSADATA wsa;
    return WSAStartup(MAKEWORD(2, 2), &wsa);
}

void CleanupWinSock() {
    WSACleanup();
}

int SendAll(SOCKET sock, const char* buffer, int size) {
    int total = 0;
    while (total < size) {
        int sent = send(sock, buffer + total, size - total, 0);
        if (sent <= 0) {
            return 0;
        }
        total += sent;
    }
    return 1;
}

int RecvAll(SOCKET sock, char* buffer, int size) {
    int total = 0;
    while (total < size) {
        int received = recv(sock, buffer + total, size - total, 0);
        if (received <= 0) {
            return 0;
        }
        total += received;
    }
    return 1;
}

int SetSocketTimeouts(SOCKET sock, int timeout_seconds) {
    DWORD timeout = timeout_seconds * 1000;
    if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (const char*)&timeout, sizeof(timeout)) < 0) {
        return 0;
    }
    if (setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, (const char*)&timeout, sizeof(timeout)) < 0) {
        return 0;
    }
    return 1;
}