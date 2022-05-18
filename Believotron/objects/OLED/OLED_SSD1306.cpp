/*********************************************************************
    Library: OLED_SSD1306.cpp
    Description:
        This is a lightweight port of the Adafruit SSD1306 library,
        designed to run on the Axoloti platform.

        Design focus is on small code footprint and limited, local dependencies

    Herstory:
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

Written by Limor Fried/Ladyada  for Adafruit Industries.
BSD license, check license.txt for more information
All text above, and the splash screen below must be included in any redistribution
*********************************************************************/

// Address of 0x3C when viewing 7 bit address, and 0x78 when in 8bit viewing

#include "font_QuarterMuncher.h"

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


struct OLED_Struct
{
    int8_t _i2caddr, _vccstate; // vccstate is depricated. Remove during refactor
};

OLED_Struct OLED0;


#define OLED_BUFF_SIZE 512 // (LCD height 32 * LCD Width 128 )/8 == 32*128/8 = 512 // Each byte contains a single pixel
#define CARTESIAN_BYTE_ARRAY_NUM_COLS 16 // 128 bits / 8 bits per byte
#define CARTESIAN_BYTE_ARRAY_NUM_ROWS 32 // 32 rows of 16 bytes


/*
// Contains default Adafruit splash logo, as per license
uint8_t OLEDBuffer[OLED_BUFF_SIZE] =
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
}; */

#define NUM_OLED_DISPLAYS 4
#define NUM_TEXT_ROWS 4
uint8_t OLEDBuffer[NUM_OLED_DISPLAYS][OLED_BUFF_SIZE];

uint8_t Cartesian_Byte_Array[NUM_OLED_DISPLAYS][CARTESIAN_BYTE_ARRAY_NUM_ROWS][CARTESIAN_BYTE_ARRAY_NUM_COLS];

uint8_t Cartesian_Byte_Array_Checkerboard[CARTESIAN_BYTE_ARRAY_NUM_ROWS][CARTESIAN_BYTE_ARRAY_NUM_COLS] =
{
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

void setPixel(uint8_t x, uint8_t y, bool bPixelOn, uint8_t iOLED_Chan )
{
    uint8_t pixelMask = 0b10000000 >> (x%8);

    if (bPixelOn){ Cartesian_Byte_Array[iOLED_Chan][y][x/8] |= pixelMask; } else { Cartesian_Byte_Array[iOLED_Chan][y][x/8] &= ~pixelMask;}
}

/*{
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






void ConvertCartesianBufferToOLEDBuffer(uint8_t iDevice)
{
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
                    if (Cartesian_Byte_Array[iDevice][iCartesianRow][iCartesianColumn] & searchMask) { OLEDBuffer[iDevice][buffIndex] |= writeMask; } else { OLEDBuffer[iDevice][buffIndex] &= invertedMask; }
                    searchMask = searchMask >> 1;
                }
            }
            if (writeMask == 0b10000000) {writeMask = 0x01;} else {writeMask = writeMask << 1;}
        }
}

/*
void SetOLEDChar(uint8_t x, uint8_t y, uint8_t setChar)
{
    uint8_t charOffset=0;
    uint8_t startX, startY;

// TBD, nice double code you got there
    if      (charOffset == 'A') charOffset = 0;
    else if (charOffset == 'B') charOffset = 1;
    else                        charOffset = 3;

    switch( setChar )
    {
        case 'A':
            charOffset = 0;
            break;
        case 'B':
            charOffset = 1;
        default:
            charOffset = 1;
            break;
    }

    startX = x *16;
    startY = y *4;

    for (int iPixelY = 0; iPixelY < 8; iPixelY++)
    {
        Cartesian_Byte_Array[][ startY+iPixelY ][ x ] = font_QuarterMuncher[ charOffset ][ iPixelY ];
    }
}
*/

void SetOLEDCharIndex(uint8_t x, uint8_t y, uint16_t index, uint8_t iDevice)
{
    uint8_t charOffset=index;
    uint8_t startX, startY;

    startX = x *16;
    startY = y *8;

    for (int iPixelY = 0; iPixelY < 8; iPixelY++)
    {
        Cartesian_Byte_Array[iDevice][ startY+iPixelY ][ x ] = font_QuarterMuncher[ charOffset ][ iPixelY ];
    }
}

#define I2C_SWITCH_ADDRESS 0b1110000
void SetOLEDChan(uint8_t iChan)
{
    if (iChan > 3) return;

    txbuf[0] = 0x01 << iChan;

    i2cMasterTransmitTimeout(&I2CD1, I2C_SWITCH_ADDRESS, txbuf, 1, rxbuf, 0, tmo); // <TBD add status checking>
    chThdSleepMilliseconds(1);
}


uint16_t CharToIndex(char charval)
{
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


#define NUM_OLED_CHARS 64
char OLEDTextBuff[NUM_OLED_CHARS];
void OLED_Print_Buff(uint8_t iDevice)
{

    uint8_t iText=0;
    uint8_t iBreak=0;
    for (uint8_t iRow=0; iRow<4; iRow++)
    {
        for (uint8_t iCol=0; iCol<16; iCol++)
        {
            SetOLEDCharIndex( iCol, iRow, CharToIndex(OLEDTextBuff[iText]), iDevice );

            if ( iText < NUM_OLED_CHARS - 1)
            {
                if ( OLEDTextBuff[iText+1] == '\0' )
                {iBreak=1; break;}
            }
            iText++;
        }
        if (iBreak) break;
    }
}


void OLED_Print_ParamLeft(uint8_t iDevice)
{
    OLED_Print_Buff(iDevice);
}


void OLED_Print_ParamRight(uint8_t iChan)
{
    uint8_t iStrLen = strlen(OLEDTextBuff);
    iStrLen--;
    uint8_t iText=0;
    uint8_t iBreak=0;
    for (uint8_t iRow=3; iRow>=0; iRow--)
    {
        for (uint8_t iCol=15; iCol>=0; iCol--)
        {
            SetOLEDCharIndex( iCol, iRow, CharToIndex(OLEDTextBuff[iStrLen - iText]), iChan );

            if ( iText < NUM_OLED_CHARS - 1) { if ( OLEDTextBuff[iText+1] == '\0' ) { iBreak=1; break; } }
            iText++;
        }
        if (iBreak) break;
    }
}


void OLED_Print_ValLeft(double dVal, uint8_t iDevice)
{
    // convert number to characters
    //uint8_t iRadix = round(dVal,1);
    // TBD need a method that can compile on this chip



    // position characters
    uint8_t iText=0;

    for (uint8_t iCol=0; iCol<16; iCol++)
    {
        SetOLEDCharIndex( iCol, 1, CharToIndex(OLEDTextBuff[iText]), iDevice );

        if ( iText < NUM_OLED_CHARS - 1) { if ( OLEDTextBuff[iText+1] == '\0' ) { break; } }
        iText++;
    }
}


void OLED_FontTest(uint8_t iDevice)
{
    uint8_t index=0;
    for (uint8_t iRow=0; iRow < 4; iRow++)
    {
        for (uint8_t iCol=0; iCol < 16; iCol++)
        {
            SetOLEDCharIndex(iCol, iRow, index, iDevice);
            index++;
        }
    }
}

void OLED_FontTest()
{
    for (uint8_t iChan=0; iChan<4; iChan++)
    {
        SetOLEDChan(iChan);
        OLED_FontTest(iChan);
    }
}

struct I2CMessage
{
	msg_t status;
	uint32_t result;
};


void OLEDClearDisplay()
{
    memset(OLEDBuffer, 0, (OLED_SSD1306_LCDWIDTH*OLED_SSD1306_LCDHEIGHT/8));
}

void OLED1306_command(uint8_t c)
{
    I2CMessage thisMsg;
	thisMsg.status = RDY_OK;
	txbuf[0] = 0;
    txbuf[1] = c;

	//thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 0, rxbuf, 0, tmo); // <TBD add status checking>
    thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, 2, rxbuf, 0, tmo); // <TBD add status checking>
    chThdSleepMilliseconds(1);
	//return(thisMsg);
}


void OLEDInit()
{
    // TBD add Cartesian Byte array clear
    for (int iDevice=0; iDevice<4; iDevice++)
    {
        OLEDBufferClear(iDevice); // TBD this line is causing a timeout sync
        SetOLEDChan(iDevice);
        OLEDInitCMD( iDevice,OLED_SSD1306_SWITCHCAPVCC,0x3C, FALSE );
    }
}

void OLEDBufferClear(uint8_t iDevice)
{
    //for (int iWord=0; iWord< OLED_BUFF_SIZE; iWord++)
    //{
        //OLEDBuffer[iDevice][iWord] = 0x00;
    //}

    for (int iRow=0; iRow< CARTESIAN_BYTE_ARRAY_NUM_ROWS; iRow++)
    {
        for(int iCol=0; iCol< CARTESIAN_BYTE_ARRAY_NUM_COLS; iCol++)
        {
            Cartesian_Byte_Array[iDevice][iRow][iCol] = 0x00;
        }
    }
}

void OLEDInitCMD(uint8_t iChan, uint8_t vccstate, uint8_t iI2CAddr, bool reset)
{
    OLED0._i2caddr = iI2CAddr;
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




void OLEDDisplayBuffer(uint8_t iDevice)
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

    chThdSleepMilliseconds(10);
    // I2C
    I2CMessage thisMsg;
    #define I2C_BYTES_PER_XFER 8
    for (uint16_t i=0; i<(OLED_SSD1306_LCDWIDTH*OLED_SSD1306_LCDHEIGHT/8); i+=I2C_BYTES_PER_XFER)
    {
      txbuf[0] = 0x40;

      for (int ix=0; ix < I2C_BYTES_PER_XFER; ix++)
      {
          txbuf[ix+1] = OLEDBuffer[iDevice][i+ix];
      }

      thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, I2C_BYTES_PER_XFER+1, rxbuf, 0, tmo); // <TBD add status checking>
      chThdSleepMilliseconds(1);
    }

    #ifdef TWBR
        TWBR = twbrbackup;
    #endif

}

void OLEDDisplay()
{
    for( int i=0; i< 4; i++)
    {
        SetOLEDChan(i);
        ConvertCartesianBufferToOLEDBuffer(i);
        OLEDDisplayBuffer(i);
    }
}

uint8_t min(uint8_t a, uint8_t b)
{
    if (a > b) return b;
    else return a;
}

void pad16(char strPad[])
{
    int iPad0 =0;
    for (int i=0; i< 16; i++)
    {
        if (strPad[i] == '\0')
        {iPad0=1;}

        if (iPad0)
            strPad[i] = ' ';
    }
}

void OLED_setstring()
{
    //strcpy(OLEDTextBuff, "BAR");
    //uint8_t iLen=0;
    for (int iDevice = 0; iDevice < NUM_OLED_DISPLAYS; iDevice++)
    {
        int iOffset=0;
        for(int iRow = 0; iRow < NUM_TEXT_ROWS; iRow++ )
        {
            pad16(OLEDTxt[iDevice][iRow]);
            strncpy(&OLEDTextBuff[0+iOffset],  OLEDTxt[iDevice][iRow], 16);
            iOffset+=16;
        }
        OLED_Print_ParamLeft(iDevice);
    }

/*
    pad16(OLEDTxt[0][0]);
    strncpy(&OLEDTextBuff[0],  OLEDTxt[0][0], 16);

    pad16(OLEDTxt[0][1]);
    strncpy(&OLEDTextBuff[16], OLEDTxt[0][1], 16);

    pad16(OLEDTxt[0][2]);
    strncpy(&OLEDTextBuff[32], OLEDTxt[0][2], 16);

    pad16(OLEDTxt[0][3]);
    strncpy(&OLEDTextBuff[48], OLEDTxt[0][3], 16);
    OLED_Print_ParamLeft(0);

    strncpy(&OLEDTextBuff[0],  OLEDTxt[1][0], 16);
    //strncpy(&OLEDTextBuff[16], OLEDTxt[0][1], 16);
    //strncpy(&OLEDTextBuff[32], OLEDTxt[0][2], 16);
    //strncpy(&OLEDTextBuff[48], OLEDTxt[0][3], 16);
    OLED_Print_ParamLeft(1);
*/


}

void OLED_Sandbox()
{
    //strcpy(OLEDTextBuff, "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz");
    strcpy(OLEDTextBuff, "Attack");
    OLED_Print_ParamLeft(0);
    strcpy(OLEDTextBuff, "Decay");
    OLED_Print_ParamRight(0);
    //OLED_Print_ValLeft(100.00, 0);

    strcpy(OLEDTextBuff, "Sustain");
    OLED_Print_ParamLeft(1);
    strcpy(OLEDTextBuff, "Release");
    OLED_Print_ParamRight(1);

    strcpy(OLEDTextBuff, "Mod1");
    OLED_Print_ParamLeft(2);
    strcpy(OLEDTextBuff, "Mod2");
    OLED_Print_ParamRight(2);

    strcpy(OLEDTextBuff, "Pitch");
    OLED_Print_ParamLeft(3);
    strcpy(OLEDTextBuff, "Volume");
    OLED_Print_ParamRight(3);
    //OLED_FontTest();
}
