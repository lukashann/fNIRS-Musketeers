void UART0_Init(void);
void static UART0_copyHardwareToSoftware(void);
void static UART0_copySoftwareToHardware(void);
char UART0_InChar(void);
void UART0_OutChar(char data);
void UART0_OutString(char *pt);
void UART0_InString(char *bufPt, uint16_t max);
