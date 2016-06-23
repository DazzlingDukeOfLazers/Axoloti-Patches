<patch-1.0 appVersion="1.0.10">
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_3" x="896" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="phi/ctrl/i 1-max" uuid="a3786816db6ea5bc6ac4193a5cccdb2ct6b83496" name="i_1" x="756" y="14">
      <params>
         <int32 name="value" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/decode/bin 8" uuid="dfc0a6e9d7e817cec64fd01f6972f64d897863a4" name="bin_1" x="994" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="1148" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/decode/bin 8" uuid="dfc0a6e9d7e817cec64fd01f6972f64d897863a4" name="bin_2" x="1316" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_9" x="1428" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/i2c/config" sha="1ea9db31ce7ec2874d2a8315213c733a6b3c2dcf" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="28" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/Keyboard" uuid="ec1ac6c0-f9d8-4116-82b0-711e0023a830" name="Keyboard_1" x="168" y="70">
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
	
	SetMPR121Threshold(12, 6);


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
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_5" x="294" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_2" x="1148" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_10" x="1428" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="924" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_3" x="1148" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_11" x="1428" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_3" x="756" y="154">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="406" y="168" text="very simple script example"/>
   <obj type="disp/dial b" sha="5d4fe09e04ac9d02b2f3224e493c9536fe25fa66" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_2" x="658" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_1" x="252" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_4" x="1148" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_12" x="1428" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/note" sha="47a060e4a7fa766d1de9cf03c8aa236d79be3440" uuid="ce3190ad98b73b468f22221f555b01feee03226a" name="note_1" x="364" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_4" x="924" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_5" x="1148" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_13" x="1428" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_2" x="266" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="924" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_6" x="1148" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_14" x="1428" y="308">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="476" y="350" text="evelope to control modulation depth"/>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c1" x="658" y="364">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 1" uuid="26fb1fe4ed25d8bc2ac4a3f91ab6b80ed6d9d4fa" name="mix_1" x="770" y="364">
      <params>
         <frac32.u.map name="gain1" value="21.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_7" x="1148" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_15" x="1428" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_8" x="1148" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_16" x="1428" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/square" sha="b4420b58ca2ae5ece53d53540bc91bc9ed7a4b83" uuid="de6909eb64db13af5b43f979a4c130024b3a4793" name="square_1" x="196" y="476">
      <params>
         <frac32.s.map name="pitch" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/d" sha="d9f7cfe1295d7bcc550714a18126d4f73c7c8411" name="envd1" x="630" y="504">
      <params>
         <frac32.s.map name="d" value="29.5"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="966" y="504" text="modulator oscillator"/>
   <comment type="patch/comment" x="1134" y="504" text="modulation intensity"/>
   <comment type="patch/comment" x="1288" y="504" text="carrier oscillator"/>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_1" x="966" y="518">
      <params>
         <frac32.s.map name="pitch" value="12.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_2" x="1134" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_2" x="1288" y="518">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_1" x="1414" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_1" x="1512" y="518">
      <params>
         <frac32.u.map name="amp" value="4.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="audio/out stereo" sha="b933bb91801a126126313c11f773158b5ca2face" name="dac_1" x="1638" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/scope 128 b trig" sha="91c015bbaaedb3ccbea0d5e0f78dbee6588e0a39" name="scope_1" x="1498" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/bitand" uuid="2c64c2fc476c4ad689eba1bd0adfba7691b913f1" name="bitand_1" x="742" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_2" x="616" y="742">
      <params/>
      <attribs>
         <spinner attributeName="value" value="2"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="dac_1" inlet="left"/>
         <dest obj="dac_1" inlet="right"/>
      </net>
      <net>
         <source obj="osc_2" outlet="wave"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="envd1" outlet="env"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="osc_1" outlet="wave"/>
         <dest obj="vca_2" inlet="a"/>
      </net>
      <net>
         <source obj="vca_2" outlet="o"/>
         <dest obj="osc_2" inlet="freq"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="vca_2" inlet="v"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="scope_1" inlet="in"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="square_1" outlet="wave"/>
         <dest obj="envd1" inlet="trig"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <dest obj="note_1" inlet="in"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="osc_2" inlet="pitch"/>
         <dest obj="osc_1" inlet="pitch"/>
         <dest obj="hex_2" inlet="in"/>
      </net>
      <net>
         <source obj="c1" outlet="out"/>
         <dest obj="mix_1" inlet="bus_in"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="hex_3" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o0"/>
         <dest obj="bool_9" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o1"/>
         <dest obj="bool_10" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o2"/>
         <dest obj="bool_11" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o3"/>
         <dest obj="bool_12" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o4"/>
         <dest obj="bool_13" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o5"/>
         <dest obj="bool_14" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o6"/>
         <dest obj="bool_15" inlet="in"/>
      </net>
      <net>
         <source obj="bin_2" outlet="o7"/>
         <dest obj="bool_16" inlet="in"/>
      </net>
      <net>
         <source obj="dial_3" outlet="out"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="hex_4" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o0"/>
         <dest obj="bool_1" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o1"/>
         <dest obj="bool_2" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o2"/>
         <dest obj="bool_3" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o3"/>
         <dest obj="bool_4" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o4"/>
         <dest obj="bool_5" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o5"/>
         <dest obj="bool_6" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o6"/>
         <dest obj="bool_7" inlet="in"/>
      </net>
      <net>
         <source obj="bin_1" outlet="o7"/>
         <dest obj="bool_8" inlet="in"/>
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
      <x>-3072</x>
      <y>-172</y>
      <width>1810</width>
      <height>1062</height>
   </windowPos>
</patch-1.0>