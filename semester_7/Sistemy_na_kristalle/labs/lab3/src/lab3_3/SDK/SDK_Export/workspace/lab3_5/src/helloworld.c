#include <stdio.h>
#include "xil_types.h"
#include "xgpio_l.h"
#include "xparameters.h"
#include "xuartlite.h"
#include "platform.h"

// Определение структуры для UART
XUartLite UartLite;
// Функция инициализации UART
int initUART() {
    return XUartLite_Initialize(&UartLite, XPAR_UARTLITE_0_DEVICE_ID) != XST_SUCCESS;
}

int main() {
    init_platform();

    if (initUART() != XST_SUCCESS) {
        return XST_FAILURE;
    }

    u8 input = 0, output = 0, buffer[2],
    		outputH = 0, outputL = 0;

    int i;
    const char* hex_chars = "0123456789ABCDEF";

    while (1) {
        input = Xil_In32(XPAR_DIP_SWITCHES_BASEADDR);
        input &= 0b00001111;

        output = (5 * input) + 3;
        output &= 0b00111111;
        outputH = (output >> 4) & 0x0F;
        outputL = output & 0x0F;

        buffer[0] = hex_chars[outputH];
        buffer[1] = hex_chars[outputL];
        XUartLite_Send(&UartLite, buffer, 2);

        buffer[0] = '\r';
        buffer[1] = '\n';
        XUartLite_Send(&UartLite, buffer, 2);

        for(i = 0; i < 2000000; i++);
    }
    cleanup_platform();
    return 0;
}
