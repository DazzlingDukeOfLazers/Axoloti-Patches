#define WANDERLUST_KEYBOARD     0x5A
#define WANDERLUST_PADCAP_LOWER 0x5B
#define WANDERLUST_PADCAP_UPPER 0x5C

struct I2CMessage
{
	msg_t status;
	uint32_t result;
};


I2CMessage PadcapReadReg24CPT112S(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	I2CMessage thisMsg;
	thisMsg.status = RDY_OK;
	txbuf[0] = ui8Register;
	thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 3, tmo); // <TBD add status checking>
	thisMsg.result = (
			           ( rxbuf[0]      ) |
		               ( rxbuf[1] << 8 ) |
			           ( rxbuf[2] << 16)
		             );
	 return(thisMsg);
}

/*
uint32_t PadcapReadReg24CPT112S(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 3, tmo); // <TBD add status checking>
	return (
			( rxbuf[0]      ) |
		    ( rxbuf[1] << 8 ) |
			( rxbuf[2] << 16)
		);
}
*/

void setupCPT112S()
{
	// Some real heavy lifting here
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

#define caseOf( chipNum, kbNum, newVal) case chipNum: kbNum = newVal; break;
void serviceBottomRowPads()
{
	uint8_t packetCounter, eventType, csIndex;
	I2CMessage thisMsg;

	thisMsg = PadcapReadReg24CPT112S(WANDERLUST_PADCAP_LOWER, 0);
	if (thisMsg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (thisMsg.result & 0x0000000F );
		csIndex       = (thisMsg.result & 0x0000FF00 ) >> 8;

		uint8_t kEventType;

		if (eventType == 0) { kEventType = 1;}
		else                { kEventType = 0;}

		// Translate bit order (determined by routing) to Keyboard keys
		switch(csIndex)
		{
			caseOf(0,  pc08,  kEventType)
			caseOf(1,  pc09,  kEventType)
			caseOf(2,  pc10,  kEventType)
			caseOf(3,  pc11,  kEventType)
			caseOf(4,  pc07,  kEventType)
			caseOf(5,  pc05,  kEventType)
			caseOf(6,  pc03,  kEventType)
			caseOf(7,  pc01,  kEventType)
			caseOf(8,  pc00,  kEventType)
			caseOf(9,  pc02,  kEventType)
			caseOf(10, pc04,  kEventType)
			caseOf(11, pc06,  kEventType)
		}
	}


}

void serviceTopRowPads()
{
	uint8_t packetCounter, eventType, csIndex;
	I2CMessage thisMsg;
	thisMsg = PadcapReadReg24CPT112S(WANDERLUST_PADCAP_UPPER, 0);
	if (thisMsg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (thisMsg.result & 0x0000000F );
		csIndex       = (thisMsg.result & 0x0000FF00 ) >> 8;

		uint8_t kEventType;

		if (eventType == 0) { kEventType = 1;}
		else                { kEventType = 0;}

		// Translate bit order (determined by routing) to Keyboard keys
		switch(csIndex)
		{
			caseOf(0,  pc18,  kEventType)
			caseOf(1,  pc19,  kEventType)
			caseOf(2,  pc1A,  kEventType)
			caseOf(3,  pc1B,  kEventType)
			caseOf(4,  pc17,  kEventType)
			caseOf(5,  pc15,  kEventType)
			caseOf(6,  pc13,  kEventType)
			caseOf(7,  pc11,  kEventType)
			caseOf(8,  pc10,  kEventType)
			caseOf(9,  pc12,  kEventType)
			caseOf(10, pc14,  kEventType)
			caseOf(11, pc16,  kEventType)
		}
	}
}


void serviceBottomRowPiano()
{
	uint8_t packetCounter, eventType, csIndex;
	I2CMessage thisMsg;

	thisMsg = PadcapReadReg24CPT112S(WANDERLUST_KEYBOARD, 0);

	if (thisMsg.status == RDY_OK)
	{
		//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
		eventType     = (thisMsg.result & 0x0000000F );
		csIndex       = (thisMsg.result & 0x0000FF00 ) >> 8;

		uint8_t kEventType;

		if (eventType == 0) { kEventType = 1;}
		else                { kEventType = 0;}

		#define caseOf( chipNum, kbNum, newVal) case chipNum: kbNum = newVal; break;

		// Translate bit order (determined by routing) to Keyboard keys
		switch(csIndex)
		{
			caseOf(0,  kb5,  kEventType)
			caseOf(1,  kb2,  kEventType)
			caseOf(2,  kb0,  kEventType)
			caseOf(3,  kb4,  kEventType)
			caseOf(4,  kb7,  kEventType)
			caseOf(5,  kb9,  kEventType)
			caseOf(6,  kb11, kEventType)
			caseOf(7,  kb1,  kEventType)
			caseOf(8,  kb3,  kEventType)
			caseOf(9,  kb6,  kEventType)
			caseOf(10, kb8,  kEventType)
			caseOf(11, kb10, kEventType)
		}
	}


}

// PCB1003_1Octave_16PAD_alt_2017-03-02
void serviceCPT112S()
{
	serviceBottomRowPiano();
	serviceBottomRowPads();
	serviceTopRowPads();
}



/*
switch(csIndex)
{
	case 0:
		kb5 = kEventType;
		break;
	case 1:
		kb2 = kEventType;
		break;
	case 2:
		kb0 = kEventType;
		break;
	case 3:
		kb4 = kEventType;
		break;
	case 4:
		kb7 = kEventType;
		break;
	case 5:
		kb9 = kEventType;
		break;
	case 6:
		kb11 = kEventType;
		break;
	case 7:
		kb1 = kEventType;
		break;
	case 8:
		kb3 = kEventType;
		break;
	case 9:
		kb6 = kEventType;
		break;
	case 10:
		kb8 = kEventType;
		break;
	case 11:
		kb10 = kEventType;
		break;
}*/
