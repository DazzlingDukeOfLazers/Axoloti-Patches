<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="28" text="Believotron Wanderlust Knob Bottom Row Object."/>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_2" x="364" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/spi/config" sha="62af644b09e7f654b36d66533da8ea5971ddb351" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="28" y="70">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="script/Knobs_and_LEDs" uuid="ebc31452-ca44-46f9-81ed-d12c11874806" name="Knobs_and_LEDs_1" x="168" y="70">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[/*
	Believotron Wanderlust Knob / Potentiometer Interface

	Two parallel SPI MCP3008 ADCs, read, and output to knobBot0-7, and knobTop0-7

	Herstory:
	2016-06-22	Dazzling Duke of Lazers
				Cleaned up file for release
				Initial Release
*/
 
uint8_t *txbuf;
uint8_t *rxbuf;

// This totally has to be refactored
uint8_t knobVal[2][8];

uint8_t greenVal;
uint8_t redVal;
uint8_t blueVal;

#define STRAND_LENGTH 26

#define C_BLACK                  0x00, 0x00, 0x00
#define C_WHITE                  0xFF, 0xFF, 0xFF
#define C_BLUE                   0x00, 0x00, 0xFF
#define C_BLUE_LIGHT             0x00, 0x80, 0xFF
#define C_BLUE_ICE               0x00, 0xFD, 0xFF
#define C_BLUE_TEAL              0x00, 0xE0, 0x80
#define C_GREEN_EMERALD_L        0x00, 0xFE, 0xF0
#define C_YELLOW_L               0xFF, 0xFF, 0x00
#define C_YELLOW_MUSTARD         0xFF, 0x60, 0x00
#define C_YELLOW_ORANGE          0xFF, 0x20, 0x00
#define C_YELLOW_RED             0xFF, 0x10, 0x00
#define C_PINK_BUBBLE            0xFF, 0x00, 0xFF
#define C_PINK_NEON              0xFF, 0x00, 0x60
#define C_PINK_HOT               0xFF, 0x00, 0x40
#define C_PURPLE_SOFT            0x10, 0x00, 0x20
#define C_PINK_WATERMELON        0xFF, 0x00, 0x10
#define C_PINK_RED               0xFF, 0x00, 0x08
#define C_PURPLE_VIOLET          0x10, 0x00, 0x08
#define C_BLUE_SKY               0x20, 0x40, 0x80
#define C_BLUE_L2                0x00, 0x40, 0x80
#define C_BLUE_TEAL2             0x00, 0x80, 0x80
#define C_BLUE_BLUE_SW           0x80, 0xFF, 0x80
#define C_ORANGE_SOFT            0x80, 0x20, 0x00
#define C_GREEN_LIME_SOFT        0xC0, 0xFF, 0x00
#define C_ORANGE_2               0xC0, 0x10, 0x00
#define C_BEIGE                  0x80, 0x40, 0x20 
#define C_BEIGE_GREEN            0x40, 0x60, 0x10 
#define C_RED_PEACH              0x80, 0x20, 0x10

#define C_PREV0 C_BEIGE
#define C_PREV1 C_BEIGE_GREEN

struct LED{
	uint8_t r;
	uint8_t g;
	uint8_t b;
};

LED COLOR_LIST[16] = { 
	                  {0x00, 0x00, 0xFF}, 
	                  {0x00, 0xFF, 0x00}, 
	                  {0xFF, 0x00, 0x00}
                     }; 

struct Pixel{
	uint8_t u8Color;
	double dIntensity;	
};

struct {
	Pixel RowBot[8];
	Pixel RowMid[8];
	Pixel RowTop[8];
	Pixel RowMnu[2];
} LEDS;


// Turns all the SPI chip selects off
void SPI_CS_ALL_OFF()
{
	// Disable Chip Select
	palWritePad(GPIOC,5,0);	// LED
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOA,4,1);	// Knob, Bottom Row
	
}
 


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
				else if (pin == 3)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot7_value],	z,	0xFFFD	);   }	
			}
			if (iDevice == 1)
			{
				if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop0_value],	z,	0xFFFD	); 	}
				else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop1_value],	z,	0xFFFD	);   }
				else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop2_value],	z,	0xFFFD	);   }
				else if (pin == 3)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop7_value],	z,	0xFFFD	);   }
			}
		
		} // For each Pin
	} // For each row
}


uint8_t reverse8( uint8_t straight )
{
	uint8_t reverse;

	reverse = ( (straight & 0x01) << 7 ) |
	          ( (straight & 0x02) << 5 ) |
	          ( (straight & 0x04) << 3 ) |
	          ( (straight & 0x08) << 1 ) |
	          ( (straight & 0x10) >> 1 ) |
	          ( (straight & 0x20) >> 3 ) |
	          ( (straight & 0x40) >> 5 ) |
	          ( (straight & 0x80) >> 7 );

	return reverse;
}

void SetupLEDs()
{
	SPI_CS_ALL_OFF();	
	
	palWritePad(	GPIOC,	5,	1 );	// enable LEDs	
	//chThdSleepMilliseconds(5);     
	
	// Start frame
	txbuf[0] = 0x00; spiSend( &SPID1,	1,	txbuf);	// send SPI data txbuf[]	
	txbuf[0] = 0x00; spiSend( &SPID1,	1,	txbuf);	// send SPI data txbuf[]	
	txbuf[0] = 0x00; spiSend( &SPID1,	1,	txbuf);	// send SPI data txbuf[]	
	txbuf[0] = 0x00; spiSend( &SPID1,	1,	txbuf);	// send SPI data txbuf[]	
}

void EndLEDs()
{
	// Stop frame
	txbuf[0] = 0xFF; spiSend( &SPID1,	1,	txbuf);
	txbuf[0] = 0xFF; spiSend( &SPID1,	1,	txbuf);
	txbuf[0] = 0xFF; spiSend( &SPID1,	1,	txbuf);
	txbuf[0] = 0xFF; spiSend( &SPID1,	1,	txbuf);
	
	SPI_CS_ALL_OFF();
}

// Send the next LED info
void SetNextLEDColor(uint8_t red, uint8_t green, uint8_t blue)
{
	txbuf[0] = 0xFF;             spiSend( &SPID1,	1,	txbuf); // 0b111XXXXX LED Frame signal, The others are "global" maybe fade or something?
	txbuf[0] = reverse8(blue );  spiSend( &SPID1,	1,	txbuf); // Blue
	txbuf[0] = reverse8(green);  spiSend( &SPID1,	1,	txbuf); // Green		
	txbuf[0] = reverse8(red  );  spiSend( &SPID1,	1,	txbuf); // Red 
}

void SetNextLEDColorPercent(uint8_t red, uint8_t green, uint8_t blue, double intensity)
{
	
	txbuf[0] = 0xFF;                                  spiSend( &SPID1,	1,	txbuf); // 0b111XXXXX LED Frame signal, The others are "global" maybe fade or something?
	txbuf[0] = reverse8( (uint8_t)  blue*intensity);  spiSend( &SPID1,	1,	txbuf); // Blue
	txbuf[0] = reverse8( (uint8_t) green*intensity);  spiSend( &SPID1,	1,	txbuf); // Green		
	txbuf[0] = reverse8( (uint8_t)   red*intensity);  spiSend( &SPID1,	1,	txbuf); // Red 
}

void SetNextLED( Pixel thisPixel )
{
	LED thisLED = COLOR_LIST[ thisPixel.u8Color ];
	
	txbuf[0] = 0xFF;                                                   spiSend( &SPID1,	1,	txbuf); // 0b111XXXXX LED Frame signal, The others are "global" maybe fade or something?
	txbuf[0] = reverse8( (uint8_t) thisLED.b * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Blue
	txbuf[0] = reverse8( (uint8_t) thisLED.g * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Green		
	txbuf[0] = reverse8( (uint8_t) thisLED.r * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Red 
}








void UpdateStrip()
{
	SetupLEDs();		
	
	for (int iPos = 0; iPos < 8; iPos++) { SetNextLED( LEDS.RowBot[iPos] ); }
	for (int iPos = 0; iPos < 8; iPos++) { SetNextLED( LEDS.RowMid[iPos] ); }
	for (int iPos = 0; iPos < 8; iPos++) { SetNextLED( LEDS.RowTop[iPos] ); }
	for (int iPos = 0; iPos < 2; iPos++) { SetNextLED( LEDS.RowMnu[iPos] ); }

	EndLEDs();
}




void KnobColor()
{
	SetupLEDs();		

	// Bottom Row (Padcaps)
	for (int iStrandPos =  0; iStrandPos <  8; iStrandPos++) { SetNextLEDColor(C_BLACK); }

	int iColor=1;

	uint8_t valR = COLOR_LIST[iColor].r;
	uint8_t valG = COLOR_LIST[iColor].g;
	uint8_t valB = COLOR_LIST[iColor].b;
	
	// Knob bottom row
	for (int iStrandPos =  8; iStrandPos < 16; iStrandPos++) 
	{
		uint8_t knobR = 1.0; //256-knobVal[1][iStrandPos-16];
		uint8_t knobG = 1.0;
		uint8_t knobB = 1.0;
		
		
		SetNextLEDColor( (uint8_t) valR ,
		                 (uint8_t) valG ,
		                 (uint8_t) valB );
		
	}

	
	
	for (int iStrandPos = 16; iStrandPos < 24; iStrandPos++) 
	{ 
		// Knob Top row
		uint8_t knobR = 256-knobVal[1][iStrandPos-16];
		uint8_t knobG = 1.0;
		uint8_t knobB = 1.0;
		
		
		SetNextLEDColor( (uint8_t) valR ,
		                 (uint8_t) valG ,
		                 (uint8_t) valB );
	}
	
/*
	
	// Manually Tap out a row
	double mult=1.0;
	
	SetNextLEDColorPercent(0,0x80, 0x00, 1);		
	SetNextLEDColorPercent(0,0x40, 0x00, 1);
	SetNextLEDColorPercent(0,0x20, knobVal[1][2]*0, 1);
	SetNextLEDColorPercent(0,0x10, knobVal[1][3]*0, 1);
	SetNextLEDColorPercent(0,0x08, knobVal[1][4]*0, 1);
	SetNextLEDColorPercent(0,0x04, knobVal[1][5]*0, 1);
	SetNextLEDColorPercent(0,0x02, knobVal[1][6]*0, 1);
	SetNextLEDColorPercent(0,0x01, knobVal[1][7]*0, 1);
*/	
	
	SetNextLEDColorPercent(C_PREV0, 1);				
	SetNextLEDColorPercent(C_PREV1, 1);		
	//for (int iStrandPos=24; iStrandPos < 26; iStrandPos++) { SetNextLEDColor(C_BLACK); }		
		
				
	

	EndLEDs();
}


void setup(void){

	// Bind the SRAM to the local variables
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;

	greenVal = 0x00;
	redVal   = 0x00;
	blueVal  = 0x00;
 
	// Setup Knob Top
	palSetPadMode(GPIOB,7,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	// Setup Knob Bottom
	palSetPadMode(GPIOA,4,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
	// Setup LED
	palSetPadMode(GPIOC,5,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	SPI_CS_ALL_OFF();	

	
	uint8_t tempIndexColor = 1;

	for (int iPos=0; iPos<8; iPos++)	{ LEDS.RowBot[iPos].u8Color = tempIndexColor; LEDS.RowBot[iPos].dIntensity = 1.0; }
	for (int iPos=0; iPos<8; iPos++)	{ LEDS.RowMid[iPos].u8Color = tempIndexColor; LEDS.RowMid[iPos].dIntensity = 1.0; }
	for (int iPos=0; iPos<8; iPos++)	{ LEDS.RowTop[iPos].u8Color = tempIndexColor; LEDS.RowTop[iPos].dIntensity = 1.0; }
	for (int iPos=0; iPos<2; iPos++)	{ LEDS.RowMnu[iPos].u8Color = tempIndexColor; LEDS.RowMnu[iPos].dIntensity = 1.0; }

	LEDS.RowBot[3].u8Color = 2;
}

 
void loop(void){	
	
	

	//readADCAndOutput();	
	//setLEDs();
	UpdateStrip();
       	
	chThdSleepMilliseconds(1);        
}

]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_1" x="448" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="448" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop0" x="28" y="210">
      <params>
         <frac32.u.map name="value" value="23.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="98" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop1" x="182" y="210">
      <params>
         <frac32.u.map name="value" value="43.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="252" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop2" x="336" y="210">
      <params>
         <frac32.u.map name="value" value="40.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="406" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop3" x="490" y="210">
      <params>
         <frac32.u.map name="value" value="51.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="560" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop4" x="644" y="210">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="714" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop5" x="798" y="210">
      <params>
         <frac32.u.map name="value" value="22.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="868" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop6" x="952" y="210">
      <params>
         <frac32.u.map name="value" value="16.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1022" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop7" x="1106" y="210">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1176" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="98" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot0" x="28" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="98" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot1" x="182" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="252" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot2" x="336" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="406" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot3" x="490" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="560" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot4" x="644" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="714" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot5" x="798" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="868" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot6" x="952" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1022" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot7" x="1106" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1176" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="98" y="392">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="knobBot0" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="knob_bot_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot1" outlet="out"/>
         <dest obj="knob_bot_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot2" outlet="out"/>
         <dest obj="knob_bot_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot3" outlet="out"/>
         <dest obj="knob_bot_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot4" outlet="out"/>
         <dest obj="knob_bot_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot5" outlet="out"/>
         <dest obj="knob_bot_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot6" outlet="out"/>
         <dest obj="knob_bot_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot7" outlet="out"/>
         <dest obj="knob_bot_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop0" outlet="out"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="knob_top_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop2" outlet="out"/>
         <dest obj="knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop3" outlet="out"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop4" outlet="out"/>
         <dest obj="knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop5" outlet="out"/>
         <dest obj="knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop6" outlet="out"/>
         <dest obj="knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop7" outlet="out"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop1" outlet="out"/>
         <dest obj="knob_top_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="Knobs_and_LEDs_1" outlet="out3_"/>
         <dest obj="i_1" inlet="in"/>
         <dest obj="hex_1" inlet="in"/>
      </net>
      <net>
         <source obj="Knobs_and_LEDs_1" outlet="out2_"/>
         <dest obj="hex_2" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2109</x>
      <y>229</y>
      <width>1312</width>
      <height>625</height>
   </windowPos>
</patch-1.0>