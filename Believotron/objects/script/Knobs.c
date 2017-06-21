/* Knobs.c
	A simple helper file for reading from ADCs
*/


//#define TOTAL_TICKS 0x07A12000
//#define TOTAL_TICKS 0x07FFFFFF - 0x0007FFFF Offset in axo system
#define TOTAL_TICKS 0x7F80000
#define KNOB_PER_BIT 0.0000005
// 64 / 0.000 000 5 = 128K



void readADCAndOutput(GPIO_TypeDef* iPort, uint8_t iPin, uint8_t iDevice)
{
	txbuf[0] = 0b00000000;
	txbuf[1] = 0b00000000;
	txbuf[2] = 0b00000000;

	for(int pin=0; pin<8; pin++)
	{

		{ // Assemble the Command for readback
			txbuf[0] = pin < 4 ? 0b01100000 : 0b11100000;

			if      (pin % 4 == 0)	{	txbuf[1] = 0b00000000;	} // pin == 0 || pin == 4
			else if (pin % 4 == 1)	{	txbuf[1] = 0b00000010;	} // pin == 1 || pin == 5
			else if (pin % 4 == 2)	{	txbuf[1] = 0b00000001;   } // pin == 2 || pin == 6
			else                 	{	txbuf[1] = 0b00000011;   }

		}

		SPI_CS_ALL_OFF();

		palWritePad(iPort,	iPin,	0);	// enable ADC

		spiSend(	&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
		spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208

		SPI_CS_ALL_OFF();

		// I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
		uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);
		z = 0x00FF ^ z;
		z = z<<19;

		if (!reverseKnobs){ z=TOTAL_TICKS - z; }//{ z = z - 64;}

		knb[iDevice][pin] = z; // output in calling object

	} // For each Pin
}



/*
void readADCAndOutput() // Legacy code
{
	txbuf[0] = 0b00000000;
	txbuf[1] = 0b00000000;
	txbuf[2] = 0b00000000;


	for(int iDevice=0; iDevice<2; iDevice++)
	{
		for(int pin=0; pin<8; pin++){

			{ // Assemble the Command for readback
				txbuf[0] = pin < 4 ? 0b01100000 : 0b11100000;

				if      (pin % 4 == 0)	{	txbuf[1] = 0b00000000;	} // pin == 0 || pin == 4
				else if (pin % 4 == 1)	{	txbuf[1] = 0b00000010;	} // pin == 1 || pin == 5
				else if (pin % 4 == 2)	{	txbuf[1] = 0b00000001;   } // pin == 2 || pin == 6
				else                 	{	txbuf[1] = 0b00000011;   }

			}

			SPI_CS_ALL_OFF();

			if (SwapKnobRow)
			{
				if (iDevice == 0 ) palWritePad(	GPIOB,	6,	0		);	// enable ADC
				if (iDevice == 1 ) palWritePad(	GPIOB,	7,	0		);	// enable ADC
			}
			else
			{
				if (iDevice == 1 ) palWritePad(	GPIOB,	6,	0		);	// enable ADC
				if (iDevice == 0 ) palWritePad(	GPIOB,	7,	0		);	// enable ADC
			}



			spiSend(		&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
			spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208

			SPI_CS_ALL_OFF();

			// I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
			uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);
			z = 0x00FF ^ z;
			z = z<<19;

//#define TOTAL_TICKS 0x07A12000
//#define TOTAL_TICKS 0x07FFFFFF - 0x0007FFFF Offset in axo system
#define TOTAL_TICKS 0x7F80000
#define KNOB_PER_BIT 0.0000005
// 64 / 0.000 000 5 = 128K
			if (!reverseKnobs)
			{
				z=TOTAL_TICKS - z;
			}//{ z = z - 64;}

			if (iDevice == 1)
			{
				if      (pin == 0)	{knbB0 = z;}
				else if (pin == 1)	{knbB1 = z;}
				else if (pin == 2)	{knbB2 = z;}
				else if (pin == 3)	{knbB3 = z;}
				else if (pin == 4)	{knbB4 = z;}
				else if (pin == 5)	{knbB5 = z;}
				else if (pin == 6)	{knbB6 = z;}
				else if (pin == 7)	{knbB7 = z;}
			}
			if (iDevice == 0)
			{
				if      (pin == 0)	{knbT0 = z;}
				else if (pin == 1)	{knbT1 = z;}
				else if (pin == 2)	{knbT2 = z;}
				else if (pin == 3)	{knbT3 = z;}
				else if (pin == 4)	{knbT4 = z;}
				else if (pin == 5)	{knbT5 = z;}
				else if (pin == 6)	{knbT6 = z;}
				else if (pin == 7)	{knbT7 = z;}
			}


		} // For each Pin
	} // For each row
}
*/
