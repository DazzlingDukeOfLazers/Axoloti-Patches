/*********************************************************************
    Library: OLED_SSD1306.h
    Description:
        This is a lightweight port of the Adafruit SSD1306 library,
        designed to run on the Axoloti platform.

        Design focus is on small code footprint and limited, local dependencies

    Herstory:
        2018-03-26 Porting to STM32 Blue Pill
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

Written by Limor Fried/Ladyada  for Adafruit Industries.
BSD license, check license.txt for more information
All text above, and the splash screen below must be included in any redistribution
*********************************************************************/

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


#include <stdint.h>
//#include "Arduino.h"

// Address of 0x3C when viewing 7 bit address, and 0x78 when in 8bit viewing



/*Comments*/
#ifndef OLED_SSD1306_H_
#define OLED_SSD1306_H_

    #define OLED_I2C_ADDR                    0x3C

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


    #define OLED_BUFF_SIZE 512 // (LCD height 32 * LCD Width 128 )/8 == 32*128/8 = 512 // Each byte contains a single pixel
    #define CARTESIAN_BYTE_ARRAY_NUM_COLS 16 // 128 bits / 8 bits per byte
    #define CARTESIAN_BYTE_ARRAY_NUM_ROWS 32 // 32 rows of 16 bytes

    #define NUM_OLED_DISPLAYS 1
    #define NUM_TEXT_ROWS 4

    #define NUM_OLED_CHARS 64

    #define RDY_OK   0

    #define I2C_BUFF_SIZE 9
    #define I2C_DATA_BYTES_PER_XFER 8

    #define I2C_SWITCH_ADDRESS 0b1110000

#endif

void OLEDInit();
void OLEDDisplay();
void OLED_Sandbox();
