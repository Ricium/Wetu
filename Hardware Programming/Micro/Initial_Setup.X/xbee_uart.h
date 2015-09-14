/* 
 * File:   xbee_uart.h
 * Author: R.M. Lombard
 *
 * Created on 28 July 2015, 12:06 PM
 */

#ifndef XBEE_UART_H
#define	XBEE_UART_H

//prototypes
extern void SetupXBee(int BAUDRATE);
extern void SendXBee(char * TEXT);
extern void SendcXBee(char TEXT);
extern void WaitXBee(void);
extern void DisableXBee(void);
extern void EnableXBee(void);
extern void PollProximity(void);

#endif	/* XBEE_UART_H */

