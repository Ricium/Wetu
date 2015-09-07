/* 
 * File:   wifi_uart.h
 * Author: R.M. Lombard
 *
 * Created on 21 July 2015, 12:04 PM
 */

#ifndef WIFI_UART_H
#define	WIFI_UART_H

//prototypes
extern void SetupWiFi(int BAUDRATE);
extern void SendWiFi(char * TEXT);
extern void SendcWiFi(char TEXT);
extern void WaitWiFi(void);
extern void DisableWiFi(void);
extern void EnableWiFi(void);

#endif	/* WIFI_UART_H */
