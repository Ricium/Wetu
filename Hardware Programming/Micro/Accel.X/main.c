#include "configbits.h"
#include <stdio.h>
#include <timer.h>
#include <stdlib.h>

#define GetInstructionClock()  (8000000)
#define MAXBUF                  350
#define BAUDRATE9600            25
#define BAUDRATE19200           12
#define ADDRBUF                 15
#define ADDRLENGTH              8
#define XChannel                1
#define YChannel                0
#define ZChannel                4

 int abval(int val)  
 { 
     return (val<0 ? (-val) : val);
 } 

int SampleADC(int channel)
{
    AD1CHS = channel;          // Connect channel as positive input AD1CSSL = channel;
    int ADCValue, count; 
    int * ADC16Ptr ;
    
    AD1CON1bits.ADON = 1;                   // Turn ON ADC
    
    ADCValue = 0;                           // Clear Register
    ADC16Ptr = (int*)&ADC1BUF0;             // Initialize ADC1BUF Pointer
    IFS0bits.AD1IF = 0;                     // Clear ADC Interrupt Flag
    AD1CON1bits.ASAM = 1;                   // Auto Start Sampling 
    
    while (!IFS0bits.AD1IF){};              // Wait for Sample/Conversion to Finish
    AD1CON1bits.ASAM = 0;                   // Stop Sample/Conversion 
    for (count = 0; count < 16; count++)    // Average 16 Word ADC value
    {
        ADCValue = ADCValue + *ADC16Ptr++;
    }
        
    ADCValue = ADCValue >> 4;               // Justify Result
    
    return ADCValue;                        // Return ADC Value
}

int SuddenChange(int Channel, float FilterValue, int Threshold)
{
    int accel[5];
    int dif[5];
    int c = 0;
    int delta = 0;
    int finaldelta = 0;
    
    for(c=0; c<5; c++)
    {
        accel[c] = SampleADC(Channel);
        DelayMs(10);
    }
    // Subtract the low-pass value from the current value to get a simplified high-pass filter
    
    for(c=0; c<5; c++)
    {
        dif[c] = accel[c] - ((accel[c] * FilterValue) + (SampleADC(Channel) * (1 - FilterValue)));
    }
    
   // Use the acceleration data.
    
    for(c=0; c<5; c++)
    {
        delta = delta + abval(dif[c]);
        //printf("Acc: %d - Dif: %d\n", accel[c], dif[c]);
    }
    
    finaldelta = delta/5;
    
    if(finaldelta >= Threshold)
        return 1;
    else
        return 0;
    
    return 0;
}

int main(void)
{
    AD1PCFG = 0xFF7C;           // Only AN0, AN1 and AN4 as analog inputs
   
    AD1CON1 = 0x00E0;          // Internal counter triggers conversion    
    AD1CON3 = 0x0F00;          // Sample time = 15Tad, Tad = Tcy
    AD1CON2 = 0x003C;          // Set AD1IF after every 16 samples   
    
    TRISBbits.TRISB2 = 1;       //RX input
    TRISBbits.TRISB7 = 0;       //TX output
    
    U1MODE = 0;
    U1STA = 0;    
    U1BRG = BAUDRATE19200;           // Set Baud Rate    
       
    IEC0bits.U1RXIE = 1;        // enable rx interrupt
   
   // U1STAbits.URXISEL = 0;
    
    U1MODEbits.UARTEN = 1;      // enable uart
    U1STAbits.UTXEN = 1;        // enabale tx   
    
    int y = 0;
    int x = 0;
    int z = 0;
    
    while(1)
    {             
        float filter = 2.5;
        int threshold = 15;
        
        x = SuddenChange(XChannel, filter, threshold);
        printf("Sudden Change on X Axis: %d\n", x);
        y = SuddenChange(YChannel, filter, threshold);
        printf("Sudden Change on Y Axis: %d\n", y);
        z = SuddenChange(ZChannel, filter, threshold);
        printf("Sudden Change on Z Axis: %d\r\n", z);
        DelayMs(5);
    };
}




