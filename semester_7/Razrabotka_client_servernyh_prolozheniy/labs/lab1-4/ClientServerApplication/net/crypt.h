#ifndef CRYPT_H
#define CRYPT_H

unsigned short gamma_gen(char* pwd);
int crypt_data(char* source, char* dest, char* pwd);

#endif
