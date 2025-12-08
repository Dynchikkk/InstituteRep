#include <stdio.h>
#include "xgpio_l.h"
#include "xparameters.h"

Xint8 calculate(Xint8 x, Xint8 v) {
	Xint8 result = 16 * ((x & 3) + 1) + v + 1;
	return result;
}

int main() {
	Xint8 output = 0,
		inputSw, inputBt;

	XGpio_WriteReg(XPAR_LEDS_BASEADDR, XGPIO_TRI_OFFSET, 0);
	while (1) {
		inputBt=Xil_In32(XPAR_PUSH_BUTTONS_BASEADDR);
		inputSw=Xil_In32(XPAR_DIP_SWITCHES_BASEADDR);

		output = calculate(inputBt, inputSw);

		Xil_Out32(XPAR_LEDS_BASEADDR, output);
	}
	return 0;
}
