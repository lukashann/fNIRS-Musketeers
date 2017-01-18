#include <stdint.h>
#include "UART0.h"
#include "tm4c123gh6pm.h"
#include "FIFO.h"

void EnableInterrupts(void);
void DisableInterrupts(void);
long StartCritical(void);
void EndCritical(long sr);
void WaitForInterrupt(void);

#define FIFOSIZE		16				//size of the FIFOs (must be a power of 2)
#define FIFOSUCCESS	1					//return value on success
#define FIFOFAIL		0					//return value on failure

// standard ASCII symbols
#define CR   0x0D
#define LF   0x0A
#define BS   0x08
#define ESC  0x1B
#define SP   0x20
#define DEL  0x7F

AddIndexFifo(UART0_Rx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)
AddIndexFifo(UART0_Tx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)

// Initialize UART0
// Baud rate is 115200 bits/sec assuming 50 MHz clock rate
void UART0_Init(void)
{
  SYSCTL_RCGCUART_R |= 0x01;            // activate UART0
  SYSCTL_RCGCGPIO_R |= 0x01;            // activate port A
  UART0_RxFifo_Init();                  // initialize empty FIFOs
  UART0_TxFifo_Init();
  UART0_CTL_R &= ~UART_CTL_UARTEN;      // disable UART
  UART0_IBRD_R = 27;                    // IBRD = int(50,000,000 / (16 * 115,200)) = int(27.1267)
  UART0_FBRD_R = 8;                     // FBRD = int(0.1267 * 64 + 0.5) = 8
                                        // 8 bit word length (no parity bits, one stop bit, FIFOs)
  UART0_LCRH_R = (UART_LCRH_WLEN_8|UART_LCRH_FEN);
  UART0_IFLS_R &= ~0x3F;                // clear TX and RX interrupt FIFO level fields
                                        // configure interrupt for TX FIFO <= 1/8 full
                                        // configure interrupt for RX FIFO >= 1/8 full
  UART0_IFLS_R += (UART_IFLS_TX1_8|UART_IFLS_RX1_8);
                                        // enable TX and RX FIFO interrupts and RX time-out interrupt
  UART0_IM_R |= (UART_IM_RXIM|UART_IM_TXIM|UART_IM_RTIM);
  UART0_CTL_R |= UART_CTL_UARTEN;       // enable UART
  GPIO_PORTA_AFSEL_R |= 0x03;           // enable alt funct on PA1-0
  GPIO_PORTA_DEN_R |= 0x03;             // enable digital I/O on PA1-0
                                        // configure PA1-0 as UART
  GPIO_PORTA_PCTL_R = (GPIO_PORTA_PCTL_R&0xFFFFFF00)+0x00000011;
  GPIO_PORTA_AMSEL_R = 0x00;            // disable analog functionality on PA
                                        // UART0=priority 2
  NVIC_PRI1_R = (NVIC_PRI1_R&0xFFFF00FF)|0x00004000; // bits 13-15
  NVIC_EN0_R = 0x00000020;           		// enable interrupt 5 in NVIC
  EnableInterrupts();
}

// copy from hardware RX FIFO to software RX FIFO
// stop when hardware RX FIFO is empty or software RX FIFO is full
void static UART0_copyHardwareToSoftware(void)
{
  char letter;
  while(((UART0_FR_R&UART_FR_RXFE) == 0) && (UART0_RxFifo_Size() < (FIFOSIZE - 1)))
	{
    letter = UART0_DR_R;
    UART0_RxFifo_Put(letter);
  }
}

// copy from software TX FIFO to hardware TX FIFO
// stop when software TX FIFO is empty or hardware TX FIFO is full
void static UART0_copySoftwareToHardware(void)
{
  char letter;
  while(((UART0_FR_R&UART_FR_TXFF) == 0) && (UART0_TxFifo_Size() > 0))
	{
    UART0_TxFifo_Get(&letter);
    UART0_DR_R = letter;
  }
}

// input ASCII character from UART
// spin if RxFifo is empty
char UART0_InChar(void)
{
  char letter;
  while(UART0_RxFifo_Get(&letter) == FIFOFAIL);
  return(letter);
}

// output ASCII character to UART
// spin if TxFifo is full
void UART0_OutChar(char data)
{
  while(UART0_TxFifo_Put(data) == FIFOFAIL);
  UART0_IM_R &= ~UART_IM_TXIM;          // disable TX FIFO interrupt
  UART0_copySoftwareToHardware();
  UART0_IM_R |= UART_IM_TXIM;           // enable TX FIFO interrupt
}

// at least one of three things has happened:
// hardware TX FIFO goes from 3 to 2 or less items
// hardware RX FIFO goes from 1 to 2 or more items
// UART receiver has timed out
void UART0_Handler(void)
{
  if(UART0_RIS_R&UART_RIS_TXRIS)
	{       // hardware TX FIFO <= 2 items
    UART0_ICR_R = UART_ICR_TXIC;        // acknowledge TX FIFO
		// copy from software TX FIFO to hardware TX FIFO
    UART0_copySoftwareToHardware();
    if(UART0_TxFifo_Size() == 0)
		{             											// software TX FIFO is empty
      UART0_IM_R &= ~UART_IM_TXIM;      // disable TX FIFO interrupt
    }
  }
  if(UART0_RIS_R&UART_RIS_RXRIS)
	{       // hardware RX FIFO >= 2 items
    UART0_ICR_R = UART_ICR_RXIC;        // acknowledge RX FIFO
    // copy from hardware RX FIFO to software RX FIFO
    UART0_copyHardwareToSoftware();
  }
  if(UART0_RIS_R&UART_RIS_RTRIS)
	{       // receiver timed out
    UART0_ICR_R = UART_ICR_RTIC;        // acknowledge receiver time out
    // copy from hardware RX FIFO to software RX FIFO
    UART0_copyHardwareToSoftware();
  }
}

void UART0_OutString(char *pt)
{
  while(*pt)
	{
    UART0_OutChar(*pt);
    pt++;
  }
}

void UART0_InString(char *bufPt, uint16_t max) 
{
int length=0;
char character;
  character = UART0_InChar();
  while(character != CR)
	{
    if(character == BS)
		{
      if(length)
			{
        bufPt--;
        length--;
        UART0_OutChar(BS);
      }
    }
    else if(length < max)
		{
      *bufPt = character;
      bufPt++;
      length++;
      UART0_OutChar(character);
    }
    character = UART0_InChar();
  }
  *bufPt = 0;
}

