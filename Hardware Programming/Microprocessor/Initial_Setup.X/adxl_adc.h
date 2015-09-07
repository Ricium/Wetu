#ifndef ADXL_ADC_H
#define	ADXL_ADC_H

extern void SetupADC(void);

extern int SampleADC(int channel);

extern int abval(int val);

extern char SuddenChange(int Channel, float FilterValue, int Threshold);

#endif	/* ADXL_ADC_H */

