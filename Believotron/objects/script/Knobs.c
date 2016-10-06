void readADCAndOutput()
{
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

			if (iDevice == 0 ) palWritePad(	GPIOA,	4,	0		);	// enable ADC
			if (iDevice == 1 ) palWritePad(	GPIOB,	7,	0		);	// enable ADC

			spiSend(		&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
			spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208

			SPI_CS_ALL_OFF();

			// I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
			uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);

			uint8_t z8;
			z8 = z;
			//out3 = z8;
			z = 0x00FF ^ z;
			z = z<<19;
			//z8 = 0xA0; //(uint8_t) z;
			out2 = z;

			knobVal[iDevice][pin] = 255-z8; // Knobs are backwards.

			if (iDevice == 0)
			{
				if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot0_value],	z,	0xFFFD	);	}
				else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot1_value],	z,	0xFFFD	);   }
				else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot2_value],	z,	0xFFFD	);   }
				else if (pin == 3)	{   PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{   PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot7_value],	z,	0xFFFD	);   }
			}
			if (iDevice == 1)
			{
				if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop0_value],	z,	0xFFFD	); 	}
				else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop1_value],	z,	0xFFFD	);   }
				else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop2_value],	z,	0xFFFD	);   }
				else if (pin == 3)	{   PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{   PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop7_value],	z,	0xFFFD	);   }
			}

		} // For each Pin
	} // For each row
}
