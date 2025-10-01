#ifndef CRYPTO_NET_H
#define CRYPTO_NET_H

#include <stdio.h>
#include <string.h>
#include <winsock2.h>
#include "crypt.h"

#define BUF_SIZE 1024
#define PASSWORD "mypassword"   // общий ключ для клиента и сервера

// инициализация WinSock
int init_winsock();

// функции для передачи данных с шифрованием
int send_encrypted(SOCKET sock, const char* msg);
int recv_encrypted(SOCKET sock, char* out);

#endif
