#include <stdio.h>
#include <winsock2.h>
#pragma comment(lib, "ws2_32.lib")

int main() {
    WSADATA wsaData;
    int err;

    // 1. Инициализация WinSock
    err = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (err != 0) {
        printf("WSAStartup failed: %d\n", err);
        return 1;
    }

    // 2. Создание TCP-сокета
    SOCKET tcpSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (tcpSock == INVALID_SOCKET) {
        printf("Socket creation failed: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    // 3. Настройка адреса и вызов bind()
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY); // принимать на всех интерфейсах
    addr.sin_port = htons(8080);              // порт 8080 (можно поменять)

    if (bind(tcpSock, (struct sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
        printf("Bind failed: %d\n", WSAGetLastError());
        closesocket(tcpSock);
        WSACleanup();
        return 1;
    }

    printf("TCP socket successfully bound to port %d\n", ntohs(addr.sin_port));

    // 4. Закрытие сокета
    closesocket(tcpSock);

    // 5. Завершение работы WinSock
    WSACleanup();

    return 0;
}
