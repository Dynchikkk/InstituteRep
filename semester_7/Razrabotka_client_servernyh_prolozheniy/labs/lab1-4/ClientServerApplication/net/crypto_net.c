#include "crypto_net.h"

int init_winsock() {
    WSADATA wsa;
    return WSAStartup(MAKEWORD(2, 2), &wsa);
}

int send_encrypted(SOCKET sock, const char* msg) {
    char encrypted[BUF_SIZE];
    crypt_data((char*)msg, encrypted, PASSWORD);
    return send(sock, encrypted, strlen(encrypted), 0);
}

int recv_encrypted(SOCKET sock, char* out) {
    char buffer[BUF_SIZE];
    int recv_size = recv(sock, buffer, BUF_SIZE, 0);
    if (recv_size <= 0) return recv_size;
    buffer[recv_size] = '\0';
    crypt_data(buffer, out, PASSWORD);
    return strlen(out);
}
