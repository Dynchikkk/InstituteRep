#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include <ctype.h>
#include "crypto_net.h"

#define PORT 8888

// создание серверного сокета
SOCKET create_server_socket(int port) {
    SOCKET sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == INVALID_SOCKET) return INVALID_SOCKET;

    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(port);

    if (bind(sock, (struct sockaddr*)&server, sizeof(server)) == SOCKET_ERROR) {
        closesocket(sock);
        return INVALID_SOCKET;
    }

    listen(sock, 3);
    return sock;
}

// обработка клиента
void handle_client(SOCKET client_sock) {
    char msg[BUF_SIZE];

    while (recv_encrypted(client_sock, msg) > 0) {
        printf("Received: %s\n", msg);

        // обработка (верхний регистр)
        for (int i = 0; msg[i]; i++)
            msg[i] = toupper(msg[i]);

        if (send_encrypted(client_sock, msg) <= 0) break;
    }

    printf("Client disconnected\n");
    closesocket(client_sock);
}

int main() {
    SOCKET server_sock, client_sock;
    struct sockaddr_in client;
    int c = sizeof(struct sockaddr_in);

    if (init_winsock() != 0) {
        printf("Error WSAStartup\n");
        return 1;
    }

    server_sock = create_server_socket(PORT);
    if (server_sock == INVALID_SOCKET) {
        printf("Error while creating server\n");
        WSACleanup();
        return 1;
    }

    char host[256];
    gethostname(host, sizeof(host));
    struct hostent* host_entry = gethostbyname(host);
    char* local_ip = inet_ntoa(*(struct in_addr*)*host_entry->h_addr_list);

    printf("Server started on %s:%d\n", local_ip, PORT);

    while ((client_sock = accept(server_sock, (struct sockaddr*)&client, &c)) != INVALID_SOCKET) {
        printf("Client connected\n");
        handle_client(client_sock);
    }

    closesocket(server_sock);
    WSACleanup();
    return 0;
}
