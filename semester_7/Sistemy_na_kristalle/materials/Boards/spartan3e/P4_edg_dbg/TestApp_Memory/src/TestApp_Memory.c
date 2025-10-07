#include "xparameters.h"
#include "xgpio_l.h"

int main (void) {int i, v, p; 
  XGpio_mSetDataDirection(XPAR_LEDS_8BIT_BASEADDR, 1, 0); 
  A:v=0;  
  v = XGpio_mGetDataReg (XPAR_DIP_SWITCHES_4BIT_BASEADDR, 1);
  p=v;
  p=p<<4;
  i=p+v+3;
  XGpio_mSetDataReg(XPAR_LEDS_8BIT_BASEADDR, 1, i); 
  goto A;
}
