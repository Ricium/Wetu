#include "xbee_uart.h"
#include <xc.h>
#include <uart.h>

void SetupXBee(int BAUDRATE){
    AD1PCFG = 0xFF7C;           // Only AN0, AN1 and AN4 as analog inputs
    TRISBbits.TRISB1 = 1;       //RX input
    TRISBbits.TRISB0 = 0;       //TX output
    
    U2MODE = 0;
    U2STA = 0;    
    U2BRG = BAUDRATE;           // Set Baud Rate    
       
    IEC1bits.U2RXIE = 1;        // enable rx interrupt
   
    U2MODEbits.UARTEN = 1;      // enable uart
    U2STAbits.UTXEN = 1;        // enabale tx  
}

void SendXBee(char * TEXT){
    putsUART2((unsigned int *)TEXT);
}

void SendcXBee(char TEXT){
    putcUART2(TEXT);
}

void WaitXBee(void)
{
    while(BusyUART2());
}
