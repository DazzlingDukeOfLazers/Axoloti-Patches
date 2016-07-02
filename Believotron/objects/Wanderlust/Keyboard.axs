<patch-1.0 appVersion="1.0.10">
   <obj type="gpio/i2c/config" sha="1ea9db31ce7ec2874d2a8315213c733a6b3c2dcf" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="0" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/Keyboard" uuid="ec1ac6c0-f9d8-4116-82b0-711e0023a830" name="Keyboard_1" x="0" y="28">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);

// The default I2C address
#define MPR121_I2CADDR_DEFAULT 0x5A

#define MPR121_TOUCHSTATUS_L 0x00
#define MPR121_TOUCHSTATUS_H 0x01
#define MPR121_FILTDATA_0L  0x04
#define MPR121_FILTDATA_0H  0x05
#define MPR121_BASELINE_0   0x1E
#define MPR121_MHDR         0x2B
#define MPR121_NHDR         0x2C
#define MPR121_NCLR         0x2D
#define MPR121_FDLR         0x2E
#define MPR121_MHDF         0x2F
#define MPR121_NHDF         0x30
#define MPR121_NCLF         0x31
#define MPR121_FDLF         0x32
#define MPR121_NHDT         0x33
#define MPR121_NCLT         0x34
#define MPR121_FDLT         0x35

#define MPR121_TOUCHTH_0    0x41
#define MPR121_RELEASETH_0    0x42
#define MPR121_DEBOUNCE 0x5B
#define MPR121_CONFIG1 0x5C
#define MPR121_CONFIG2 0x5D
#define MPR121_CHARGECURR_0 0x5F
#define MPR121_CHARGETIME_1 0x6C
#define MPR121_ECR 0x5E
#define MPR121_AUTOCONFIG0 0x7B
#define MPR121_AUTOCONFIG1 0x7C
#define MPR121_UPLIMIT   0x7D
#define MPR121_LOWLIMIT  0x7E
#define MPR121_TARGETLIMIT  0x7F

#define MPR121_GPIODIR  0x76
#define MPR121_GPIOEN  0x77
#define MPR121_GPIOSET  0x78
#define MPR121_GPIOCLR  0x79
#define MPR121_GPIOTOGGLE  0x7A
#define MPR121_SOFTRESET 0x80


void LinkTxRxBuffers(void)
{
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
}

/*
uint8_t ReadCap1188Reg(uint8_t ui8Register)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, CAP1188_I2CADDR, txbuf, 1, rxbuf, 1, tmo); // TBD add status checking
	return rxbuf[0];
}


void WriteCap1188Reg(uint8_t ui8Register, uint8_t ui8Val)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	txbuf[1] = ui8Val;
	status = i2cMasterTransmitTimeout(&I2CD1, CAP1188_I2CADDR, txbuf, 2, rxbuf, 0, tmo); // TBD add status checking
}
*/

void WriteMPR121Register(uint8_t ui8Register, uint8_t ui8Val)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	txbuf[1] = ui8Val;
	status = i2cMasterTransmitTimeout(&I2CD1, MPR121_I2CADDR_DEFAULT, txbuf, 2, rxbuf, 0, tmo); // TBD add status checking
}

uint8_t ReadMPR121Register8(uint8_t ui8Register)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, MPR121_I2CADDR_DEFAULT, txbuf, 1, rxbuf, 1, tmo); // TBD add status checking
	return rxbuf[0];
}

uint16_t ReadMPR121Register16(uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, MPR121_I2CADDR_DEFAULT, txbuf, 1, rxbuf, 2, tmo); // TBD add status checking
	return ( rxbuf[0] | ( rxbuf[1] << 8 ) );
	//return 0x0008;
}

void SetMPR121Threshold(uint8_t touch, uint8_t release)
{
	for (uint8_t i=0; i<12; i++) 
	{
		WriteMPR121Register(MPR121_TOUCHTH_0 + 2*i, touch);
		WriteMPR121Register(MPR121_RELEASETH_0 + 2*i, release);
	}
}

/*
uint32_t Cap1188Touched()
{
	uint8_t  t = ReadCap1188Reg(CAP1188_SENINPUTSTATUS);
	uint32_t ui32KeyVal = 0;//0x55555555; 
	if (t)
	{
		uint8_t ui8MainReg = ReadCap1188Reg(CAP1188_MAIN);
		WriteCap1188Reg(CAP1188_MAIN, ui8MainReg & ~CAP1188_MAIN_INT); // I think this resets the trigger alert
		
	}

	// t is the raw encoded value, one bit for each pin
	// I'm not sure what the final scheme is, so I'm kludging this:
	if      (0x01 & t) { ui32KeyVal = 0x00200000; }
	else if (0x02 & t) { ui32KeyVal = 0x00400000; }
	else if (0x04 & t) { ui32KeyVal = 0x00600000; }
	else if (0x08 & t) { ui32KeyVal = 0x00800000; }
	else if (0x10 & t) { ui32KeyVal = 0x00A00000; }
	else if (0x20 & t) { ui32KeyVal = 0x00C00000; }
	else if (0x40 & t) { ui32KeyVal = 0x00E00000; }
	else if (0x80 & t) { ui32KeyVal = 0x02000000; }
	else                 ui32KeyVal = 0x00000000;
	
	return (ui32KeyVal);
	//return(t);
}
*/

uint32_t MPR121Touched()
{
	//uint16_t capstatus = ReadMPR121Register16(MPR121_TOUCHSTATUS_L);
	//return ( capstatus & 0x0FFF );
	//return ReadMPR121Register8(MPR121_TOUCHSTATUS_L);

	int32_t i32NoteVal = 0;
	
	uint16_t u16capstatus = ReadMPR121Register16(MPR121_TOUCHSTATUS_L);

	i32NoteVal = u16capstatus;
	/*
	// Monophonic. single scale, lazycode for proof
	if      ( (u16capstatus & 0x0001) == 0x0001) i32NoteVal |= 1;
	else if ( (u16capstatus & 0x0002) == 0x0002) i32NoteVal = 0x00400000;
	else if ( (u16capstatus & 0x0004) == 0x0004) i32NoteVal = 0x00600000;
	else if ( (u16capstatus & 0x0008) == 0x0008) i32NoteVal = 0x00800000;
	else if ( (u16capstatus & 0x0010) == 0x0010) i32NoteVal = 0x00A00000;
	else if ( (u16capstatus & 0x0020) == 0x0020) i32NoteVal = 0x00C00000;
	else if ( (u16capstatus & 0x0040) == 0x0040) i32NoteVal = 0x00E00000;
	else if ( (u16capstatus & 0x0080) == 0x0080) i32NoteVal = 0x01000000;
	else if ( (u16capstatus & 0x0100) == 0x0100) i32NoteVal = 0x01200000;
	else if ( (u16capstatus & 0x0200) == 0x0200) i32NoteVal = 0x01400000;
	else if ( (u16capstatus & 0x0400) == 0x0400) i32NoteVal = 0x00C00000;
	else if ( (u16capstatus & 0x0800) == 0x0800) i32NoteVal = 0x00E00000;
	else if ( (u16capstatus         ) == 0     ) i32NoteVal = 0xDEAD;
	else                                    i32NoteVal = u16capstatus;
*/
	out2 = i32NoteVal;
	
	return i32NoteVal;
}

void setup(void) {
	LinkTxRxBuffers();
	out1 = 0xABBA;
	
	rxbuf[0] = 0;	
	txbuf[0] = 0; // CAP1188_PRODID;

	uint8_t ui8ProdID = 0;
	uint8_t ui8ManuID = 0;
	uint8_t ui8Rev    = 0;
	bool bCorrectBoard = false;

	WriteMPR121Register(MPR121_SOFTRESET, 0x63);
	WriteMPR121Register(MPR121_ECR, 0x0);

	uint8_t c = ReadMPR121Register8(MPR121_CONFIG2);
	if (c != 0x24)  out1 = 0x4444;
		
	//SetMPR121Threshold(12, 6);
	
	SetMPR121Threshold(24, 12);


	WriteMPR121Register(MPR121_MHDR, 0x01);
	WriteMPR121Register(MPR121_NHDR, 0x01);
	WriteMPR121Register(MPR121_NCLR, 0x0E);
	WriteMPR121Register(MPR121_FDLR, 0x00);

	WriteMPR121Register(MPR121_MHDF, 0x01);
	WriteMPR121Register(MPR121_NHDF, 0x05);
	WriteMPR121Register(MPR121_NCLF, 0x01);
	WriteMPR121Register(MPR121_FDLF, 0x00);
	
	WriteMPR121Register(MPR121_NHDT, 0x00);
	WriteMPR121Register(MPR121_NCLT, 0x00);
	WriteMPR121Register(MPR121_FDLT, 0x00);
	
	WriteMPR121Register(MPR121_DEBOUNCE, 0);
	WriteMPR121Register(MPR121_CONFIG1, 0x10); // default, 16uA charge current
	WriteMPR121Register(MPR121_CONFIG2, 0x20); // 0.5uS encoding, 1ms period
	
	WriteMPR121Register(MPR121_ECR, 0x8F);  // start with first 5 bits of baseline tracking

	//out2 = ReadMPR121Register8(MPR121_CONFIG2); // Remove this. I'm using it for shitty debugging
	//return true;

	//out1 = 0xBEEF;
	out2 = 4;

	

}
void loop(void)
{
	static int32_t iSameCount=0;
	//out1 = 0xAA55;
	//out2 = ReadMPR121Register8(MPR121_CONFIG2);
	//out1 = out1;
	out2 = MPR121Touched();
	if (out2 == 0xDEAD) out1 = 0; else out1 = 0x2000000;;
	//out2 = ReadMPR121Register16(MPR121_TOUCHSTATUS_L);
	//out2 = ReadMPR121Register8(MPR121_TOUCHSTATUS_L);//MPR121Touched();//Cap1188Touched();
	//out1 = 0xBBBB;
	/*
	
	
	
	if (out2 != 0)
	{
		out1 = 0x00200000;
	}
	else
	{
		out1 = 0;
	}
	*/
}]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_5" x="98" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/decode/bin 8" uuid="dfc0a6e9d7e817cec64fd01f6972f64d897863a4" name="bin_1" x="182" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_0" x="322" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_1" x="322" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_2" x="322" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_3" x="322" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_4" x="322" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_5" x="322" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_6" x="322" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_7" x="322" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/decode/bin 8" uuid="dfc0a6e9d7e817cec64fd01f6972f64d897863a4" name="bin_2" x="168" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_8" x="322" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_9" x="322" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_10" x="322" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_11" x="322" y="742">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="bin_1" outlet="o0"/>
         <dest obj="kb_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o1"/>
         <dest obj="kb_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o2"/>
         <dest obj="kb_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o3"/>
         <dest obj="kb_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o4"/>
         <dest obj="kb_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o5"/>
         <dest obj="kb_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o6"/>
         <dest obj="kb_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o7"/>
         <dest obj="kb_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="bin_1" outlet="chain"/>
         <dest obj="bin_2" inlet="i1"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="out2_"/>
         <dest obj="hex_5" inlet="in"/>
         <dest obj="bin_1" inlet="i1"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2103</x>
      <y>-9</y>
      <width>1932</width>
      <height>1328</height>
   </windowPos>
</patch-1.0>