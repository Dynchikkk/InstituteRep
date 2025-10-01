#include "crypt.h"
#include <string.h>

unsigned short gamma_gen(char* pwd) {
    char buf[20];
    int i;
    unsigned long flag;
    static unsigned long g;

    if (pwd) {
        memset(buf, 0x55, 20);
        memcpy(buf, pwd, strlen(pwd));
        for (i = 0, g = 0; i < 20; i++)
            g += (unsigned long)(buf[i] << (i % 23));
    }

    for (i = 5; i > 0; i--) {
        flag = g & 1;
        g >>= 1;
        if (flag) g |= 0x80000000;
    }

    return g;
}

int crypt_data(char* source, char* dest, char* pwd) {
    int i, len, numblk;
    unsigned short* px, * py;
    px = (unsigned short*)source;
    py = (unsigned short*)dest;
    gamma_gen(pwd);
    len = strlen(source);
    numblk = (len + 1);
    for (i = 0; i < numblk; i++, py++, px++)
        *py = *px ^ gamma_gen(0);
    dest[numblk * 4] = 0;
    return numblk * 4 + 1;
}
