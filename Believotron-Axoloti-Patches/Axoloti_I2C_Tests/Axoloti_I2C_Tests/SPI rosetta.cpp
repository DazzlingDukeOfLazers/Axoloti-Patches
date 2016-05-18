#define CAP1188_PRODID     0xFD
#define CAP1188_MANUID     0xFE
#define CAP1188_REV        0xFF
#define CAP1188_MTBLK      0x2A
#define CAP1188_LEDLINK    0x72
#define CAP1188_STANDBYCFG 0x41

// Default
Adafruit_CAP1188(int8_t resetpin = -1);

boolean Adafruit_CAP1188::begin(uint8_t i2caddr)
{

    readRegister(CAP1188_PRODID);
    Serial.print("Product ID: 0x");
    Serial.println(readRegister(CAP1188_PRODID), HEX);
    Serial.print("Manuf. ID: 0x");
    Serial.println(readRegister(CAP1188_MANUID), HEX);
    Serial.print("Revision: 0x");
    Serial.println(readRegister(CAP1188_REV), HEX);

    if ( (readRegister(CAP1188_PRODID) != 0x50) ||
         (readRegister(CAP1188_MANUID) != 0x5D) ||
         (readRegister(CAP1188_REV)    != 0x83)     )
    {
        return false;
    }

    // allow multiple touches
    writeRegister(CAP1188_MTBLK, 0);
    // Have LEDs follow touches
    writeRegister(CAP1188_LEDLINK, 0xFF);
    // speed up a bit
    writeRegister(CAP1188_STANDBYCFG, 0x30);
    return true;
}

uint8_t touched = cap.touched();
uint8_t  Adafruit_CAP1188::touched(void)
{
  uint8_t t = readRegister(CAP1188_SENINPUTSTATUS);
  if (t)
  {
      // Register offset, Data, Read back whatever was there, and twiddle the one bit
    writeRegister(CAP1188_MAIN, readRegister(CAP1188_MAIN) & ~CAP1188_MAIN_INT);
  }
  return t;
}

// Write Register
 void Adafruit_CAP1188::writeRegister(uint8_t reg, uint8_t value) {
  if (_i2c) {
    Wire.beginTransmission(_i2caddr);
    i2cwrite((uint8_t)reg);
    i2cwrite((uint8_t)(value));
    Wire.endTransmission();
}


if (touched & (1 << i)) {
      SerialUSB.print("C"); SerialUSB.print(i+1); SerialUSB.print("\t");


// I found these c files.
void codec_CS43L22_writeReg(uint8_t addr, uint8_t data) {
  txbuf[0] = addr;
  txbuf[1] = data;
  i2cMasterTransmitTimeout(&I2CD1, CS43L22_ADDR, txbuf, 2, NULL, 0, MS2ST(4));
}

uint8_t codec_CS43L22_readReg(uint8_t addr) {
  txbuf[0] = addr;
  i2cMasterTransmitTimeout(&I2CD1, CS43L22_ADDR, txbuf, 1, rxbuf, 2, MS2ST(4));
  return rxbuf[0];
}
