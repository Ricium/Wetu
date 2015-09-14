#include <string.h>
#include <timer.h>
#include "configbits.h"
#include "wifi_uart.h"
#include "xbee_uart.h"
#include "adxl_adc.h"
#include "string_functions.h"

#define GetInstructionClock()  (8000000)
#define MAXBUF                  10//350
#define BAUDRATE9600            25
#define BAUDRATE19200           12
#define ADDRBUF                 15
#define ADDRLENGTH              8
#define XChannel                1
#define YChannel                0
#define ZChannel                4

char databuf[MAXBUF];       // Buffer to store data from WiFi polling
int bufcount = -1;          // Buffer counter
char devaddress[ADDRBUF];
int xbeecount = -1;
char address[ADDRLENGTH];

void __attribute__((interrupt, no_auto_psv, shadow)) _U1RXInterrupt(void) {
   /*The interrupt is called when data is received on the WiFi UART*/
    
    char temp = U1RXREG;
    
   if(bufcount >= MAXBUF-1)       // Check if buffer is full
   {
       // Reset Interrupt Flag      
       IFS0bits.U1RXIF = 0;
       return;
   }
   else
   {
        // Save data in buffer
        bufcount++;   
        databuf[bufcount] = temp;
        //SendcXBee(U1RXREG);
     
        // Reset Interrupt Flag
        IFS0bits.U1RXIF = 0;
   }   
    
    // Send data to WiFi UART
    //SendcWiFi(U2RXREG);
   
    //reset interrupt
    IFS0bits.U1RXIF = 0;
    
}

void __attribute__((interrupt, no_auto_psv, shadow)) _U2RXInterrupt(void) {
    /*The interrupt is called when data is received on the XBee UART*/
    
    char temp = U2RXREG;
    
   if(xbeecount >= ADDRBUF-1)       // Check if buffer is full
   {
       // Reset Interrupt Flag       
       IFS1bits.U2RXIF = 0;
       return;
   }
   else
   {
        // Save data in buffer
        xbeecount++;   
        devaddress[xbeecount] = temp;
        //SendcXBee(U1RXREG);
     
        // Reset Interrupt Flag
        IFS1bits.U2RXIF = 0;
        return;
   }  
    
    IFS1bits.U2RXIF = 0;
}

void set_name(void)
{
    SendXBee("+++");
    DelayMs(1000);
    SendXBee("ATSL\r");
    DelayMs(1000);
    SendXBee("ATCN\r");
 
    char * rc;    
    rc = strchr(devaddress, '\r');
    int start = rc-devaddress+1;
    strncpy(address,devaddress+start,8);
}

void set_Wifi(void)
{
    DisableWiFi();
    SendWiFi("AT+CWMODE=3\r\n");
    DelayMs(1000);
    //char test[] = { 0x41, 0x54,0x2b, 0x43, 0x57, 0x53, 0x41, 0x50, 0x3d, 0x22, 0x31, 0x41, 0x33, 0x42, 0x35, 0x44, 0x37, 0x41, 0x22, 0x2c, 0x22, 0x22, 0x2c, 0x31, 0x2c, 0x30, 0x0D, 0x0A };
    //SendWiFi(test);
    char pre[] = { 0x41, 0x54, 0x2b, 0x43, 0x57, 0x53, 0x41, 0x50, 0x3d, 0x22 };
    SendWiFi(pre);
    DelayMs(500);
    SendWiFi(address);
    DelayMs(500);
    char post[] = { 0x22, 0x2c, 0x22, 0x22, 0x2c, 0x31, 0x2c, 0x30, 0x0D, 0x0A };
    SendWiFi(post);
    DelayMs(1000);
    EnableWiFi();
}

int main(void)
{
    clear_data_buffer(address,&xbeecount);
    clear_data_buffer(devaddress, &xbeecount);
    
    SetupXBee(BAUDRATE19200); 
    //DelayMs(1000);
    //set_name();
    
    //DelayMs(200);
    SetupWiFi(BAUDRATE9600);
    //set_Wifi();
    SetupADC();
    
    clear_data_buffer(databuf, &bufcount);
    

    WaitXBee();
    PollProximity();
    
    char x, y, z;
    
    while(1)
    {       
        if(bufcount >= MAXBUF-1)
        {     
            DisableWiFi();
            x = SuddenChange(XChannel, 2.5, 15);
            y = SuddenChange(YChannel, 2.5, 15);
            z = SuddenChange(ZChannel, 2.5, 15);
            
            databuf[MAXBUF-1] = 0x7E;
            databuf[MAXBUF-2] = x;
            databuf[MAXBUF-3] = y;
            databuf[MAXBUF-4] = z;
            SendXBee(databuf);
            WaitXBee();
            
            clear_data_buffer(databuf, &bufcount);
            
            EnableWiFi(); 
            PollProximity();
        }
    };
}


