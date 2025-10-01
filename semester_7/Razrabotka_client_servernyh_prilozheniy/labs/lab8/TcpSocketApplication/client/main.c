#define _CRT_SECURE_NO_WARNINGS

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

SOCKET create_client_socket(const char* ip, int port) {
    SOCKET clientSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (clientSock == INVALID_SOCKET) {
        printf("Socket creation failed: %d\n", WSAGetLastError());
        return INVALID_SOCKET;
    }

    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(port);
    inet_pton(AF_INET, ip, &serverAddr.sin_addr);

    if (connect(clientSock, (struct sockaddr*)&serverAddr, sizeof(serverAddr)) == SOCKET_ERROR) {
        printf("Connect failed: %d\n", WSAGetLastError());
        closesocket(clientSock);
        return INVALID_SOCKET;
    }

    return clientSock;
}

void chat_loop(SOCKET sock) {
    char msg[BUFSIZE];
    char buffer[BUFSIZE];

    while (1) {
        printf("You: ");
        if (!fgets(msg, sizeof(msg), stdin)) break;

        // отправляем
        send(sock, msg, (int)strlen(msg), 0);

        if (strncmp(msg, "exit", 4) == 0) {
            printf("Exiting...\n");
            break;
        }

        // ждём ответ сервера
        int bytes = recv(sock, buffer, BUFSIZE - 1, 0);
        if (bytes <= 0) {
            printf("Server disconnected.\n");
            break;
        }
        buffer[bytes] = '\0';
        printf("Server: %s", buffer);
    }
}

int main() {
    if (init_winsock() != 0) {
        printf("WSAStartup failed\n");
        return 1;
    }

    char serverIp[64];
    int serverPort;

    printf("Enter server IP: ");
    scanf("%63s", serverIp);
    printf("Enter server port: ");
    scanf("%d", &serverPort);
    getchar(); // убрать лишний Enter

    SOCKET clientSock = create_client_socket(serverIp, serverPort);
    if (clientSock == INVALID_SOCKET) {
        WSACleanup();
        return 1;
    }

    printf("Connected to server. Type messages (type 'exit' to quit)\n");
    chat_loop(clientSock);

    closesocket(clientSock);
    WSACleanup();
    return 0;
}
