#include <stdio.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#pragma comment(lib, "ws2_32.lib")

#define BUFSIZE 512

int init_winsock() {
    WSADATA wsaData;
    return WSAStartup(MAKEWORD(2, 2), &wsaData);
}

SOCKET create_listen_socket() {
    SOCKET listenSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (listenSock == INVALID_SOCKET) {
        printf("Socket creation failed: %d\n", WSAGetLastError());
        return INVALID_SOCKET;
    }

    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    serverAddr.sin_port = htons(0); // динамический порт

    if (bind(listenSock, (struct sockaddr*)&serverAddr, sizeof(serverAddr)) == SOCKET_ERROR) {
        printf("Bind failed: %d\n", WSAGetLastError());
        closesocket(listenSock);
        return INVALID_SOCKET;
    }

    if (listen(listenSock, SOMAXCONN) == SOCKET_ERROR) {
        printf("Listen failed: %d\n", WSAGetLastError());
        closesocket(listenSock);
        return INVALID_SOCKET;
    }

    return listenSock;
}

void print_server_info(SOCKET sock) {
    struct sockaddr_in localAddr;
    int addrLen = sizeof(localAddr);

    if (getsockname(sock, (struct sockaddr*)&localAddr, &addrLen) == 0) {
        char ipStr[INET_ADDRSTRLEN] = "0.0.0.0";

        char hostname[256];
        if (gethostname(hostname, sizeof(hostname)) == 0) {
            struct addrinfo hints, * res = NULL;
            ZeroMemory(&hints, sizeof(hints));
            hints.ai_family = AF_INET;

            if (getaddrinfo(hostname, NULL, &hints, &res) == 0) {
                struct sockaddr_in* addr = (struct sockaddr_in*)res->ai_addr;
                inet_ntop(AF_INET, &addr->sin_addr, ipStr, sizeof(ipStr));
                freeaddrinfo(res);
            }
        }

        printf("Server listening on %s:%d\n", ipStr, ntohs(localAddr.sin_port));
    }
}

SOCKET wait_for_client(SOCKET listenSock) {
    struct sockaddr_in clientAddr;
    int clientLen = sizeof(clientAddr);

    SOCKET clientSock = accept(listenSock, (struct sockaddr*)&clientAddr, &clientLen);
    if (clientSock == INVALID_SOCKET) {
        printf("Accept failed: %d\n", WSAGetLastError());
        return INVALID_SOCKET;
    }

    char clientIp[INET_ADDRSTRLEN];
    inet_ntop(AF_INET, &clientAddr.sin_addr, clientIp, sizeof(clientIp));
    printf("Client connected from %s:%d\n", clientIp, ntohs(clientAddr.sin_port));

    return clientSock;
}

void chat_loop(SOCKET clientSock) {
    char buffer[BUFSIZE];

    while (1) {
        int bytes = recv(clientSock, buffer, BUFSIZE - 1, 0);
        if (bytes <= 0) {
            printf("Client disconnected.\n");
            break;
        }
        buffer[bytes] = '\0';
        printf("Client: %s", buffer);

        if (strncmp(buffer, "exit", 4) == 0) {
            printf("Closing connection...\n");
            break;
        }

        // Ёхо-ответ сервером
        send(clientSock, buffer, bytes, 0);
    }
}

int main() {
    if (init_winsock() != 0) {
        printf("WSAStartup failed\n");
        return 1;
    }

    SOCKET listenSock = create_listen_socket();
    if (listenSock == INVALID_SOCKET) {
        WSACleanup();
        return 1;
    }

    print_server_info(listenSock);

    SOCKET clientSock = wait_for_client(listenSock);
    if (clientSock != INVALID_SOCKET) {
        chat_loop(clientSock);
        closesocket(clientSock);
    }

    closesocket(listenSock);
    WSACleanup();
    return 0;
}
