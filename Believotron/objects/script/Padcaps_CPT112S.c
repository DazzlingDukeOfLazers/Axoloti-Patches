#define WANDERLUST_KEYBOARD	  0x5A
#define WANDERLUST_PADCAP_LOWER 0x5B
#define WANDERLUST_PADCAP_UPPER 0x5C

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


void setupCPT112S(uint8_t ui8tPadcapChannel)
{
	// Some real heavy lifting here
}


void serviceCPT112S()
{
	static int32_t iSameCount=0, iLoopCount, iAddr=0;

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

	ui32CapTouched = PadcapReadReg24CPT112S(0x70, 0);

	//packetCounter = (ui32CapTouched & 0x00F00000 ) >> 20;
	eventType     = (ui32CapTouched & 0x0000000F );
	csIndex       = (ui32CapTouched & 0x0000FF00 ) >> 8;


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
