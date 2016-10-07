
// This totally has to be refactored
uint8_t knobVal[2][8];

#define STRAND_LENGTH 26

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

LED COLOR_LIST[16] = {
	                  {0x00, 0x00, 0xFF},
	                  {0x00, 0xFF, 0x00},
	                  {0xFF, 0x00, 0x00}
                     };

struct Pixel{
	uint8_t u8Color;
	double dIntensity;
};


Pixel LEDS[26];

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

	for (int iPos = 0; iPos < 26; iPos++) { SetNextLED( LEDS[iPos] ); }

	EndLEDs();
}

void LEDInit()
{
    uint8_t tempIndexColor = 0;

	for (int iPos=0; iPos<26; iPos++)	{ LEDS[iPos].u8Color = tempIndexColor; LEDS[iPos].dIntensity = 1.0; }

	//LEDS.RowBot[3].u8Color = 2;
}

void HighlightLED(uint8_t step, double knobVal)
{
    static Pixel prevPixel;
    static uint8_t prevStep=255; // Start value can't be in the reasonable range or the first pixel will be wonky
    static uint8_t first = 1;

    double intensity = knobVal / 13.4E7;

    //if (knobVal > 13.4E7) intensity = 1.0;
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
        LEDS[step].u8Color = 2;
        LEDS[step].dIntensity = intensity;
        prevStep = step;
    }
    else
    {
         LEDS[step].dIntensity = intensity;
    }


}
