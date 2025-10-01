#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#pragma comment(lib, "ws2_32.lib")

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

void print_local_info(SOCKET sock) {
    struct sockaddr_in localAddr;
    int addrLen = sizeof(localAddr);

    if (getsockname(sock, (struct sockaddr*)&localAddr, &addrLen) == 0) {
        char ipStr[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &localAddr.sin_addr, ipStr, sizeof(ipStr));
        printf("Client is running on %s:%d\n", ipStr, ntohs(localAddr.sin_port));
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
    getchar();

    SOCKET clientSock = create_client_socket(serverIp, serverPort);
    if (clientSock == INVALID_SOCKET) {
        WSACleanup();
        return 1;
    }

    print_local_info(clientSock);

    printf("Press ENTER to exit...\n");
    getchar();

    closesocket(clientSock);
    WSACleanup();
    return 0;
}
