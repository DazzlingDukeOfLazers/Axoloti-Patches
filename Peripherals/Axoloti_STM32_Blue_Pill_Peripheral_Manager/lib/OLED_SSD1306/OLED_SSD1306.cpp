/*********************************************************************
    Library: OLED_SSD1306.cpp
    Description:
        This is a lightweight port of the Adafruit SSD1306 library,
        designed to run on the Axoloti platform.

        Design focus is on small code footprint and limited, local dependencies

    Herstory:
        2018-01-02 Profiling
                    OLEDDisplay: 0.34s for all four screens
                    OLEDInit = 0.11s
                    OLED_setstring() < 0.1 ms

        2017-05-24  Initial Port

*/

/*********************************************************************
This is a library for our Monochrome OLEDs based on SSD1306 drivers

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/category/63_98

These displays use SPI to communicate, 4 or 5 pins are required to
interface

Adafruit invests time and resources providing this open source code,
please support Adafruit and open-source hardware by purchasing
products from Adafruit!

Originally written by Limor Fried/Ladyada for Adafruit Industries.
BSD license, check license.txt for more information
All text above, and the splash screen below must be included in any redistribution
(see .h)
*********************************************************************/

// Address of 0x3C when viewing 7 bit address, and 0x78 when in 8bit viewing
#include "OLED_SSD1306.h"

#include "Fonts/font_QuarterMuncher.cpp"

#include <SoftWire.h>
//#include <string.h>
#undef max
#undef min
#include <string>





// <r>
struct OLED_Struct{
    uint8_t _i2caddr, _vccstate; // vccstate is depricated. Remove during refactor
};

OLED_Struct OLED0;
// </r>


uint8_t txbuf[I2C_BUFF_SIZE], rxbuf[I2C_BUFF_SIZE];

struct I2CMessage{
	int32_t status;
	uint32_t result;
};

uint8_t OLEDBuffer[NUM_OLED_DISPLAYS][OLED_BUFF_SIZE];

uint8_t Cartesian_Byte_Array[NUM_OLED_DISPLAYS][CARTESIAN_BYTE_ARRAY_NUM_ROWS][CARTESIAN_BYTE_ARRAY_NUM_COLS];

uint8_t OLEDUpdateMask[NUM_OLED_DISPLAYS][NUM_TEXT_ROWS];

uint8_t Cartesian_Byte_Array_Checkerboard[CARTESIAN_BYTE_ARRAY_NUM_ROWS][CARTESIAN_BYTE_ARRAY_NUM_COLS] = {
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },

    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },

    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },

    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
    { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 },
    { 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA },
};

/*{ // keep this template
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },

    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },

    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },

    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
};*/

//              DATA, CLOCK
//SoftWire SWire(PB6, PB7, SOFT_FAST);
SoftWire SWire(PB10, PB11, SOFT_FAST);

void i2CBegin() { SWire.begin();}

uint8_t i2CWriteByte(uint8_t address, uint8_t command){
    uint8_t errors = 0;
    SWire.beginTransmission(address);
    SWire.write(command);
    SWire.endTransmission();
    return errors;
}

uint8_t i2CWrite(uint8_t address, uint8_t * buff, int numBytes ){
    uint8_t errors = 0;
    SWire.beginTransmission(address);
    SWire.write(buff, numBytes);
    SWire.endTransmission();
    return errors;
}

#define OLED_CLEAR      0
#define OLED_SOLID      1
#define OLED_CHECKER_AA 2
#define OLED_CHECKER_55 3

char OLEDTextBuff[NUM_OLED_DISPLAYS][NUM_OLED_CHARS];

void OLEDBufferClear(uint8_t iDevice, uint8_t iPattern){
    //for (int iRow=0; iRow< CARTESIAN_BYTE_ARRAY_NUM_ROWS; iRow++)
    uint8_t iPatternEven, iPatternOdd;

    switch (iPattern){
        case OLED_CLEAR:
            iPatternEven = 0x00;
            iPatternOdd  = 0x00;
        break;

        case OLED_CHECKER_AA:
            iPatternEven = 0xAA;
            iPatternOdd  = 0x55;
        break;

        case OLED_CHECKER_55:
            iPatternEven = 0x55;
            iPatternOdd  = 0xAA;
        break;

        case OLED_SOLID:
        default:
            iPatternEven = 0xFF;
            iPatternOdd  = 0xFF;
            break;
    }



    for (int iChar=0; iChar < NUM_OLED_CHARS; iChar++){
        OLEDTextBuff[iDevice][iChar] = ' ';
    }

    for (int iRow=0; iRow< CARTESIAN_BYTE_ARRAY_NUM_ROWS; iRow++) {
        for(int iCol=0; iCol< CARTESIAN_BYTE_ARRAY_NUM_COLS; iCol++) {
            if (iRow % 2 == 0) { Cartesian_Byte_Array[iDevice][iRow][iCol] = iPatternEven; }
            else               { Cartesian_Byte_Array[iDevice][iRow][iCol] = iPatternOdd;  }
        }
    }
}

void SetOLEDChan(uint8_t iChan)
{ // Only used if an I2C Address switcher is inline
#if 1
    if (iChan > 3) return;

    txbuf[0] = 0x01 << iChan;

    i2CWrite(I2C_SWITCH_ADDRESS, txbuf,1);
    //i2cMasterTransmitTimeout(&I2CD1, I2C_SWITCH_ADDRESS, txbuf, 1, rxbuf, 0, tmo); // <TBD add status checking>

#endif
}

// TBD need to port two byte command
void OLED1306_command(uint8_t c){
    // I2CMessage thisMsg;
	// thisMsg.status = RDY_OK;
	txbuf[0] = 0; // Because that's how they designed the chip, that's why
    txbuf[1] = c;

    //thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 2, rxbuf, 0, tmo); // <TBD add status checking>
    i2CWrite(OLED_I2C_ADDR,txbuf,2);

    delay(1);
}

void OLED1306_SendInitSequence(){
    uint8_t vccstate = OLED_SSD1306_SWITCHCAPVCC; // hardcoded, conditional left in case external vcc support needs to be re-enabled
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

void OLEDInit(){

    InitFontQuarterMuncher();
    //palSetPadMode(GPIOC,5, PAL_MODE_OUTPUT_PUSHPULL);
    // TBD add Cartesian Byte array clear
    i2CBegin();

    for (int iDevice=0; iDevice<NUM_OLED_DISPLAYS; iDevice++)
    {
        OLEDBufferClear(iDevice, OLED_CHECKER_AA); // TBD this line is causing a timeout sync
        SetOLEDChan(iDevice);
        OLED1306_SendInitSequence();
        for (int iRow=0; iRow< NUM_TEXT_ROWS; iRow++) { OLEDUpdateMask[iDevice][iRow] = 1; }
    }
}

//------------------------------------------------------------------------------
void ConvertCartesianBufferToOLEDBuffer(uint8_t iDevice){
    uint8_t searchMask = 0b10000000;
    uint8_t writeMask  = 0b00000001;
    uint8_t invertedMask;
    uint32_t buffIndex;
    invertedMask = ~writeMask;

    int y=0;
    int x=0;
    int xOrigin = x;
    int yOrigin = y;

    writeMask  = 0b00000001;
    for (uint8_t iCartesianRow = 0; iCartesianRow < CARTESIAN_BYTE_ARRAY_NUM_ROWS; iCartesianRow++)

    {
        if (iCartesianRow == 0) {yOrigin=0;}
        if (iCartesianRow == 8) {yOrigin=8;}
        if (iCartesianRow == 16) {yOrigin=16;}
        if (iCartesianRow == 24) {yOrigin=24;}

        for( uint8_t iCartesianColumn=0; iCartesianColumn < CARTESIAN_BYTE_ARRAY_NUM_COLS; iCartesianColumn++)
        {
            invertedMask = ~writeMask;
            searchMask = 0b10000000;
            for (int bit=0; bit<8; bit++)
            {
                buffIndex = xOrigin+yOrigin*16+bit+8*iCartesianColumn;
                if (Cartesian_Byte_Array[iDevice][iCartesianRow][iCartesianColumn] & searchMask) { OLEDBuffer[iDevice][buffIndex] |= writeMask; }
                else                                                                             { OLEDBuffer[iDevice][buffIndex] &= invertedMask; }
                searchMask = searchMask >> 1;
            }
        }
        if (writeMask == 0b10000000) {writeMask = 0x01;} else {writeMask = writeMask << 1;}
    }
}

void OLEDWriteDisplayBuffer(uint8_t iDevice)
{
  //debugPulse(1,1);

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

    // (128 * 32)/8 == 4096/8 == 512
    for (uint16_t i=0; i<(OLED_SSD1306_LCDWIDTH*OLED_SSD1306_LCDHEIGHT/8); i+=I2C_DATA_BYTES_PER_XFER)
    {
        txbuf[0] = 0x40;

        for (int ix=0; ix < I2C_DATA_BYTES_PER_XFER; ix++)
        {
            txbuf[ix+1] = OLEDBuffer[iDevice][i+ix];
        }

        i2CWrite(OLED_I2C_ADDR, txbuf, I2C_DATA_BYTES_PER_XFER+1);

        delay(1);
    }
    //debugPulse(2,2);
}

void OLEDDisplay()
{
    //debugPulse(3,3);
    for( int i=0; i< NUM_OLED_DISPLAYS; i++)
    {
        SetOLEDChan(i);
        ConvertCartesianBufferToOLEDBuffer(i);
        //debugPulse(3,3);
        OLEDWriteDisplayBuffer(i);   // WIP, decreasing timing
                                // 84 ms,
                                // 51 ms,    doubled buffer to 16 bytes
                                // 31 ms,    doubled buffer to 32 bytes
                                // 27-35 ms, doubled buffer to 64 bytes
                                // 17-25 ms, removed 10 ms sleep
                                //  9-21 ms, removed 1ms sleep, might cause issues with audio
        //debugPulse(4,4);
    }
    //debugPulse(4,4);
}




uint16_t CharToIndex(char charval){
    // Determined by order of font_QuarterMuncher[index][img data]
    switch (charval)
    {
        case 'A': return 0; break;
        case 'B': return 1; break;
        case 'C': return 2; break;
        case 'D': return 3; break;
        case 'E': return 4; break;
        case 'F': return 5; break;
        case 'G': return 6; break;
        case 'H': return 7; break;
        case 'I': return 8; break;
        case 'J': return 9; break;
        case 'K': return 10; break;
        case 'L': return 11; break;
        case 'M': return 12; break;
        case 'N': return 13; break;
        case 'O': return 14; break;
        case 'P': return 15; break;
        case 'Q': return 16; break;
        case 'R': return 17; break;
        case 'S': return 18; break;
        case 'T': return 19; break;
        case 'U': return 20; break;
        case 'V': return 21; break;
        case 'W': return 22; break;
        case 'X': return 23; break;
        case 'Y': return 24; break;
        case 'Z': return 25; break;
        case 'a': return 26; break;
        case 'b': return 27; break;
        case 'c': return 28; break;
        case 'd': return 29; break;
        case 'e': return 30; break;
        case 'f': return 31; break;
        case 'g': return 32; break;
        case 'h': return 33; break;
        case 'i': return 34; break;
        case 'j': return 35; break;
        case 'k': return 36; break;
        case 'l': return 37; break;
        case 'm': return 38; break;
        case 'n': return 39; break;
        case 'o': return 40; break;
        case 'p': return 41; break;
        case 'q': return 42; break;
        case 'r': return 43; break;
        case 's': return 44; break;
        case 't': return 45; break;
        case 'u': return 46; break;
        case 'v': return 47; break;
        case 'w': return 48; break;
        case 'x': return 49; break;
        case 'y': return 50; break;
        case 'z': return 51; break;
        case '0': return 52; break;
        case '1': return 53; break;
        case '2': return 54; break;
        case '3': return 55; break;
        case '4': return 56; break;
        case '5': return 57; break;
        case '6': return 58; break;
        case '7': return 59; break;
        case '8': return 60; break;
        case '9': return 61; break;
        case '+': return 62; break;
        case '-': return 63; break;
        case '*': return 64; break;
        case '/': return 65; break;
        //case '÷': return 66; break;
        case '=': return 67; break;
        case '%': return 68; break;
        case '\"': return 69; break;
        case '\'': return 70; break;
        case '#': return 71; break;
        case '@': return 72; break;
        case '&': return 73; break;
        case '_': return 74; break;
        case '(': return 75; break;
        case ')': return 76; break;
        case ',': return 77; break;
        case '.': return 78; break;
        case ';': return 79; break;
        case ':': return 80; break;
        //case '¿': return 81; break;
        case '?': return 82; break;
        //case '¡': return 83; break;
        case '!': return 84; break;
        case '\\': return 85; break;
        case '|': return 86; break;
        case '{': return 87; break;
        case '}': return 88; break;
        case '<': return 89; break;
        case '>': return 90; break;
        case '[': return 91; break;
        case ']': return 92; break;
        //case 'μ': return 93; break;
        case '^': return 94; break;

        // TBD fix international character issues
        // case 'À': return 95; break;
        // case 'Á': return 96; break;
        // case 'Â': return 97; break;
        // case 'Ã': return 98; break;
        // case 'Ä': return 99; break;
        // case 'Å': return 100; break;
        // case 'Æ': return 101; break;
        // case 'ç': return 102; break;
        // case 'È': return 103; break;
        // case 'É': return 104; break;
        // case 'Ê': return 105; break;
        // case 'Ë': return 106; break;
        // case 'Ì': return 107; break;
        // case 'Í': return 108; break;
        // case 'Î': return 109; break;
        // case 'Ï': return 110; break;
        // case 'Ñ': return 112; break;
        // case 'Ò': return 113; break;
        // case 'Ó': return 114; break;
        // case 'Ô': return 115; break;
        // case 'Õ': return 116; break;
        // case 'Ö': return 117; break;
        // case 'Ø': return 118; break;
        // case 'Œ': return 119; break;
        // case 'Ù': return 120; break;
        // case 'Ú': return 121; break;
        // case 'Û': return 122; break;
        // case 'Ü': return 123; break;
        // case 'ß': return 124; break;
        case ' ': return 125; break;
        //case '': return ; break;

        default: return 0; break;
    }
}

void KludgeTest()
{

    // Cartesian_Byte_Array[0][ 0 ][ 0 ] = 0x00;
    // Cartesian_Byte_Array[0][ 1 ][ 0 ] = 0x00;
    // Cartesian_Byte_Array[0][ 2 ][ 0 ] = 0x00;
    // Cartesian_Byte_Array[0][ 3 ][ 0 ] = 0x00;
}

void ConvertCharToPixelFont(uint8_t iCol, uint8_t iRow, uint16_t index, uint8_t iDevice){
    uint8_t charOffset=index;
    uint8_t startY;

    //startX = iCol *16;
    startY = iRow *8;

    for (int iPixelY = 0; iPixelY < 8; iPixelY++)
    {
        Cartesian_Byte_Array[iDevice][ startY+iPixelY ][ iCol ] = font_QuarterMuncher[ charOffset ][ iPixelY ];
        //Cartesian_Byte_Array[iDevice][ startY+iPixelY ][ iCol ] = 0x00;
    }

}






void OLED_Print_Buff(uint16_t iDevice)
{

    uint16_t iText=0;
    uint8_t iBreak=0;
    for (uint8_t iRow=0; iRow<4; iRow++)
    {
        for (uint8_t iCol=0; iCol<16; iCol++)
        {
            ConvertCharToPixelFont( iCol, iRow, CharToIndex(OLEDTextBuff[iDevice][iText]), iDevice );

            if ( iText < NUM_OLED_CHARS - 1)
            {
                if ( OLEDTextBuff[iDevice][iText+1] == '\0' )
                {iBreak=1; break;}
            }
            iText++;
        }
        if (iBreak) break;
    }
}

void OLED_Print_ParamLeft(uint8_t iDevice){
    OLED_Print_Buff(iDevice);
}


void OLED_FontTest(uint8_t iDevice){
    uint8_t index=0;
    for (uint8_t iRow=0; iRow < 4; iRow++){
        for (uint8_t iCol=0; iCol < 16; iCol++){
            ConvertCharToPixelFont(iCol, iRow, index, iDevice);
            index++;
        }
    }
}

void setPixel(uint8_t x, uint8_t y, bool bPixelOn, uint8_t iOLED_Chan )
{
    uint8_t pixelMask = 0b10000000 >> (x%8);

    if (bPixelOn){ Cartesian_Byte_Array[iOLED_Chan][y][x/8] |= pixelMask; } else { Cartesian_Byte_Array[iOLED_Chan][y][x/8] &= ~pixelMask;}
}

// TBD convert to proper multi display
// void OLEDClearDisplay()
// {
//     memset(OLEDBuffer, 0, (OLED_SSD1306_LCDWIDTH*OLED_SSD1306_LCDHEIGHT/8));
// }




void OLEDDisplayInt(uint8_t iDevice, int32_t iVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
    char itoaBuff[16];
    //iRoot = iVal / 2097100; // keep magic reference for axo data crossover

    // TBD need more validation
    if      (iWidth == 9)  iWidth  = 16;
    else if (iWidth >  9)  iWidth  =  8;
    else if (iWidth <  4)  iWidth  =  4;

    char cFormatBuff[8] = "%+04ld"; // "4" will be replaced

    if (iWidth == 16){ // Full width
        cFormatBuff[3] = '1';
        cFormatBuff[4] = '6';
    }
    else {
        char cWidth[1];
        itoa(iWidth,cWidth, 10);
        cFormatBuff[3] = cWidth[0]; // replace with parameter iWidth
    }





    sprintf(itoaBuff,cFormatBuff, iVal);

    iBaseAddr += iRow*16;

    for (int i=0; i<iWidth; i++) { OLEDTextBuff[iDevice][iBaseAddr+i] = itoaBuff[i];  }

    OLED_Print_ParamLeft(iDevice);
}


void OLEDDisplayDouble(uint8_t iDevice, double dVal, uint8_t iDecimalPoints, uint8_t iRow, uint8_t iBaseAddr){
    char itoaBuff[16];
    //iRoot = iVal / 2097100; // keep magic reference for axo data crossover

    if      (iDecimalPoints >  3) iDecimalPoints =  3;
    else if (iDecimalPoints <  0) iDecimalPoints =  0;


    char cFormatBuff[16] = "%+8.3lf";
    char cWidth[1];

    itoa(iDecimalPoints,cWidth, 10);
    cFormatBuff[4] = cWidth[0];

    sprintf(itoaBuff,cFormatBuff, dVal);

    iBaseAddr += iRow*16;

    uint8_t iWidth = strlen(itoaBuff);

    for (int i=0; i<iWidth; i++) { OLEDTextBuff[iDevice][iBaseAddr+i] = itoaBuff[i];  }

    OLED_Print_ParamLeft(iDevice);
}

void OLEDDisplayString(uint8_t iDevice, char* strVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){

    //iRoot = iVal / 2097100; // keep magic reference for axo data crossover

    if      (iWidth >  16) iWidth =  16;
    else if (iWidth <  0) iWidth =  0;

    // TBD bug vector with line wrap

    //strVal.copy(itoaBuff, iWidth, 0);

    //for (int iLen=0; iLen < iWidth)

    iBaseAddr += iRow*16;

    iWidth = strlen(strVal);

    for (int i=0; i<iWidth; i++) { OLEDTextBuff[iDevice][iBaseAddr+i] = strVal[i];  }

    OLED_Print_ParamLeft(iDevice);
}


void testOLEDDisplayString()
{
    //OLEDDisplayString(uint8_t iDevice, std::string strVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
    char cBuff[16] = "peanuts";

    OLEDDisplayString(0, "I work for", 8, 0, 0);
    OLEDDisplayString(0, "Peanuts", 8, 1, 0);
    //OLEDDisplayString(0, "just like", 8, 2, 0);
    //OLEDDisplayString(0, "you", 8, 3, 0);
}

void testOLEDDisplay()
{
    //OLEDDisplayString(uint8_t iDevice, std::string strVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
    char cBuff[16] = "peanuts";
    //                   "                "
    OLEDDisplayString(0, "QuadOLEDBootTest", 8, 0, 0);
    OLEDDisplayString(0, "The quick brown ", 8, 1, 0);
    OLEDDisplayString(0, "fox jumped over ", 8, 2, 0);
    OLEDDisplayString(0, "the lazy dog 012", 8, 3, 0);

    OLEDDisplayString(1, "Although,frankly", 8, 0, 0);
    OLEDDisplayString(1, "it could be     ", 8, 1, 0);
    OLEDDisplayString(1, "argued that the ", 8, 2, 0);
    OLEDDisplayString(1, "story had bias. ", 8, 3, 0);

    OLEDDisplayString(2, "Is it noteworthy", 8, 0, 0);
    OLEDDisplayString(2, "to bypass doggo ", 8, 1, 0);
    OLEDDisplayString(2, "when pup is nap?", 8, 2, 0);
    OLEDDisplayString(2, "What is fox news", 8, 3, 0);

    OLEDDisplayString(3, "The forest is   ", 8, 0, 0);
    OLEDDisplayString(3, "too dangerous   ", 8, 1, 0);
    OLEDDisplayString(3, "for typesetters ", 8, 2, 0);
    OLEDDisplayString(3, "and engineers   ", 8, 3, 0);

    //OLEDDisplayString(0, "just like", 8, 2, 0);
    //OLEDDisplayString(0, "you", 8, 3, 0);
}


union float2bytes { float f; char b[sizeof(float)]; };

struct UARTCommand{
    uint8_t iCommandType;
    uint8_t iDisplayNum;
    uint8_t iLineNum;
    uint8_t iOffset;
    uint8_t iLength;
    char    cBuff[64];
    uint8_t iStrLength;
    int32_t i32Val;
    float2bytes f2b;
}uartCommand;

#define UART_WRITELINE    1
#define UART_WRITEINT     2
#define UART_WRITEFLOAT   3



void clearUARTCommand(){
    uartCommand.iCommandType = 0;
    uartCommand.iDisplayNum  = 0;
    uartCommand.iLineNum     = 0;
    uartCommand.iOffset      = 0;
    uartCommand.iLength      = 0;
    uartCommand.iStrLength   = 0;
    for (int i=0; i<64; i++) uartCommand.cBuff[i] ='\0';
    uartCommand.i32Val = 0;
    uartCommand.f2b.b[0] = 0;
    uartCommand.f2b.b[1] = 0;
    uartCommand.f2b.b[2] = 0;
    uartCommand.f2b.b[3] = 0;
}



void parseUARTByte(char cBuf){
    static uint8_t iState = 0;



    char cTempBuff[1];
    cTempBuff[0] = '\0';
    cTempBuff[1] = '\0';

    if (iState <= 2) {
        switch (iState){
            case 0:
                clearUARTCommand();
                if (cBuf == '{') iState = 1;
                break;

            case 1:
                if (cBuf == 'W') iState = 2;
                else iState = 0;
                break;

            case 2:
                switch (cBuf){
                    case 'L':
                        iState = 3;
                        uartCommand.iCommandType = UART_WRITELINE;
                        break;

                    case 'I':
                        iState = 3;
                        uartCommand.iCommandType = UART_WRITEINT;
                        break;

                    case 'F':
                        iState = 3;
                        uartCommand.iCommandType = UART_WRITEFLOAT;
                        break;

                    default:
                        iState = 0;
                        break;
                }
                break;

            default:
                iState = 0;
                break;
        }
    }
    else if (uartCommand.iCommandType == UART_WRITELINE){

        switch (iState) {
            case 3:
                if (cBuf == ',') iState = 4;
                break;

            case 4:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iDisplayNum = atoi(cTempBuff);
                    iState = 5;
                } else iState = 0;
                break;

            case 5:
                if (cBuf == ',') iState = 6;
                break;

            case 6:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iLineNum = atoi(cTempBuff);
                    iState = 7;
                } else iState = 0;
                break;

            case 7:
                if (cBuf == ',') iState = 8;
                break;

            case 8:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iOffset = atoi(cTempBuff);
                    iState = 9;
                } else iState = 0;
                break;

            case 9:
                if (cBuf == ',') iState = 10;
                break;

            case 10:
                if (cBuf == '\"') iState = 11;
                uartCommand.iStrLength   = 0;
                break;

            case 11:
                if (cBuf == '\"') {iState = 12;}
                else { uartCommand.cBuff[uartCommand.iStrLength++] = cBuf;}
                if (uartCommand.iStrLength > 16) iState = 0;
                break;


            case 12:
                if (cBuf == '}'){
                    //void OLEDDisplayString(uint8_t iDevice, char* strVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
                    OLEDDisplayString(uartCommand.iDisplayNum, uartCommand.cBuff, uartCommand.iStrLength, uartCommand.iLineNum, uartCommand.iOffset);
                    OLEDDisplay();
                    iState = 0;
                }
                break;

            default:
                iState = 0;
                break;
        }

    }
    else if (uartCommand.iCommandType == UART_WRITEINT){
        switch (iState) {
            case 3:
                if (cBuf == ',') iState = 4;
                break;

            case 4:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iDisplayNum = atoi(cTempBuff);
                    iState = 5;
                } else iState = 0;
                break;

            case 5:
                if (cBuf == ',') iState = 6;
                break;

            case 6:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iLineNum = atoi(cTempBuff);
                    iState = 7;
                } else iState = 0;
                break;

            case 7:
                if (cBuf == ',') iState = 8;
                break;

            case 8:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iOffset = atoi(cTempBuff);
                    iState = 9;
                } else iState = 0;
                break;

            case 9:
                if (cBuf == ',') iState = 10;
                break;

            case 10:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iLength = atoi(cTempBuff);
                    iState = 11;
                } else iState = 0;
                break;

            case 11:
                if (cBuf == ',') iState = 12; else iState = 0;
                break;

            case 12:
                uartCommand.i32Val  = 0xFF000000 & (cBuf << 24);
                iState++;
                break;

            case 13:
                uartCommand.i32Val += 0x00FF0000 & (cBuf << 16);
                iState++;
                break;

            case 14:
                uartCommand.i32Val += 0x0000FF00 & (cBuf <<  8);
                //uartCommand.i32Val = 1; //0x0000FF00 & (cBuf <<  8);
                iState++;
                break;

            case 15:
                uartCommand.i32Val += 0x000000FF & (cBuf      );
                iState++;
                break;

            case 16:
                if (cBuf == '}'){
                    //void OLEDDisplayInt(uint8_t iDevice, int32_t iVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
                    OLEDDisplayInt(uartCommand.iDisplayNum, uartCommand.i32Val, uartCommand.iLength, uartCommand.iLineNum, uartCommand.iOffset);
                    OLEDDisplay();
                }
                iState = 0;
                break;

            default:
                iState = 0;
                break;
        }


    }

    else if (uartCommand.iCommandType == UART_WRITEFLOAT){
        float2bytes f2b;
        switch (iState) {
            case 3:
                if (cBuf == ',') iState = 4;
                break;

            case 4:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iDisplayNum = atoi(cTempBuff);
                    iState = 5;
                } else iState = 0;
                break;

            case 5:
                if (cBuf == ',') iState = 6;
                break;

            case 6:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iLineNum = atoi(cTempBuff);
                    iState = 7;
                } else iState = 0;
                break;

            case 7:
                if (cBuf == ',') iState = 8;
                break;

            case 8:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iOffset = atoi(cTempBuff);
                    iState = 9;
                } else iState = 0;
                break;

            case 9:
                if (cBuf == ',') iState = 10;
                break;

            case 10:
                if (cBuf >= '0' && cBuf <= '9'){
                    cTempBuff[0] = cBuf;
                    uartCommand.iLength = atoi(cTempBuff);
                    iState = 11;
                } else iState = 0;
                break;

            case 11:
                if (cBuf == ',') iState = 12; else iState = 0;
                break;

            case 12:
                uartCommand.f2b.b[0] = cBuf;
                iState++;
                break;

            case 13:
                uartCommand.f2b.b[1] = cBuf;
                iState++;
                break;

            case 14:
                uartCommand.f2b.b[2] = cBuf;
                //uartCommand.i32Val = 1; //0x0000FF00 & (cBuf <<  8);
                iState++;
                break;

            case 15:
                uartCommand.f2b.b[3] = cBuf;
                iState++;
                break;

            case 16:
                if (cBuf == '}'){
                    // float fFake = -18.223;
                    // float2bytes f2bTest;
                    // f2bTest.f = fFake;
                    //
                    // uartCommand.f2b.b[0] = f2bTest.b[0];
                    // uartCommand.f2b.b[1] = f2bTest.b[1];
                    // uartCommand.f2b.b[2] = f2bTest.b[2];
                    // uartCommand.f2b.b[3] = f2bTest.b[3];

                    sprintf(uartCommand.cBuff, "%+08.3f", uartCommand.f2b.f);
                    //sprintf(uartCommand.cBuff, "%+08.3f", uartCommand.i32Val);
                    //OLEDDisplayString(uartCommand.iDisplayNum, uartCommand.cBuff, uartCommand.iStrLength, uartCommand.iLineNum, uartCommand.iOffset);
                    OLEDDisplayString(uartCommand.iDisplayNum, uartCommand.cBuff, 8, uartCommand.iLineNum, uartCommand.iOffset);


                    //void OLEDDisplayInt(uint8_t iDevice, int32_t iVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
                    //OLEDDisplayInt(uartCommand.iDisplayNum, uartCommand.i32Val, uartCommand.iLength, uartCommand.iLineNum, uartCommand.iOffset);
                    OLEDDisplay();
                }
                iState = 0;
                break;

            default:
                iState = 0;
                break;
        }
    }


#if 0 // debug
    static int iCount = 0;
    //void OLEDDisplayInt(uint8_t iDevice, int32_t iVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr){
    OLEDDisplayInt(0, iCount++, 4, 0, 0);
    OLEDDisplayInt(0,   iState, 4, 1, 0);
    cTempBuff[0] = cBuf;
    static int iOffset = 0; if (iState == 0) iOffset = 0;
    OLEDDisplayString(0,  cTempBuff, 4, 2, iOffset++);
    OLEDDisplay();
#endif


}

void parseByte(char cBuf)
{
    static int iPosition=0;
    char cTempBuff[1];
    cTempBuff[1] = '\0';
    cTempBuff[0] = cBuf;
    OLEDDisplayString(0, cTempBuff, 8, 0, iPosition++);
    OLEDDisplay();
}

void testOLEDDisplayDouble(){
    double dCycle[4] = {0.0, 999.999, 42.0, -999999};

    while (1){

        dCycle[0] += 0.001;
        dCycle[1] -= 0.001;
        dCycle[2] += 0.273543213221;
        dCycle[3] += 1.0 + dCycle[0];

        OLEDDisplayDouble(0,dCycle[0], 3, 0, 0);
        OLEDDisplayDouble(0,dCycle[1], 3, 0, 8);
        OLEDDisplayDouble(0,dCycle[2], 3, 2, 0);
        OLEDDisplayDouble(0,dCycle[3], 3, 3, 8);

        OLEDDisplay();

    }
}



void OLED_Sandbox(){

    testOLEDDisplay();

    //testOLEDDisplayString();
    //OLEDDisplayDouble(uint8_t iDevice, double dVal, uint8_t iDecimalPoints, uint8_t iRow, uint8_t iBaseAddr){


    //testOLEDDisplayDouble(); // Infinite loop

    //OLEDDisplayDouble(0,-2.48753     , 0, 1, 0);



    //OLEDDisplayInt8(uint8_t iDevice, int8_t iVal, uint8_t iWidth, uint8_t iRow, uint8_t iBaseAddr)
    //OLEDDisplayInt(0, -64, 5, 1, 2);
    //OLEDDisplayInt(0,  16, 6, 3, 3);

    //OLEDDisplayInt(0,  32568, 8, 2, 7);
    //KludgeTest();
    //strcpy(OLEDTextBuff, "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz");
    //OLED_FontTest(0);

    //setPixel(10,10, 1, 0);
    //setPixel(20,20, 1, 0);
    //setPixel(30,30, 1, 0);


    //strcpy(&OLEDTextBuff[0][0], "Attack");
    //OLEDTextBuff[0][0] = 'A';
    //OLEDTextBuff[0][1] = '\0';
    //OLED_Print_ParamLeft(0);
    // strcpy(OLEDTextBuff[0], "Decay");
    // OLED_Print_ParamRight(0);

    //
    // strcpy(OLEDTextBuff[1], "Sustain");
    // OLED_Print_ParamLeft(1);
    // strcpy(OLEDTextBuff[1], "Release");
    // OLED_Print_ParamRight(1);
    //
    // strcpy(OLEDTextBuff[2], "Mod1");
    // OLED_Print_ParamLeft(2);
    // strcpy(OLEDTextBuff[2], "Mod2");
    // OLED_Print_ParamRight(2);
    //
    // strcpy(OLEDTextBuff[3], "Pitch");
    // OLED_Print_ParamLeft(3);
    // strcpy(OLEDTextBuff[3], "Volume");
    // OLED_Print_ParamRight(3);
    // // OLED_FontTest();
}






//
//







//


// rename
// void OLEDDisplayBipolar(uint8_t iDevice, int32_t iVal, uint8_t iRow, uint8_t iBaseAddr)
// void OLEDDisplayInt32(uint8_t iDevice, int32_t iVal, uint8_t iRow, uint8_t iBaseAddr)



//
// void OLEDDisplayIntAt(uint8_t iDevice, int32_t iVal, uint8_t iRow, uint8_t iBaseAddr, uint8_t iStrLen)
// {
//     char itoaBuff[16];
//     char cFormat[8];
//     char cMetaFormat[8];
//
//     strcpy (cFormat, "%+0");
//     sprintf(cMetaFormat, "%d", iStrLen); // Creates the format string
//     strcat (cFormat, cMetaFormat);
//     strcat (cFormat, "d");
//
//     //sprintf(itoaBuff, "%03d", iVal);
//     sprintf(itoaBuff, cFormat, iVal);
//
//     iBaseAddr += iRow*16;
//
//     for (int i=0; i<iStrLen; i++) { OLEDTextBuff[iDevice][iBaseAddr+i] = itoaBuff[i];  }
//
//     OLED_Print_ParamLeft(iDevice);
//
//     OLEDDisplayCartesianBuffer(iDevice);
// }
//
//
// void OLEDCountUp()
// {
//     static int iCount=0;
//
//     uint8_t iDevice = 0;
//     uint8_t iRow    = 0;
//     uint8_t iCol    = 4;
//     uint8_t iStrLen = 8;
//
//     uint8_t iCharacteristicLen = 3;
//     uint8_t iMantissaLen       = 3;
//
//     //OLEDDisplayFloatAt(iDevice, iCount, iRow, iCol, iCharacteristicLen, iMantissaLen); broken
//
//     OLEDDisplayIntAt(iDevice, iCount, iRow, iCol, iStrLen);
//
//     //OLEDDisplayIntAt(iDevice, i1, iRow, iCol, iStrLen);
//
//
//     if (++iCount >=5999){ iCount = 0; }
// }
//
//
// #define BIPOLAR_IN_USER 0
// #define BIPOLAR_IN_KNOB 1
// #define BIPOLAR_IN_JOYS 2
//
//
// void OLEDClearRow(uint8_t iDevice, uint8_t iRow)
// {
//
//
//     for (uint8_t iChar=0; iChar<16; iChar++ )
//     {
//         uint8_t iOffset = (iRow * 16) + iChar;
//         OLEDTextBuff[iDevice][iOffset] = ' ';
//     }
//     OLED_Print_ParamLeft(iDevice);
//     OLEDDisplayCartesianBuffer(iDevice);
// }
//
//
//
// uint8_t _OLEDBipolarRow=0;
// void OLEDDisplayBipolarRow(uint8_t iRow, uint8_t iSource)
// {
//
//
//     // if the row is different, reset the mask on the old row
//     if (_OLEDBipolarRow != iRow)
//     {
//         for (int iDisplay=0; iDisplay<NUM_OLED_DISPLAYS; iDisplay++) { OLEDUpdateMask[iDisplay][_OLEDBipolarRow] = 1; }
//     }
//     _OLEDBipolarRow = iRow;
//
//     if (bBipolarDisplayEnable)
//     {
//         for (int iDisplay=0; iDisplay<NUM_OLED_DISPLAYS; iDisplay++)
//         {
//             // Converted to for loop for smaller compiled footprint
//             //OLEDClearRow(iDisplay, iRow);
//             if (OLEDUpdateMask[iDisplay][iRow]) { OLEDClearRow(iDisplay, iRow); }
//             OLEDUpdateMask[iDisplay][iRow] = 0;
//             for (int i=0; i<2; i++) { OLEDDisplayBipolar(iDisplay, inBP[iSource][iDisplay*2+i  ], iRow,  i*10); }
//             //OLEDDisplayBipolar(iDisplay, inBP[iSource][iDisplay*2  ], iRow,  0);
//             //OLEDDisplayBipolar(iDisplay, inBP[iSource][iDisplay*2+1], iRow, 10);
//         }
//     }
//     else
//     {
//         for (int iDisplay=0; iDisplay<NUM_OLED_DISPLAYS; iDisplay++) { OLEDUpdateMask[iDisplay][iRow] = 1; }
//     }
//
// }
//
//
//
//
// void OLEDTestBipolarDisplay()
// {
//     for (int i=0; i<NUM_OLED_DISPLAYS; i++)
//     {
//         OLEDDisplayBipolar(i, inBP[BIPOLAR_IN_USER][i*2  ], 3,  0);
//         OLEDDisplayBipolar(i, inBP[BIPOLAR_IN_USER][i*2+1], 3, 10);
//     }
// }
//
//

//
// uint8_t min(uint8_t a, uint8_t b)
// {
//     if (a > b) return b;
//     else return a;
// }
//
// void pad16(char strPad[])
// {
//     int iPad0 =0;
//     for (int i=0; i< 16; i++)
//     {
//         if (strPad[i] == '\0')
//         {iPad0=1;}
//
//         if (iPad0)
//             strPad[i] = ' ';
//     }
// }
//

//
// void OLEDMemDebug()
// {
//     for (int i=0; i < 4; i++)
//     {
//         for (int y=0; y < 512; y++)
//         {
//             OLEDBuffer[i][y] = 0;
//         }
//     }
//     OLEDBuffer[0][0] = 0xFF;
//     OLEDBuffer[0][128] = 0xFF;
//
// }
//
// void OLED_checkerboardTest()
// {
//     static int iParity=0;
//     //strcpy(OLEDTextBuff, "BAR");
//     //uint8_t iLen=0;
//
//     for (int iDevice = 0; iDevice < NUM_OLED_DISPLAYS; iDevice++)
//     {
//         int iOffset=0;
//         for(int iRow = 0; iRow < NUM_TEXT_ROWS; iRow++ )
//         {
//             pad16(OLEDTxt[iDevice][iRow]);
//             if (iParity == 0) { strncpy(&OLEDTextBuff[iDevice][0+iOffset],  "AAAA5555AAAA5555", 16); }
//             else              { strncpy(&OLEDTextBuff[iDevice][0+iOffset],  "5555AAAA5555AAAA", 16); }
//             iOffset+=16;
//         }
//         OLED_Print_ParamLeft(iDevice);
//     }
//     if (iParity == 0) {iParity = 1;} else {iParity = 0;}
// }
//
//
//





//------------------------------------------------------------------------------
// Maybe keep
//
// void OLED_FontTest()
// {
//     for (uint8_t iChan=0; iChan<4; iChan++)
//     {
//         SetOLEDChan(iChan);
//         OLED_FontTest(iChan);
//     }
// }
//
//
// void debugPulse(int iNumPulses, int delay)
// {
//     for (int i=0; i<iNumPulses; i++)
//     {
//         palWritePad(GPIOC,5, 1);
//         chThdSleepMilliseconds(delay);
//         palWritePad(GPIOC,5, 0);
//         chThdSleepMilliseconds(delay);
//     }
// }
//
//
// void OLEDSetAddrRange(uint8_t iStartAddr, uint8_t iEndAddr, uint8_t iStartPage, uint8_t iEndPage)
// {
//     OLED1306_command(OLED_SSD1306_COLUMNADDR);
//     OLED1306_command(iStartAddr);   // Column start address (0 = reset)
//     OLED1306_command(iEndAddr-1);   // Column end address (127 = reset)
//
//
//     OLED1306_command(OLED_SSD1306_PAGEADDR);
//     OLED1306_command(iStartPage); // Page start address (0 = reset)
//     OLED1306_command(iEndPage);  // Page end address
//
// // Leave for future robustness -------------------------------------------------
// /*
//     #if OLED_SSD1306_LCDHEIGHT == 64
//       OLED1306_command(7); // Page end address
//     #endif
//     #if OLED_SSD1306_LCDHEIGHT == 32
//       OLED1306_command(3); // Page end address
//     #endif
//     #if OLED_SSD1306_LCDHEIGHT == 16
//       OLED1306_command(1); // Page end address
//     #endif
// */
// }
//

// void OLEDDisplayProto()
// {
//     uint8_t iCol = 0;
//     uint8_t iRow = 0;
//     uint8_t iNumChars = 16;
//
//
//     OLEDSetAddrRange(iCol*8, iCol*8+8*iNumChars, iRow, iRow+1);
//     //OLEDSetAddrRange(0, OLED_SSD1306_LCDWIDTH, 0, 3);
//
//     I2CMessage thisMsg;
//
//     uint8_t ui8BytesPerXfer = 8*iNumChars;
//
//     //                         (128 * 32)/8 == 4096/8 == 512
//     //for (uint16_t i=0; i<(OLED_SSD1306_LCDWIDTH*OLED_SSD1306_LCDHEIGHT/8); i+=ui8BytesPerXfer)
//     for (uint16_t i=0; i< 8; i += ui8BytesPerXfer)
//     {
//       txbuf[0] = 0x40;
//
//       for (int ix=0; ix < ui8BytesPerXfer; ix++)
//       {
//           txbuf[ix+1] = 0xff;//OLEDBuffer[iDevice][i+ix];
//       }
//
//       thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, ui8BytesPerXfer+1, rxbuf, 0, tmo); // <TBD add status checking>
//
//       //chThdSleepMilliseconds(1);
//     }
// }
//
// void OLEDDisplayDebug()
// {
//     for (int iDevice = 0; iDevice < 4; iDevice++)
//     {
//         SetOLEDChan(iDevice);
//     debugPulse(2,2);
//         OLEDDisplayProto();
//     debugPulse(3,3);
//     }
//     //ConvertCartesianBufferToOLEDBuffer(iDevice);
// }
//

//
//
// char * reverse(char * str)
// {
//     int iStrLen = strlen(str);
//     char cTemp;
//
//     for (int i=0; i< iStrLen; i++)
//     {
//         cTemp  = str[i];
//         str[i] = str[iStrLen - i - 1];
//                  str[iStrLen - i - 1] = 0;
//     }
//
// }
//
// // Implementation of itoa()
// char* itoa(int num, char* str, int base)
// {
//     int i = 0;
//     bool isNegative = false;
//
//     /* Handle 0 explicitely, otherwise empty string is printed for 0 */
//     if (num == 0)
//     {
//         str[i++] = '0';
//         str[i] = '\0';
//         return str;
//     }
//
//     // In standard itoa(), negative numbers are handled only with
//     // base 10. Otherwise numbers are considered unsigned.
//     if (num < 0 && base == 10)
//     {
//         isNegative = true;
//         num = -num;
//     }
//
//     // Process individual digits
//     while (num != 0)
//     {
//         int rem = num % base;
//         str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
//         num = num/base;
//     }
//
//     // If number is negative, append '-'
//     if (isNegative)
//         str[i++] = '-';
//
//     str[i] = '\0'; // Append string terminator
//
//     // Reverse the string
//     //reverse(str);
//
//     return str;
// }















//------------------------------------------------------------------------------
// Cutting room floor
// TBD Not very useful
// void OLED_Print_ParamRight(uint8_t iDevice){
//     uint8_t iStrLen = strlen(OLEDTextBuff[iDevice]);
//     iStrLen--;
//     uint8_t iText=0;
//     uint8_t iBreak=0;
//     for (uint8_t iRow=3; iRow>=0; iRow--)
//     {
//         for (uint8_t iCol=15; iCol>=0; iCol--)
//         {
//             ConvertCharToPixelFont( iCol, iRow, CharToIndex(OLEDTextBuff[iDevice][iStrLen - iText]), iDevice );
//
//             if ( iText < NUM_OLED_CHARS - 1) { if ( OLEDTextBuff[iDevice][iText+1] == '\0' ) { iBreak=1; break; } }
//             iText++;
//         }
//         if (iBreak) break;
//     }
// }


// void OLED_setstring()
// {
//
//     //strcpy(OLEDTextBuff, "BAR");
//     //uint8_t iLen=0;
//
//     for (int iDevice = 0; iDevice < NUM_OLED_DISPLAYS; iDevice++)
//     {
//         int iOffset=0;
//         for(int iRow = 0; iRow < NUM_TEXT_ROWS; iRow++ )
//         {
//             if ( OLEDUpdateMask[iDevice][iRow] )
//             {
//                 pad16(OLEDTxt[iDevice][iRow]);
//                 strncpy(&OLEDTextBuff[iDevice][0+iOffset],  OLEDTxt[iDevice][iRow], 16);
//             }
//             iOffset+=16;
//         }
//         OLED_Print_ParamLeft(iDevice);
//     }
// }
