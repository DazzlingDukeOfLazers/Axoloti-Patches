// <MPR121>
// // Derived from Adafruit <TBD Link>
	// <Address>
	// MPR121 Capacitive touch IC used on all padcap capacitive touch keys and piano keys
	// MPR121 Address Scheme
	// https://learn.adafruit.com/adafruit-mpr121-12-key-capacitive-touch-sensor-breakout-tutorial?view=all
	// ADDR is the I2C address select pin.
	// 0x5A	By default this is pulled down to ground with a 100K resistor, for an I2C address of 0x5A.
	// 0x5B	You can also connect it to the 3Vo pin for an address of 0x5B,
	// 0x5C	~(you can connect ADDR to) the SDA pin for 0x5C or
	// 0x5D	~(you can connect ADDR to) SCL for address 0x5D

	// This is a proof of concept update from above to see if we can get the CPT112S working with the system

	#define WANDERLUST_KEYBOARD	  0x5A
	#define WANDERLUST_PADCAP_LOWER 0x5B
	#define WANDERLUST_PADCAP_UPPER 0x5C
	//#define MPR121_I2CADDR_DEFAULT 0x5A // Piano
	#define MPR121_I2CADDR_DEFAULT  WANDERLUST_KEYBOARD
	// </Adddress>

	//<uncategorized>
	#define MPR121_TOUCHSTATUS_L 0x00
	#define MPR121_TOUCHSTATUS_H 0x01
	#define MPR121_FILTDATA_0L   0x04
	#define MPR121_FILTDATA_0H   0x05
	#define MPR121_BASELINE_0    0x1E
	#define MPR121_MHDR          0x2B
	#define MPR121_NHDR          0x2C
	#define MPR121_NCLR          0x2D
	#define MPR121_FDLR          0x2E
	#define MPR121_MHDF          0x2F
	#define MPR121_NHDF          0x30
	#define MPR121_NCLF          0x31
	#define MPR121_FDLF          0x32
	#define MPR121_NHDT          0x33
	#define MPR121_NCLT          0x34
	#define MPR121_FDLT          0x35

	#define MPR121_TOUCHTH_0     0x41
	#define MPR121_RELEASETH_0   0x42
	#define MPR121_DEBOUNCE      0x5B
	#define MPR121_CONFIG1       0x5C
	#define MPR121_CONFIG2       0x5D
	#define MPR121_CHARGECURR_0  0x5F
	#define MPR121_CHARGETIME_1  0x6C
	#define MPR121_ECR           0x5E
	#define MPR121_AUTOCONFIG0   0x7B
	#define MPR121_AUTOCONFIG1   0x7C
	#define MPR121_UPLIMIT       0x7D
	#define MPR121_LOWLIMIT      0x7E
	#define MPR121_TARGETLIMIT   0x7F

	#define MPR121_GPIODIR       0x76
	#define MPR121_GPIOEN        0x77
	#define MPR121_GPIOSET       0x78
	#define MPR121_GPIOCLR       0x79
	#define MPR121_GPIOTOGGLE    0x7A
	#define MPR121_SOFTRESET     0x80
	//<uncategorized>
// </MPR121>

struct I2CMsg{
	uint32_t msg;
	uint8_t status; // 0 on okay
};


I2CMsg PadcapReadReg24(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	I2CMsg msg;
	msg.status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 3, tmo);
	msg.msg = 	( rxbuf[0]      ) |
				( rxbuf[1] << 8 ) |
				( rxbuf[2] << 16);
	return msg;
}


uint16_t PadcapReadReg16(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 2, tmo); // <TBD add status checking>
	return ( rxbuf[0] | ( rxbuf[1] << 8 ) );
}

uint16_t PadcapReadReg8(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 1, tmo); // <TBD add status checking>
	return ( rxbuf[0] );
}

uint16_t PadcapWriteReg(uint8_t ui8Channel, uint8_t ui8Register, uint8_t ui8Val)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	txbuf[1] = ui8Val;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 2, rxbuf, 0, tmo); // TBD add status checking
	return status;
}

uint8_t PadcapWriteReg8(uint8_t ui8Channel, uint8_t ui8Register)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 1, tmo); // TBD add status checking
	return rxbuf[0];
}

void PadcapSetThreshold(uint8_t ui8Channel, uint8_t touch, uint8_t release)
{
	for (uint8_t i=0; i<12; i++)
	{
		PadcapWriteReg(ui8Channel, MPR121_TOUCHTH_0   + 2*i, touch);
		PadcapWriteReg(ui8Channel, MPR121_RELEASETH_0 + 2*i, release);
	}
}

uint32_t PadcapTouched(uint8_t ui8Channel)
{
	int32_t i32NoteVal = 0;

	uint16_t u16capstatus = PadcapReadReg16(ui8Channel, MPR121_TOUCHSTATUS_L);
	i32NoteVal = u16capstatus;

	out2 = i32NoteVal;

	return i32NoteVal;
}

void PadcapSetup(uint8_t ui8tPadcapChannel)
{

	// PadcapWriteReg(	ui8tPadcapChannel,	MPR121_SOFTRESET,   0x63);
	// chThdSleepMilliseconds(1);
	// PadcapWriteReg(	ui8tPadcapChannel,	MPR121_ECR,         0x0);
	// chThdSleepMilliseconds(1);
	//
	// uint8_t c = PadcapWriteReg8(ui8tPadcapChannel, MPR121_CONFIG2);
	// chThdSleepMilliseconds(1);
	// if (c != 0x24)  out1 &= 0xF000; // Device ID is incorrect <TBD add to class flag>
	//
	// //PadcapSetThreshold(12, 6); // <reference Device sensetivity default	>
	// //PadcapSetThreshold(ui8tPadcapChannel,36,24);
	// PadcapSetThreshold(ui8tPadcapChannel,12,6);
	// chThdSleepMilliseconds(1);
	//
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_MHDR, 0x01); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDR, 0x01); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLR, 0x0E); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLR, 0x00); chThdSleepMilliseconds(1);
	//
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_MHDF, 0x01); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDF, 0x05); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLF, 0x01); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLF, 0x00); chThdSleepMilliseconds(1);
	//
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDT, 0x00); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLT, 0x00); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLT, 0x00); chThdSleepMilliseconds(1);
	//
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_DEBOUNCE, 0); chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_CONFIG1, 0x10); // default, 16uA charge current
	// chThdSleepMilliseconds(1);
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_CONFIG2, 0x20); // 0.5uS encoding, 1ms period
	// chThdSleepMilliseconds(1);
	//
	// PadcapWriteReg(ui8tPadcapChannel, MPR121_ECR, 0x8F);  // start with first 5 bits of baseline tracking
	// chThdSleepMilliseconds(1);
}

void servicePadCaps()
{
	static int32_t iSameCount=0, iLoopCount, iAddr=0;
	I2CMsg msg;

	static int once = 1;

	if (once) // tbd, move this to an init function
	{
		once = 0;
		kb0  = 0;
		kb1  = 0;
		kb2  = 0;
		kb3  = 0;
		kb4  = 0;
		kb5  = 0;
		kb6  = 0;
		kb7  = 0;
		kb8  = 0;
		kb9  = 0;
		kb10 = 0;
		kb11 = 0;
	}

	uint32_t ui32CapTouched;
	uint8_t ui8Val[4];
	uint8_t packetCounter, eventType, csIndex;

	msg = PadcapReadReg24(0x5A, 0);

	if (msg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (msg.msg & 0x0000000F );
		csIndex       = (msg.msg & 0x0000FF00 ) >> 8;

		if (eventType == 0)
		{
			switch(csIndex)
			{
				case 0:
					kb0 = 1;
					break;
				case 1:
					kb1 = 1;
					break;
				case 2:
					kb2 = 1;
					break;
				case 3:
					kb3 = 1;
					break;
				case 4:
					kb4 = 1;
					break;
				case 5:
					kb5 = 1;
					break;
				case 6:
					kb6 = 1;
					break;
				case 7:
					kb7 = 1;
					break;
				case 8:
					kb8 = 1;
					break;
				case 9:
					kb9 = 1;
					break;
				case 10:
					kb10 = 1;
					break;
				case 11:
					kb11 = 1;
					break;
			}
		}
		else if (eventType !=0)
		{
			switch(csIndex)
			{
				case 0:
					kb0 = 0;
					break;
				case 1:
					kb1 = 0;
					break;
				case 2:
					kb2 = 0;
					break;
				case 3:
					kb3 = 0;
					break;
				case 4:
					kb4 = 0;
					break;
				case 5:
					kb5 = 0;
					break;
				case 6:
					kb6 = 0;
					break;
				case 7:
					kb7 = 0;
					break;
				case 8:
					kb8 = 0;
					break;
				case 9:
					kb9 = 0;
					break;
				case 10:
					kb10 = 0;
					break;
				case 11:
					kb11 = 0;
					break;
			}
		}
	}


	msg = PadcapReadReg24(0x5B, 0);
	if (msg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (msg.msg & 0x0000000F );
		csIndex       = (msg.msg & 0x0000FF00 ) >> 8;


		if (eventType == 0)
		{
			switch(csIndex)
			{
				case 0:
					pc00 = 1;
					break;
				case 1:
					pc01 = 1;
					break;
				case 2:
					pc02 = 1;
					break;
				case 3:
					pc03 = 1;
					break;
				case 4:
					pc04 = 1;
					break;
				case 5:
					pc05 = 1;
					break;
				case 6:
					pc06 = 1;
					break;
				case 7:
					pc07 = 1;
					break;
				case 8:
					pc08 = 1;
					break;
				case 9:
					pc09 = 1;
					break;
				case 10:
					pc0A = 1;
					break;
				case 11:
					pc0B = 1;
					break;
			}
		}
		else if (eventType !=0)
		{
			switch(csIndex)
			{
				case 0:
					pc00 = 0;
					break;
				case 1:
					pc01 = 0;
					break;
				case 2:
					pc02 = 0;
					break;
				case 3:
					pc03 = 0;
					break;
				case 4:
					pc04 = 0;
					break;
				case 5:
					pc05 = 0;
					break;
				case 6:
					pc06 = 0;
					break;
				case 7:
					pc07 = 0;
					break;
				case 8:
					pc08 = 0;
					break;
				case 9:
					pc09 = 0;
					break;
				case 10:
					pc0A = 0;
					break;
				case 11:
					pc0B = 0;
					break;
			}
		}

	}

	msg = PadcapReadReg24(0x5C, 0);
	if (msg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (msg.msg & 0x0000000F );
		csIndex       = (msg.msg & 0x0000FF00 ) >> 8;


		if (eventType == 0)
		{
			switch(csIndex)
			{
				case 0:
					pc10 = 1;
					break;
				case 1:
					pc11 = 1;
					break;
				case 2:
					pc12 = 1;
					break;
				case 3:
					pc13 = 1;
					break;
				case 4:
					pc14 = 1;
					break;
				case 5:
					pc15 = 1;
					break;
				case 6:
					pc16 = 1;
					break;
				case 7:
					pc17 = 1;
					break;
				case 8:
					pc18 = 1;
					break;
				case 9:
					pc19 = 1;
					break;
				case 10:
					pc1A = 1;
					break;
				case 11:
					pc1B = 1;
					break;
			}
		}
		else if (eventType !=0)
		{
			switch(csIndex)
			{
				case 0:
					pc10 = 0;
					break;
				case 1:
					pc11 = 0;
					break;
				case 2:
					pc12 = 0;
					break;
				case 3:
					pc13 = 0;
					break;
				case 4:
					pc14 = 0;
					break;
				case 5:
					pc15 = 0;
					break;
				case 6:
					pc16 = 0;
					break;
				case 7:
					pc17 = 0;
					break;
				case 8:
					pc18 = 0;
					break;
				case 9:
					pc19 = 0;
					break;
				case 10:
					pc1A = 0;
					break;
				case 11:
					pc1B = 0;
					break;
			}
		}
	}



	//iAddr++;
	//if (iAddr >= 255) iAddr = 0;
	// ui32CapTouched = PadcapTouched(WANDERLUST_PADCAP_LOWER);
	// {
	// 	out3 = ui32CapTouched;
	// 	//ski_down = 0x080 & ( ui32CapTouched );
	// 	pc00 = 0x080 & ( ui32CapTouched );
	// 	pc01 = 0x040 & ( ui32CapTouched );
	// 	pc02 = 0x020 & ( ui32CapTouched );
	// 	pc03 = 0x010 & ( ui32CapTouched );
	// 	pc04 = 0x008 & ( ui32CapTouched );
	// 	pc05 = 0x004 & ( ui32CapTouched );
	// 	pc06 = 0x002 & ( ui32CapTouched );
	// 	pc07 = 0x001 & ( ui32CapTouched );
	// 	pc08 = 0x100 & ( ui32CapTouched );
	// 	pc09 = 0x200 & ( ui32CapTouched );
	// 	pc0A = 0x400 & ( ui32CapTouched );
	// 	pc0B = 0x800 & ( ui32CapTouched );
	// }
	//
	// ui32CapTouched = PadcapTouched(WANDERLUST_PADCAP_UPPER);
	// {
	// 	out3 = ui32CapTouched;
	// 	pc10 = 0x001 & ( ui32CapTouched );
	// 	pc11 = 0x002 & ( ui32CapTouched );
	// 	pc12 = 0x004 & ( ui32CapTouched );
	// 	pc13 = 0x008 & ( ui32CapTouched );
	// 	pc14 = 0x010 & ( ui32CapTouched );
	// 	pc15 = 0x020 & ( ui32CapTouched );
	// 	pc16 = 0x040 & ( ui32CapTouched );
	// 	pc17 = 0x080 & ( ui32CapTouched );
	// 	pc18 = 0x100 & ( ui32CapTouched );
	// 	pc19 = 0x200 & ( ui32CapTouched );
	// 	pc1A = 0x400 & ( ui32CapTouched );
	// 	pc1B = 0x800 & ( ui32CapTouched );
	// }
	//
	//
	// iLoopCount++;
	//
	// if (iLoopCount > 50000)
	// {
	// 	iLoopCount = 0;
	// 	PadcapSetup(WANDERLUST_KEYBOARD);
	// 	PadcapSetup(WANDERLUST_PADCAP_LOWER);
	// 	PadcapSetup(WANDERLUST_PADCAP_UPPER);
	// }

}
