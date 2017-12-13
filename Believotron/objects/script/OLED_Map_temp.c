uint8_t Cartesian_Byte_Array[NUM_OLED_DISPLAYS][CARTESIAN_BYTE_ARRAY_NUM_ROWS][CARTESIAN_BYTE_ARRAY_NUM_COLS];
#define CARTESIAN_BYTE_ARRAY_NUM_COLS 16 // 128 bits / 8 bits per byte
#define CARTESIAN_BYTE_ARRAY_NUM_ROWS 32 // 32 rows of 16 bytes



void OLEDInit()
    For each
    OLEDBufferClear
        OLEDBuffer[iDevice][iWord] = 0x00;
        SetOLEDChan(iDevice);
        OLEDInit( iDevice,OLED_SSD1306_SWITCHCAPVCC,0x3C, FALSE );


void OLED_Sandbox()
    strcpy(OLEDTextBuff, "Attack");
    OLED_Print_ParamLeft(0);
        OLED_Print_Buff(iDevice);
            SetOLEDCharIndex( iCol, iRow, CharToIndex(OLEDTextBuff[iText]), iDevice );
                Cartesian_Byte_Array[iDevice][ startY+iPixelY ][ x ] = font_QuarterMuncher[ charOffset ][ iPixelY ];



void OLEDDisplay()
{
    for( int i=0; i< 4; i++)
    {
        SetOLEDChan(i);
        ConvertCartesianBufferToOLEDBuffer(i);
            if (Cartesian_Byte_Array[iDevice][iCartesianRow][iCartesianColumn] & searchMask)
                OLEDBuffer[iDevice][buffIndex] |= writeMask;
            else
                OLEDBuffer[iDevice][buffIndex] &= invertedMask; }

        OLEDDisplayBuffer(i);
            txbuf[ix+1] = OLEDBuffer[iDevice][i+ix];
            thisMsg.status = i2cMasterTransmitTimeout(&I2CD1, OLED0._i2caddr, txbuf, I2C_BYTES_PER_XFER+1, rxbuf, 0, tmo); // <TBD add status checking>

    }
}
