<patch-1.0 appVersion="1.0.10">
   <obj type="gpio/spi/config" sha="62af644b09e7f654b36d66533da8ea5971ddb351" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="742" y="238">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="gpio/i2c/config" sha="1ea9db31ce7ec2874d2a8315213c733a6b3c2dcf" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="756" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_1" x="882" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_3" x="980" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/WanderlustController" uuid="ad20e4d9-a33e-4fc8-9b21-f9bed5e2b12f" name="WanderlustController_1" x="714" y="392">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);

#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\knobs.c"
#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\led.c"
#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\padcaps.c"






// <SPI stuff - knobs, mostly>
// Turns all the SPI chip selects off
void SPI_CS_ALL_OFF()
{
	// Disable Chip Select
	palWritePad(GPIOC,5,1);	// LED
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOA,4,1);	// Knob, Bottom Row
	
}
// </SPI stuff>


// Default Voodoo to make serial communication working; Rabbithole of shared memory
void LinkTxRxBuffers(void)
{
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
}



/*
void ServiceADCs()
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
	
			if (iDevice == 0 ) palWritePad(	GPIOA,	4,	0		);	// enable ADC
			if (iDevice == 1 ) palWritePad(	GPIOB,	7,	0		);	// enable ADC			
			
			spiSend(		&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
			spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208
			
			SPI_CS_ALL_OFF();
			           
			// I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
			uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);
			z = 0x00FF ^ z;
			z = z<<19;
				
			if (iDevice == 0)
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
			if (iDevice == 1)
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


void setup(void) {
	chThdSleepMilliseconds(1000); 
	LinkTxRxBuffers();

	// enable and reset SPI Chip selects
	{
		// Setup Knob Top
		palSetPadMode(GPIOB,7,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
		// Setup Knob Bottom
		palSetPadMode(GPIOA,4,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
		
		// Setup LED
		palSetPadMode(GPIOC,5,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
		SPI_CS_ALL_OFF();	
	}
	
	out1 = 0xABBA;
	
	rxbuf[0] = 0;	
	txbuf[0] = 0; // CAP1188_PRODID;

	PadcapSetup(WANDERLUST_KEYBOARD);
	chThdSleepMilliseconds(1); 
	PadcapSetup(WANDERLUST_PADCAP_LOWER);
	chThdSleepMilliseconds(1); 
	PadcapSetup(WANDERLUST_PADCAP_UPPER);	
	chThdSleepMilliseconds(1); 

	out2 = 0xBEEF;
	out3 = 0xABBA;
	kb0 = false;
	kb1 = false;
	kb2 = false;
	kb3 = false;
	kb4 = false;
	kb5 = false;
	kb6 = false;
	kb7 = false;
	kb8 = false;
	kb9 = false;
	kb10 = false;
	kb11 = false;

	LEDInit();

}
void loop(void)
{	
	
	servicePadCaps();
	readADCAndOutput();	

	
	HighlightLED(5, 13.4E7);
	UpdateStrip();
	

	out1 =123456789;
	//knbB0 = 123456789;

	chThdSleepMilliseconds(1); 
	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_0" x="1260" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="1344" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="ski_down" x="1456" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_13" x="1540" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="parasailing" x="1652" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_25" x="1736" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_2" x="882" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_1" x="1260" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_2" x="1344" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="ski_cross" x="1456" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_14" x="1540" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="diving" x="1652" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_26" x="1736" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_1" x="1078" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_2" x="1260" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_3" x="1344" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="skating" x="1456" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_15" x="1540" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="canoing" x="1652" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_27" x="1736" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_3" x="1260" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_4" x="1344" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="tram" x="1456" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_16" x="1540" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="swimming" x="1652" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_28" x="1736" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_4" x="1260" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_5" x="1344" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="sledding" x="1456" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_17" x="1540" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="sailing" x="1652" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_29" x="1736" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_5" x="1260" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_6" x="1344" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="snowmowbiling" x="1456" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_18" x="1540" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="fishing" x="1652" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_30" x="1736" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_6" x="1260" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_7" x="1344" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="hiking" x="1456" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_19" x="1540" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="anchor" x="1652" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_31" x="1736" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_7" x="1260" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_8" x="1344" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="horsebackriding" x="1456" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_20" x="1540" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="showers" x="1652" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_32" x="1736" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_8" x="1260" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_9" x="1344" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="camper" x="1456" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_21" x="1540" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="bicycle" x="1652" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_33" x="1736" y="854">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="1106" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_9" x="1260" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_10" x="1344" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="trash" x="1456" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_22" x="1540" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="motorcycle" x="1652" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_34" x="1736" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_10" x="1260" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_11" x="1344" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="picnic" x="1456" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_23" x="1540" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_34" x="1652" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_35" x="1736" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_11" x="1260" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_12" x="1344" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="campfire" x="1456" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_24" x="1540" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_35" x="1652" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_36" x="1736" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_5" x="1764" y="1148">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="1274" y="1162">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="1456" y="1162">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="1596" y="1162">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="1274" y="1204">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="1596" y="1204">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="1274" y="1246">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="1596" y="1246">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="1274" y="1288">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="1596" y="1288">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="1274" y="1330">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="1596" y="1330">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="1274" y="1372">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="1596" y="1372">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1274" y="1414">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1596" y="1414">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1274" y="1456">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1596" y="1456">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="WanderlustController_1" outlet="out2_"/>
         <dest obj="hex_1" inlet="in"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb0_"/>
         <dest obj="bool_1" inlet="in"/>
         <dest obj="kb_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb1_"/>
         <dest obj="bool_2" inlet="in"/>
         <dest obj="kb_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb2_"/>
         <dest obj="bool_3" inlet="in"/>
         <dest obj="kb_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb3_"/>
         <dest obj="bool_4" inlet="in"/>
         <dest obj="kb_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb4_"/>
         <dest obj="bool_5" inlet="in"/>
         <dest obj="kb_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb5_"/>
         <dest obj="bool_6" inlet="in"/>
         <dest obj="kb_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb6_"/>
         <dest obj="bool_7" inlet="in"/>
         <dest obj="kb_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb7_"/>
         <dest obj="bool_8" inlet="in"/>
         <dest obj="kb_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb8_"/>
         <dest obj="bool_9" inlet="in"/>
         <dest obj="kb_8" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb9_"/>
         <dest obj="bool_10" inlet="in"/>
         <dest obj="kb_9" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb10_"/>
         <dest obj="bool_11" inlet="in"/>
         <dest obj="kb_10" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb11_"/>
         <dest obj="bool_12" inlet="in"/>
         <dest obj="kb_11" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc01_"/>
         <dest obj="bool_14" inlet="in"/>
         <dest obj="ski_cross" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc02_"/>
         <dest obj="bool_15" inlet="in"/>
         <dest obj="skating" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc03_"/>
         <dest obj="bool_16" inlet="in"/>
         <dest obj="tram" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc04_"/>
         <dest obj="bool_17" inlet="in"/>
         <dest obj="sledding" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc05_"/>
         <dest obj="bool_18" inlet="in"/>
         <dest obj="snowmowbiling" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc06_"/>
         <dest obj="bool_19" inlet="in"/>
         <dest obj="hiking" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc07_"/>
         <dest obj="bool_20" inlet="in"/>
         <dest obj="horsebackriding" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc08_"/>
         <dest obj="bool_21" inlet="in"/>
         <dest obj="camper" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc09_"/>
         <dest obj="bool_22" inlet="in"/>
         <dest obj="trash" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc0A_"/>
         <dest obj="bool_23" inlet="in"/>
         <dest obj="picnic" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc0B_"/>
         <dest obj="bool_24" inlet="in"/>
         <dest obj="campfire" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="out3_"/>
         <dest obj="hex_2" inlet="in"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc10_"/>
         <dest obj="bool_25" inlet="in"/>
         <dest obj="parasailing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc11_"/>
         <dest obj="bool_26" inlet="in"/>
         <dest obj="diving" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc12_"/>
         <dest obj="bool_27" inlet="in"/>
         <dest obj="canoing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc13_"/>
         <dest obj="bool_28" inlet="in"/>
         <dest obj="swimming" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc14_"/>
         <dest obj="bool_29" inlet="in"/>
         <dest obj="sailing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc15_"/>
         <dest obj="bool_30" inlet="in"/>
         <dest obj="fishing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc16_"/>
         <dest obj="bool_31" inlet="in"/>
         <dest obj="anchor" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc17_"/>
         <dest obj="bool_32" inlet="in"/>
         <dest obj="showers" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc18_"/>
         <dest obj="bool_33" inlet="in"/>
         <dest obj="bicycle" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc19_"/>
         <dest obj="bool_34" inlet="in"/>
         <dest obj="motorcycle" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc1A_"/>
         <dest obj="bool_35" inlet="in"/>
         <dest obj="kb_34" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc1B_"/>
         <dest obj="bool_36" inlet="in"/>
         <dest obj="kb_35" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB0_"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="knob_bot_0" inlet="outlet"/>
         <dest obj="dial_4" inlet="in"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="out1_"/>
         <dest obj="dial_3" inlet="in"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB1_"/>
         <dest obj="knob_bot_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB2_"/>
         <dest obj="knob_bot_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB3_"/>
         <dest obj="knob_bot_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB4_"/>
         <dest obj="knob_bot_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB5_"/>
         <dest obj="knob_bot_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB6_"/>
         <dest obj="knob_bot_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB7_"/>
         <dest obj="knob_bot_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT0_"/>
         <dest obj="knob_top_0" inlet="outlet"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="dial_5" inlet="in"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT1_"/>
         <dest obj="knob_top_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT2_"/>
         <dest obj="knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT3_"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT4_"/>
         <dest obj="knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT5_"/>
         <dest obj="knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT6_"/>
         <dest obj="knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT7_"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc00_"/>
         <dest obj="ski_down" inlet="outlet"/>
         <dest obj="bool_13" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1994</x>
      <y>-84</y>
      <width>1860</width>
      <height>1331</height>
   </windowPos>
</patch-1.0>