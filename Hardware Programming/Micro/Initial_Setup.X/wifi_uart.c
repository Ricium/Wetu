#include "wifi_uart.h"
#include <xc.h>
#include <uart.h>
#include <timer.h>

#define GetInstructionClock()  (8000000)

void SetupWiFi(int BAUDRATE){
    AD1PCFG = 0xFF7C;           // Only AN0, AN1 and AN4 as analog inputs
    TRISBbits.TRISB2 = 1;       //RX input
    TRISBbits.TRISB7 = 0;       //TX output
    
    U1MODE = 0;
    U1STA = 0;    
    U1BRG = BAUDRATE;           // Set Baud Rate    
       
    IEC0bits.U1RXIE = 1;        // enable rx interrupt
   
   // U1STAbits.URXISEL = 0;
    
    U1MODEbits.UARTEN = 1;      // enable uart
    U1STAbits.UTXEN = 1;        // enabale tx  
}

void SendWiFi(char * TEXT){
    putsUART1((unsigned int *)TEXT);
}

void SendcWiFi(char TEXT){
    putcUART1(TEXT);
}

void WaitWiFi(void)
{
    while(BusyUART1());
}

void DisableWiFi(void)
{
    IEC0bits.U1RXIE = 0;        // Disable rx interrupt
    IFS0bits.U1RXIF = 0;        // Clear WiFi interrupt flag
}

void EnableWiFi(void)
{
    IEC0bits.U1RXIE = 1;        // Enable rx interrupt
    IFS0bits.U1RXIF = 0;        // Clear WiFi interrupt flag

    DelayMs(1000);
    
    U1STAbits.OERR = 0;         
}

void PollProximity(void)
{
    SendWiFi("AT+CWLAP\r\n");
}
