#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

// Initialize WinSock library
void init_winsock() {
    WSADATA wsaData;
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        printf("WinSock initialization failed\n");
        exit(1);
    }
}

// Create UDP socket
SOCKET create_socket() {
    SOCKET sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock == INVALID_SOCKET) {
        printf("Socket creation failed\n");
        WSACleanup();
        exit(1);
    }
    return sock;
}

// Ask user for server IP and port
void setup_server_addr(struct sockaddr_in* serverAddr) {
    char ipstr[64];
    int port;

    printf("Enter server IP address: ");
    scanf("%63s", ipstr);

    printf("Enter server port: ");
    scanf("%d", &port);
    getchar(); // consume newline

    serverAddr->sin_family = AF_INET;
    serverAddr->sin_port = htons(port);

    if (inet_pton(AF_INET, ipstr, &(serverAddr->sin_addr)) <= 0) {
        printf("Invalid IP address\n");
        exit(1);
    }
}

// Main loop: send and receive messages
void run_client(SOCKET sock, struct sockaddr_in* serverAddr) {
    char buffer[BUFFER_SIZE];
    int serverAddrSize = sizeof(*serverAddr);
    int recvLen;

    while (1) {
        printf("Enter messages for the server (x - exit): ");
        fgets(buffer, BUFFER_SIZE, stdin);
        buffer[strcspn(buffer, "\n")] = 0; // remove newline

        if (buffer[0] == 'x') {
            printf("Client shutting down...\n");
            break;
        }

        sendto(sock, buffer, strlen(buffer), 0,
            (struct sockaddr*)serverAddr, serverAddrSize);

        recvLen = recvfrom(sock, buffer, BUFFER_SIZE, 0,
            (struct sockaddr*)serverAddr, &serverAddrSize);
        if (recvLen == SOCKET_ERROR) {
            printf("Receive failed\n");
            break;
        }

        buffer[recvLen] = '\0';
        printf("Server: %s\n", buffer);
    }
}

int main() {
    init_winsock();
    SOCKET clientSocket = create_socket();

    struct sockaddr_in serverAddr;
    setup_server_addr(&serverAddr);

    run_client(clientSocket, &serverAddr);

    closesocket(clientSocket);
    WSACleanup();
    return 0;
}
