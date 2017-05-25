
struct OLED_Struct
{
    int8_t _i2caddr, _vccstate
};

OLED_Struct OLED0;

// Contains default Adafruit splash logo, as per license
static uint8_t OLEDBuffer[SSD1306_LCDHEIGHT * SSD1306_LCDWIDTH / 8] =
{
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
    0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x80, 0x80, 0xC0, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC, 0xF8, 0xE0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
    0x80, 0x80, 0x00, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0xFF,
};

struct I2CMessage
{
	msg_t status;
	uint32_t result;
};


void OLEDClearDisplay()
{
    memset(OLEDBuffer, 0, (SSD1306_LCDWIDTH*SSD1306_LCDHEIGHT/8));
}

void OLED1306_command(uint8_t c)
{
    I2CMessage thisMsg;
	thisMsg.status = RDY_OK;
	txbuf[0] = 0;
    txbuf[1] = c;

	thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 1, rxbuf, 0, tmo); // <TBD add status checking>
	//return(thisMsg);
}


#define OLED_SSD1306_DISPLAYOFF          0xAE
#define OLED_SSD1306_SETDISPLAYCLOCKDIV  0xD5
#define OLED_SSD1306_SETMULTIPLEX        0xA8
#define OLED_SSD1306_LCDWIDTH            128
#define OLED_SSD1306_LCDHEIGHT           32
#define OLED_SSD1306_SETDISPLAYOFFSET    0xD3
#define OLED_SSD1306_SETSTARTLINE        0x40
#define OLED_SSD1306_CHARGEPUMP          0x8D
#define OLED_SSD1306_EXTERNALVCC         0x1
#define OLED_SSD1306_SWITCHCAPVCC        0x2
#define OLED_SSD1306_MEMORYMODE          0x20
#define OLED_SSD1306_SEGREMAP            0xA0
#define OLED_SSD1306_COMSCANDEC          0xC8
#define OLED_SSD1306_SETCOMPINS          0xDA
#define OLED_SSD1306_SETCONTRAST         0x81
#define OLED_SSD1306_SETPRECHARGE        0xD9
#define OLED_SSD1306_SETVCOMDETECT       0xDB
#define OLED_SSD1306_DISPLAYALLON_RESUME 0xA4
#define OLED_SSD1306_NORMALDISPLAY       0xA6
#define OLED_SSD1306_DEACTIVATE_SCROLL   0x2E
#define OLED_SSD1306_DISPLAYON           0xAF
#define OLED_SSD1306_COLUMNADDR          0x21
#define OLED_SSD1306_PAGEADDR            0x22

void OLEDBegin(uint8_t vccstate, uint8_t i2caddr, bool reset)
{
  OLED0._vccstate = vccstate;
  OLED0._i2caddr = i2caddr;

  // Init sequence
  OLED1306_command(OLED_SSD1306_DISPLAYOFF);                    // 0xAE
  OLED1306_command(OLED_SSD1306_SETDISPLAYCLOCKDIV);            // 0xD5
  OLED1306_command(0x80);                                  // the suggested ratio 0x80

  OLED1306_command(OLED_SSD1306_SETMULTIPLEX);                  // 0xA8
  OLED1306_command(OLED_SSD1306_LCDHEIGHT - 1);

  OLED1306_command(OLED_SSD1306_SETDISPLAYOFFSET);              // 0xD3
  OLED1306_command(0x0);                                   // no offset
  OLED1306_command(OLED_SSD1306_SETSTARTLINE | 0x0);            // line #0
  OLED1306_command(OLED_SSD1306_CHARGEPUMP);                    // 0x8D
  if (vccstate == OLED_SSD1306_EXTERNALVCC)
    { OLED1306_command(0x10); }
  else
    { OLED1306_command(0x14); }
  OLED1306_command(OLED_SSD1306_MEMORYMODE);                    // 0x20
  OLED1306_command(0x00);                                  // 0x0 act like ks0108
  OLED1306_command(OLED_SSD1306_SEGREMAP | 0x1);
  OLED1306_command(OLED_SSD1306_COMSCANDEC);

  // #if defined SSD1306_128_32
  OLED1306_command(OLED_SSD1306_SETCOMPINS);                    // 0xDA
  OLED1306_command(0x02);
  OLED1306_command(OLED_SSD1306_SETCONTRAST);                   // 0x81
  OLED1306_command(0x8F);



  OLED1306_command(OLED_SSD1306_SETPRECHARGE);                  // 0xd9
  if (vccstate == OLED_SSD1306_EXTERNALVCC)
    { OLED1306_command(0x22); }
  else
    { OLED1306_command(0xF1); }
  OLED1306_command(OLED_SSD1306_SETVCOMDETECT);                 // 0xDB
  OLED1306_command(0x40);
  OLED1306_command(OLED_SSD1306_DISPLAYALLON_RESUME);           // 0xA4
  OLED1306_command(OLED_SSD1306_NORMALDISPLAY);                 // 0xA6

  OLED1306_command(OLED_SSD1306_DEACTIVATE_SCROLL);

  OLED1306_command(OLED_SSD1306_DISPLAYON);//--turn on oled panel
}

// left off here. Unported
void OLEDDisplay()
{
  OLED1306_command(OLED_SSD1306_COLUMNADDR);
  OLED1306_command(0);   // Column start address (0 = reset)
  OLED1306_command(OLED_SSD1306_LCDWIDTH-1); // Column end address (127 = reset)

  OLED1306_command(OLED_SSD1306_PAGEADDR);
  OLED1306_command(0); // Page start address (0 = reset)
  #if OLED_SSD1306_LCDHEIGHT == 64
    OLED1306_command(7); // Page end address
  #endif
  #if OLED_SSD1306_LCDHEIGHT == 32
    OLED1306_command(3); // Page end address
  #endif
  #if OLED_SSD1306_LCDHEIGHT == 16
    OLED1306_command(1); // Page end address
  #endif

#ifdef TWBR
    uint8_t twbrbackup = TWBR;  // DDL, not sure if this is necessary
    TWBR = 12; // upgrade to 400KHz!
#endif

    // I2C
    for (uint16_t i=0; i<(SSD1306_LCDWIDTH*SSD1306_LCDHEIGHT/8); i+=16)
    {

      txbuf[0] = 0x40;
      thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 1, rxbuf, 0, tmo); // <TBD add status checking>

      for (uint8_t x=0; x<16; x++)
      {
        txbuf[x] = OLEDBuffer[i+x];
      }

      // send a bunch of data in one xmission
      thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 16, rxbuf, 0, tmo); // <TBD add status checking>
    }

    #ifdef TWBR
        TWBR = twbrbackup;
    #endif

}
