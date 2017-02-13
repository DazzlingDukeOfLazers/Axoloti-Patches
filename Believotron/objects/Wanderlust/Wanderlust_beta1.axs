<patch-1.0 appVersion="1.0.12">
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="518" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="602" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="686" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="770" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="854" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="938" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1022" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1106" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/spi/config" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="182" y="378">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="518" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="602" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="686" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="770" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="854" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="938" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1022" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1106" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/i2c/config" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="196" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Intensity" x="28" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/WanderlustController" uuid="ad20e4d9-a33e-4fc8-9b21-f9bed5e2b12f" name="WanderlustController_1" x="140" y="504">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);


// TBD, figure out cross platform solution to relative directories

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

	SetAllLEDs(stepNum);
	UpdateStrip();
	
	//HighlightLED(5, 13.4E7);
	//UpdateStrip();
	

	out1 =123456789;
	//knbB0 = 123456789;

	chThdSleepMilliseconds(1); 
	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="parasailing" x="518" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="diving" x="602" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="canoing" x="686" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="swimming" x="770" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="sailing" x="854" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="fishing" x="938" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="anchor" x="1022" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="showers" x="1106" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="step" x="28" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Reverse Knobs" x="28" y="602">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="ski_down" x="518" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="ski_cross" x="602" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="skating" x="686" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="tram" x="770" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="sledding" x="854" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="snowmowbiling" x="938" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="hiking" x="1022" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="horsebackriding" x="1106" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Rev Padrow Top" x="28" y="672">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Rev Padrow Bottom" x="14" y="742">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_0" x="518" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_1" x="602" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_2" x="686" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_3" x="770" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_4" x="854" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_5" x="938" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_6" x="1022" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_7" x="1106" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_8" x="1190" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_9" x="1274" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_10" x="1358" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_11" x="1442" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_2" x="980" y="882">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC1 (ADC1_IN11)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_6" x="1260" y="896">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLX" x="1358" y="896">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_1" x="980" y="980">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC4 (ADC1_IN14)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_7" x="1260" y="980">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLY" x="1358" y="980">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="WanderlustController_1" outlet="kb0_"/>
         <dest obj="kb_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb1_"/>
         <dest obj="kb_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb2_"/>
         <dest obj="kb_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb3_"/>
         <dest obj="kb_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb4_"/>
         <dest obj="kb_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb5_"/>
         <dest obj="kb_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb6_"/>
         <dest obj="kb_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb7_"/>
         <dest obj="kb_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb8_"/>
         <dest obj="kb_8" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb9_"/>
         <dest obj="kb_9" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb10_"/>
         <dest obj="kb_10" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="kb11_"/>
         <dest obj="kb_11" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc01_"/>
         <dest obj="ski_cross" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc02_"/>
         <dest obj="skating" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc03_"/>
         <dest obj="tram" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc04_"/>
         <dest obj="sledding" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc05_"/>
         <dest obj="snowmowbiling" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc06_"/>
         <dest obj="hiking" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc07_"/>
         <dest obj="horsebackriding" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc10_"/>
         <dest obj="parasailing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc11_"/>
         <dest obj="diving" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc12_"/>
         <dest obj="canoing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc13_"/>
         <dest obj="swimming" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc14_"/>
         <dest obj="sailing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc15_"/>
         <dest obj="fishing" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc16_"/>
         <dest obj="anchor" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="pc17_"/>
         <dest obj="showers" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbB0_"/>
         <dest obj="knob_bot_0" inlet="outlet"/>
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
         <source obj="WanderlustController_1" outlet="pc00_"/>
         <dest obj="ski_down" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_1" outlet="out"/>
         <dest obj="dial_7" inlet="in"/>
         <dest obj="joyLY" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_2" outlet="out"/>
         <dest obj="dial_6" inlet="in"/>
         <dest obj="joyLX" inlet="outlet"/>
      </net>
      <net>
         <source obj="Intensity" outlet="inlet"/>
         <dest obj="WanderlustController_1" inlet="stepIntensity_"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT3_"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="WanderlustController_1" outlet="knbT7_"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="step" outlet="inlet"/>
         <dest obj="WanderlustController_1" inlet="stepNum_"/>
      </net>
      <net>
         <source obj="Reverse Knobs" outlet="o"/>
         <dest obj="WanderlustController_1" inlet="reverseKnobs_"/>
      </net>
      <net>
         <source obj="Rev Padrow Top" outlet="o"/>
         <dest obj="WanderlustController_1" inlet="reversePadrowTop_"/>
      </net>
      <net>
         <source obj="Rev Padrow Bottom" outlet="o"/>
         <dest obj="WanderlustController_1" inlet="reversePadrowBottom_"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-91</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>