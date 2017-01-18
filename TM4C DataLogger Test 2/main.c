
#include <stdint.h>
#include "PLL.h"
#include "UART0.h"
#include "tm4c123gh6pm.h"
#include "ADCT0ATrigger.h"

#define LEDS      (*((volatile uint32_t *)0x40025038))

typedef char String[80];

void DisableInterrupts(void); // Disable interrupts
void EnableInterrupts(void);  // Enable interrupts
long StartCritical (void);    // previous I bit, disable interrupts
void EndCritical(long sr);    // restore I bit to previous value
void WaitForInterrupt(void);  // low power mode

void PortF_Init(void);

int main(void)
{
	DisableInterrupts();
  PLL_Init();                      // bus clock at 50 MHz
	PortF_Init();
	UART0_Init();
	ADC0_InitTimer0ATriggerSeq3PD3(50000000/10);
  EnableInterrupts();
	UART0_OutString("Hello world\n\r");

  while(1){
    WaitForInterrupt();
  }
}

void PortF_Init()
{
	SYSCTL_RCGCGPIO_R |= 0x20;       // activate port F
  while((SYSCTL_PRGPIO_R&0x0020) == 0){};// ready?
  GPIO_PORTF_DIR_R |= 0x0E;        // make PF3-1 output (PF3-1 built-in LEDs)
  GPIO_PORTF_AFSEL_R &= ~0x0E;     // disable alt funct on PF3-1
  GPIO_PORTF_DEN_R |= 0x0E;        // enable digital I/O on PF3-1
                                   // configure PF3-1 as GPIO
  GPIO_PORTF_PCTL_R = (GPIO_PORTF_PCTL_R&0xFFFFF0FF)+0x00000000;
  GPIO_PORTF_AMSEL_R = 0;          // disable analog functionality on PF
  LEDS = 0;                        // turn all LEDs off
}
