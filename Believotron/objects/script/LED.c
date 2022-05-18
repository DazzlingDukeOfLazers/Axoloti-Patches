
// This totally has to be refactored
uint8_t knobVal[2][8];

#define STRAND_LENGTH 64

// These are going to be copied to the struct below
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

#define I_GREEN_LIME_SOFT 5
#define I_ORANGE_SOFT 6

#define NUM_COLORS 10
LED COLOR_LIST[NUM_COLORS] = { {C_BLACK},
					  {C_WHITE},
	                  {0x00, 0x00, 0xFF},
	                  {0x00, 0xFF, 0x00},
	                  {0xFF, 0x00, 0x00},
					  {C_GREEN_LIME_SOFT},
					  {C_ORANGE_SOFT},
					  {C_RED_PEACH},
					  {C_PINK_WATERMELON},
					  {C_BLUE_ICE}
                     };

struct Pixel{
	uint8_t u8Color;
	double dIntensity;
};


Pixel LEDS[STRAND_LENGTH];

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

	palWritePad(	GPIOC,	5,	0 );	// enable LEDs
	//chThdSleepMilliseconds(5);

    uint8_t buffer[4];
	// Start frame
	//buffer[0] = 0x00; spiSend( &SPID1,	1,	buffer);	// send SPI data txbuf[]
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

    uint8_t buff[4];
    //buff[0] = 0xFF;                                                    spiSend( &SPID1,	1,	buff); // 0b111XXXXX LED Frame signal, The others are "global" maybe fade or something?
    txbuf[0] = 0xFF;                                                    spiSend( &SPID1,	1,	txbuf); // 0b111XXXXX LED Frame signal, The others are "global" maybe fade or something?
	txbuf[0] = reverse8( (uint8_t) thisLED.b * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Blue
	txbuf[0] = reverse8( (uint8_t) thisLED.g * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Green
	txbuf[0] = reverse8( (uint8_t) thisLED.r * thisPixel.dIntensity );  spiSend( &SPID1,	1,	txbuf); // Red
}

void UpdateStrip()
{
	SetupLEDs();

	for (int iPos = 0; iPos < STRAND_LENGTH; iPos++) { SetNextLED( LEDS[iPos] ); }

	EndLEDs();
}

void LEDInit()
{
    uint8_t tempIndexColor = 0;

	for (int iPos=0; iPos<STRAND_LENGTH; iPos++)	{ LEDS[iPos].u8Color = tempIndexColor; LEDS[iPos].dIntensity = 1.0; }

	//LEDS.RowBot[3].u8Color = 2;
}


void SetLED(uint8_t position, uint8_t color, double knobVal)
{
    double intensity = knobVal / 13.4E7;
    LEDS[position].u8Color = color;
    LEDS[position].dIntensity = intensity;
}

void HighlightLED(uint8_t step, double knobVal)
{
    static Pixel prevPixel;
    static uint8_t prevStep=255; // Start value can't be in the reasonable range or the first pixel will be wonky
    static uint8_t first = 1;

    double intensity = knobVal / 13.4E7;
    //double intensity = knobVal * 4;

    //double intensity;
    //if (knobVal > 1E7) intensity = 1.0;
    //else             intensity = 0.1;



    // First time you have to
    if (first==1)
    {
        first = 0;
        // Store current Pixel
        prevPixel = LEDS[step];
    }


    if (step != prevStep)
    {


        LEDS[prevStep]= prevPixel; // This is using an ugly trick on the structure to surpass it's own bounds.

        // Store current LED
        prevPixel = LEDS[step];

        // New Color
        LEDS[step].u8Color = 4;
        LEDS[step].dIntensity = intensity;
        prevStep = step;
    }
    else
    {
         LEDS[step].dIntensity = intensity;
    }


}

void SetCheckerPattern(uint8_t iPattern)
{
	uint8_t iColor0, iColor1;

	if (iPattern % 2 == 0)
	{
		iColor0 = I_ORANGE_SOFT;
		iColor1 = I_GREEN_LIME_SOFT;
	}
	else
	{
		iColor0 = 2;
		iColor1 = 1;
	}

	int iSection=0;
	int iRow=0;
	for (int iLED=0; iLED < STRAND_LENGTH; iLED++)
	{
		if (iLED % 4 == 0)
		{
			if (iSection == 0) { iSection = 1; }
			else               { iSection = 0; }
		}
		if (iLED % 16 == 0)
		{
			if (iRow == 0) { iRow = 1; }
			else           { iRow = 0; }
		}


		if (iRow == 0)
		{
			if (iSection)
			{
				LEDS[iLED].u8Color = iColor0;
				LEDS[iLED].dIntensity = 0.04;
			}
			else
			{
				LEDS[iLED].u8Color = iColor1;
				LEDS[iLED].dIntensity = 0.04;
			}
		}
		else
		{
			if (iSection)
			{
				LEDS[iLED].u8Color = iColor1;
				LEDS[iLED].dIntensity = 0.04;
			}
			else
			{
				LEDS[iLED].u8Color = iColor0;
				LEDS[iLED].dIntensity = 0.04;
			}
		}


	}
}

void SetAllLEDs(uint8_t iColor, double dIntensity)
{
	for (int iLED=0; iLED < STRAND_LENGTH; iLED++)
	{
		if ( (iColor < 0) || (iColor >= NUM_COLORS) ) { iColor = 0;}

		LEDS[iLED].u8Color = iColor;
		LEDS[iLED].dIntensity = dIntensity;

	}
}

void SetColumn(uint8_t iColumn, uint8_t iColor)
{
	LEDS[iColumn].u8Color = iColor;
	LEDS[iColumn].dIntensity = 0.25;

	LEDS[iColumn+16].u8Color = iColor;
	LEDS[iColumn+16].dIntensity = 0.25;

	LEDS[iColumn+32].u8Color = iColor;
	LEDS[iColumn+32].dIntensity = 0.25;

	LEDS[iColumn+48].u8Color = iColor;
	LEDS[iColumn+48].dIntensity = 0.25;
}

void SetColumnPair(uint8_t iColumn, uint8_t iColor)
{
	SetColumn(iColumn,   iColor);
	SetColumn(iColumn+1, iColor);
}


void JamColumn(uint8_t kbBinary)
{
	if (kbBinary & 0x80) { SetColumnPair(0,  2); } else { SetColumnPair(0,   0); }
	if (kbBinary & 0x40) { SetColumnPair(2,  3); } else { SetColumnPair(2,   0); }
	if (kbBinary & 0x20) { SetColumnPair(4,  4); } else { SetColumnPair(4,   0); }
	if (kbBinary & 0x10) { SetColumnPair(6,  5); } else { SetColumnPair(6,   0); }
	if (kbBinary & 0x08) { SetColumnPair(8,  6); } else { SetColumnPair(8,   0); }
	if (kbBinary & 0x04) { SetColumnPair(10, 7); } else { SetColumnPair(10,  0); }
	if (kbBinary & 0x02) { SetColumnPair(12, 8); } else { SetColumnPair(12,  0); }
	if (kbBinary & 0x01) { SetColumnPair(14, 9); } else { SetColumnPair(14,  0); }
}
