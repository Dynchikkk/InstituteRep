#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SERVER_PORT 8888
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

// Bind socket to local IP and port
void bind_socket(SOCKET sock, struct sockaddr_in* serverAddr) {
    char hostname[256];
    char ipstr[INET_ADDRSTRLEN];
    struct hostent* host_entry;

    if (gethostname(hostname, sizeof(hostname)) == SOCKET_ERROR) {
        printf("gethostname() failed\n");
        exit(1);
    }

    host_entry = gethostbyname(hostname);
    if (host_entry == NULL) {
        printf("gethostbyname() failed\n");
        exit(1);
    }

    struct in_addr addr;
    memcpy(&addr, host_entry->h_addr_list[0], sizeof(struct in_addr));
    strcpy(ipstr, inet_ntoa(addr));

    serverAddr->sin_family = AF_INET;
    serverAddr->sin_addr = addr;
    serverAddr->sin_port = htons(SERVER_PORT);

    if (bind(sock, (struct sockaddr*)serverAddr, sizeof(*serverAddr)) == SOCKET_ERROR) {
        printf("Bind failed\n");
        closesocket(sock);
        WSACleanup();
        exit(1);
    }

    printf("Server started on %s:%d\n", ipstr, SERVER_PORT);
}

// Reverse string in place
void reverse_string(char* str) {
    int i = 0, j = strlen(str) - 1;
    while (i < j) {
        char tmp = str[i];
        str[i] = str[j];
        str[j] = tmp;
        i++;
        j--;
    }
}

// Main loop: receive and send reversed messages
void run_server(SOCKET sock) {
    struct sockaddr_in clientAddr;
    int clientAddrSize = sizeof(clientAddr);
    char buffer[BUFFER_SIZE];
    int recvLen;

    printf("UDP server is ready to receive messages...\n");

    while (1) {
        recvLen = recvfrom(sock, buffer, BUFFER_SIZE - 1, 0,
            (struct sockaddr*)&clientAddr, &clientAddrSize);
        if (recvLen == SOCKET_ERROR) {
            printf("Receive failed\n");
            break;
        }

        buffer[recvLen] = '\0';

        char clientIP[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &(clientAddr.sin_addr), clientIP, INET_ADDRSTRLEN);
        int clientPort = ntohs(clientAddr.sin_port);

        printf("Client [%s:%d]: %s\n", clientIP, clientPort, buffer);

        /*if (buffer[0] == 'x') {
            printf("Server shutting down...\n");
            break;
        }*/

        // Reverse the message
        reverse_string(buffer);

        // Send back to the SAME client
        sendto(sock, buffer, strlen(buffer), 0,
            (struct sockaddr*)&clientAddr, clientAddrSize);
    }
}

int main() {
    init_winsock();
    SOCKET serverSocket = create_socket();

    struct sockaddr_in serverAddr;
    bind_socket(serverSocket, &serverAddr);

    run_server(serverSocket);

    closesocket(serverSocket);
    WSACleanup();
    return 0;
}
