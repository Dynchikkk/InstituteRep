#include <stdio.h>
#include "xgpio_l.h"
#include "xparameters.h"

int main() {
    Xuint32 counter = 0,
        i = 0;
    unsigned long int delay = 2500000;

    int input;
    XGpio_WriteReg(XPAR_LEDS_BASEADDR, XGPIO_TRI_OFFSET, 0);
    while (1) {
        input = Xil_In32(XPAR_DIP_SWITCHES_BASEADDR);
        if (input & 0x01 && delay < 5000000)
            delay++;
        else if (input & 0x02 && delay > 0)
            delay--;
        else if (input & 0x00)
            delay = 2500000;
        else {
            counter++;
            for (i = 0; i < delay; i++) {

            }
        }
        Xil_Out32(XPAR_LEDS_BASEADDR, counter);
    }
    return 0;
}