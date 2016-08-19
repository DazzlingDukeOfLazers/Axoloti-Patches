<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="168" y="70" text="Believotron Wanderlust Capacitive touch keyboard output decoder. Place this in your patch to access the keys! You can rename it with a &lt;tbd python script&gt;"/>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_0" x="672" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="756" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_1" x="672" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_2" x="756" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_2" x="672" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_3" x="756" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_3" x="672" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_4" x="756" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_4" x="672" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_5" x="756" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_5" x="672" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_6" x="756" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_6" x="672" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_7" x="756" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_7" x="672" y="560">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_8" x="756" y="560">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_8" x="672" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_9" x="756" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_9" x="672" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_10" x="756" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_10" x="672" y="728">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_11" x="756" y="728">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="kb_11" x="672" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_12" x="756" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/i2c/config" sha="1ea9db31ce7ec2874d2a8315213c733a6b3c2dcf" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="126" y="938">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_5" x="252" y="938">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/Keyboard" uuid="ec1ac6c0-f9d8-4116-82b0-711e0023a830" name="Keyboard_1" x="126" y="966">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);

// The default I2C address

// <MPR121>
// // Derived from Adafruit <TBD Link>
	// <Address>
	// MPR121 Capacitive touch IC used on all padcap capacitive touch keys and piano keys
	// MPR121 Address Scheme
	// https://learn.adafruit.com/adafruit-mpr121-12-key-capacitive-touch-sensor-breakout-tutorial?view=all
	// ADDR is the I2C address select pin. 
	// 0x5A	By default this is pulled down to ground with a 100K resistor, for an I2C address of 0x5A. 
	// 0x5B	You can also connect it to the 3Vo pin for an address of 0x5B, 
	// 0x5C	~(you can connect ADDR to) the SDA pin for 0x5C or 
	// 0x5D	~(you can connect ADDR to) SCL for address 0x5D
	#define WANDERLUST_KEYBOARD	  0x5A
	#define WANDERLUST_PADCAP_LOWER 0x5B
	#define WANDERLUST_PADCAP_UPPER 0x5C
	//#define MPR121_I2CADDR_DEFAULT 0x5A // Piano
	#define MPR121_I2CADDR_DEFAULT  WANDERLUST_KEYBOARD
	// </Adddress>

	//<uncategorized>
	#define MPR121_TOUCHSTATUS_L 0x00
	#define MPR121_TOUCHSTATUS_H 0x01
	#define MPR121_FILTDATA_0L   0x04
	#define MPR121_FILTDATA_0H   0x05
	#define MPR121_BASELINE_0    0x1E
	#define MPR121_MHDR          0x2B
	#define MPR121_NHDR          0x2C
	#define MPR121_NCLR          0x2D
	#define MPR121_FDLR          0x2E
	#define MPR121_MHDF          0x2F
	#define MPR121_NHDF          0x30
	#define MPR121_NCLF          0x31
	#define MPR121_FDLF          0x32
	#define MPR121_NHDT          0x33
	#define MPR121_NCLT          0x34
	#define MPR121_FDLT          0x35
	
	#define MPR121_TOUCHTH_0     0x41
	#define MPR121_RELEASETH_0   0x42
	#define MPR121_DEBOUNCE      0x5B
	#define MPR121_CONFIG1       0x5C
	#define MPR121_CONFIG2       0x5D
	#define MPR121_CHARGECURR_0  0x5F
	#define MPR121_CHARGETIME_1  0x6C
	#define MPR121_ECR           0x5E
	#define MPR121_AUTOCONFIG0   0x7B
	#define MPR121_AUTOCONFIG1   0x7C
	#define MPR121_UPLIMIT       0x7D
	#define MPR121_LOWLIMIT      0x7E
	#define MPR121_TARGETLIMIT   0x7F
	
	#define MPR121_GPIODIR       0x76
	#define MPR121_GPIOEN        0x77
	#define MPR121_GPIOSET       0x78
	#define MPR121_GPIOCLR       0x79
	#define MPR121_GPIOTOGGLE    0x7A
	#define MPR121_SOFTRESET     0x80
	//<uncategorized>


// </MPR121>


// Default Voodoo to make serial communication working; Rabbithole of shared memory
void LinkTxRxBuffers(void)
{
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
}


uint16_t PadcapReadReg16(uint8_t ui8Channel, uint8_t ui8Register)
{
	uint16_t output;
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 2, tmo); // <TBD add status checking>
	return ( rxbuf[0] | ( rxbuf[1] << 8 ) );	
}

uint16_t PadcapWriteReg(uint8_t ui8Channel, uint8_t ui8Register, uint8_t ui8Val)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	txbuf[1] = ui8Val;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 2, rxbuf, 0, tmo); // TBD add status checking
	return status;
}

uint8_t PadcapWriteReg8(uint8_t ui8Channel, uint8_t ui8Register)
{
	msg_t status = RDY_OK;
	txbuf[0] = ui8Register;
	status = i2cMasterTransmitTimeout(&I2CD1, ui8Channel, txbuf, 1, rxbuf, 1, tmo); // TBD add status checking
	return rxbuf[0];
}

void PadcapSetThreshold(uint8_t ui8Channel, uint8_t touch, uint8_t release)
{
	for (uint8_t i=0; i<12; i++) 
	{
		PadcapWriteReg(ui8Channel, MPR121_TOUCHTH_0   + 2*i, touch);
		PadcapWriteReg(ui8Channel, MPR121_RELEASETH_0 + 2*i, release);
	}
}

uint32_t PadcapTouched(uint8_t ui8Channel)
{	
	int32_t i32NoteVal = 0;
	
	uint16_t u16capstatus = PadcapReadReg16(ui8Channel, MPR121_TOUCHSTATUS_L);
	i32NoteVal = u16capstatus;
	
	out2 = i32NoteVal;
	
	return i32NoteVal;
}

void PadcapSetup(uint8_t ui8tPadcapChannel)
{
	PadcapWriteReg(	ui8tPadcapChannel,	MPR121_SOFTRESET,   0x63);		
	PadcapWriteReg(	ui8tPadcapChannel,	MPR121_ECR,         0x0);

	uint8_t c = PadcapWriteReg8(ui8tPadcapChannel, MPR121_CONFIG2);
	if (c != 0x24)  out1 &= 0xF000; // Device ID is incorrect <TBD add to class flag>
		
	//PadcapSetThreshold(12, 6); // <reference Device sensetivity default	>
	PadcapSetThreshold(ui8tPadcapChannel, 24, 12);

	PadcapWriteReg(ui8tPadcapChannel, MPR121_MHDR, 0x01);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDR, 0x01);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLR, 0x0E);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLR, 0x00);

	PadcapWriteReg(ui8tPadcapChannel, MPR121_MHDF, 0x01);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDF, 0x05);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLF, 0x01);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLF, 0x00);
	
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NHDT, 0x00);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_NCLT, 0x00);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_FDLT, 0x00);
	
	PadcapWriteReg(ui8tPadcapChannel, MPR121_DEBOUNCE, 0);
	PadcapWriteReg(ui8tPadcapChannel, MPR121_CONFIG1, 0x10); // default, 16uA charge current
	PadcapWriteReg(ui8tPadcapChannel, MPR121_CONFIG2, 0x20); // 0.5uS encoding, 1ms period
	
	PadcapWriteReg(ui8tPadcapChannel, MPR121_ECR, 0x8F);  // start with first 5 bits of baseline tracking
}


void setup(void) {
	LinkTxRxBuffers();
	out1 = 0xABBA;
	
	rxbuf[0] = 0;	
	txbuf[0] = 0; // CAP1188_PRODID;

	PadcapSetup(WANDERLUST_KEYBOARD);
	PadcapSetup(WANDERLUST_PADCAP_LOWER);
	PadcapSetup(WANDERLUST_PADCAP_UPPER);	

	out2 = 0xBEEF;
	out3 = 0xABBA;
	kb0 = false;
	kb1 = false;
	kb2 = false;
	kb3 = false;
	kb4 = false;
	kb5 = false;
	kb6 = false;
	kb7 = false;
	kb8 = false;
	kb9 = false;
	kb10 = false;
	kb11 = false;


}
void loop(void)
{
	static int32_t iSameCount=0;

	uint32_t ui32CapTouched;

	ui32CapTouched = PadcapTouched(WANDERLUST_KEYBOARD);
	{
		out2 = ui32CapTouched;
		kb0  = 0x01 & (ui32CapTouched     );
		kb1  = 0x01 & (ui32CapTouched >> 1);
		kb2  = 0x01 & (ui32CapTouched >> 2);
		kb3  = 0x01 & (ui32CapTouched >> 3);
		kb4  = 0x01 & (ui32CapTouched >> 4);
		kb5  = 0x01 & (ui32CapTouched >> 5);
		kb6  = 0x01 & (ui32CapTouched >> 6);
		kb7  = 0x01 & (ui32CapTouched >> 7);
		kb8  = 0x01 & (ui32CapTouched >> 8);
		kb9  = 0x01 & (ui32CapTouched >> 9);
		kb10 = 0x01 & (ui32CapTouched >> 10);
		kb11 = 0x01 & (ui32CapTouched >> 11);
	}

	ui32CapTouched = PadcapTouched(WANDERLUST_PADCAP_LOWER);
	{
		out3 = ui32CapTouched;
	}
	
	
	
	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_6" x="252" y="994">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Keyboard_1" outlet="out2_"/>
         <dest obj="hex_5" inlet="in"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="out3_"/>
         <dest obj="hex_6" inlet="in"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb0_"/>
         <dest obj="bool_1" inlet="in"/>
         <dest obj="kb_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb1_"/>
         <dest obj="bool_2" inlet="in"/>
         <dest obj="kb_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb2_"/>
         <dest obj="bool_3" inlet="in"/>
         <dest obj="kb_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb3_"/>
         <dest obj="bool_4" inlet="in"/>
         <dest obj="kb_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb4_"/>
         <dest obj="bool_5" inlet="in"/>
         <dest obj="kb_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb5_"/>
         <dest obj="bool_6" inlet="in"/>
         <dest obj="kb_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb6_"/>
         <dest obj="bool_7" inlet="in"/>
         <dest obj="kb_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb7_"/>
         <dest obj="bool_8" inlet="in"/>
         <dest obj="kb_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb8_"/>
         <dest obj="bool_9" inlet="in"/>
         <dest obj="kb_8" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb9_"/>
         <dest obj="bool_10" inlet="in"/>
         <dest obj="kb_9" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb10_"/>
         <dest obj="bool_11" inlet="in"/>
         <dest obj="kb_10" inlet="outlet"/>
      </net>
      <net>
         <source obj="Keyboard_1" outlet="kb11_"/>
         <dest obj="bool_12" inlet="in"/>
         <dest obj="kb_11" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2079</x>
      <y>-50</y>
      <width>1860</width>
      <height>1331</height>
   </windowPos>
</patch-1.0>