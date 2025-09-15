#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS

#include <crypto_net.h>

// создание соединения
SOCKET create_connection(const char* ip, int port) {
    SOCKET sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == INVALID_SOCKET) return INVALID_SOCKET;

    struct sockaddr_in server;
    server.sin_addr.s_addr = inet_addr(ip);
    server.sin_family = AF_INET;
    server.sin_port = htons(port);

    if (connect(sock, (struct sockaddr*)&server, sizeof(server)) < 0) {
        closesocket(sock);
        return INVALID_SOCKET;
    }
    return sock;
}

// цикл общения
void chat_loop(SOCKET sock) {
    char message[BUF_SIZE], reply[BUF_SIZE];

    while (1) {
        printf("Insert message ('exit' for quit): ");
        scanf("%s", message);

        if (strcmp(message, "exit") == 0) break;

        if (send_encrypted(sock, message) <= 0) {
            printf("Send error\n");
            break;
        }

        if (recv_encrypted(sock, reply) <= 0) {
            printf("Recieve error\n");
            break;
        }

        printf("Server responce: %s\n", reply);
    }
}

int main() {
    char server_ip[100];
    int port;
    SOCKET sock;

    if (init_winsock() != 0) {
        printf("Error WSAStartup\n");
        return 1;
    }

    printf("Enter server IP: ");
    scanf("%s", server_ip);
    printf("Enter port: ");
    scanf("%d", &port);

    sock = create_connection(server_ip, port);
    if (sock == INVALID_SOCKET) {
        printf("Connection failed\n");
        WSACleanup();
        return 1;
    }

    printf("Connected to server!\n");
    chat_loop(sock);

    closesocket(sock);
    WSACleanup();
    return 0;
}
