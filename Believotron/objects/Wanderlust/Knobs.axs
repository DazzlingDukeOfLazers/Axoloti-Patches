<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="28" text="Believotron Wanderlust Knob Bottom Row Object."/>
   <obj type="gpio/i2c/config" sha="1ea9db31ce7ec2874d2a8315213c733a6b3c2dcf" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="14" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/spi/config" sha="62af644b09e7f654b36d66533da8ea5971ddb351" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="112" y="70">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="script/script2" sha="362a4413ceaefbe716480bf8f9c62eb3587fe6c0" uuid="d39e743cf47c9221f4e99c133430148cf74c68c5" name="script2_2" x="238" y="70">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[
/*
MCP3208 script2 code
by paul
 
Connect the MCP3208 CS pin to the NSS(PA4) or any other digital out pin of axoloti.
In this example, the MCP3208 CS pin is connected to axoloti B0(GPIOB,0) pin.
 
If you use more then one spi device, it's importent to disable every other spi device by switching their cs pin.
*/
 
uint8_t *txbuf;
uint8_t *rxbuf;


// Turns all the SPI chip selects off
void SPI_CS_ALL_OFF()
{
	// Disable Chip Select
	palWritePad(GPIOC,5,1);	// LED
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOA,4,1);	// Knob, Bottom Row
	
}
 
void setup(void){
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
 
     //palSetPadMode(GPIOA,0,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
     //palWritePad(GPIOA,0,1);                                           

	// Setup Knob Top
	palSetPadMode(GPIOB,7,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	// Setup Knob Bottom
	palSetPadMode(GPIOA,4,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
	// Setup LED
	palSetPadMode(GPIOC,5,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	SPI_CS_ALL_OFF();	
}
 
void loop(void){
	
        // txtbuf[0] = txtbuf[1] = txtbuf[2] = 0b00000000;
        txbuf[2] = 0b00000000;
       
	for(int pin=0; pin<8; pin++){
 
                txbuf[0] = pin < 4 ? 0b01100000 : 0b11100000;
         
                if (pin % 4 == 0) { // pin == 0 || pin == 4
                    txbuf[1] = 0b00000000;
                } else if (pin % 4 == 1) { // pin == 1 || pin == 5
                   txbuf[1] = 0b00000010;
                } else if (pin % 4 == 2) { // pin == 2 || pin == 6
                    txbuf[1] = 0b00000001;
                } else {
                    txbuf[1] = 0b00000011;
                }
			
                       
 
                //palWritePad(GPIOA,0,0);         // enable MCP3208
                SPI_CS_ALL_OFF();
                palWritePad(	GPIOA,	4,	0		);	// enable MCP3208
                spiSelect(	&SPID1				);	// START SPI
                spiSend(		&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
                spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208
                spiUnselect(	&SPID1				);	// STOP SPI
                palWritePad(	GPIOA,	4,	1		);	// disable MCP3208
                               
                //int z = ( (rxbuf[1] << 8| rxbuf[0]) << 16);
                // I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
                uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);
                z = 0x00FF ^ z;
                z = z<<19;
                //int z = (0x00FF ^ rxbuf[0]);
                //int z = (!rxbuf[0]);

               
 
			if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c0_value],	z,	0xFFFD	);	}
			else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c1_value],	z,	0xFFFD	);   }
			else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c2_value],	z,	0xFFFD	);   }
			else if (pin == 3)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_c3_value],	z,	0xFFFD	);   }
			else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c4_value],	z,	0xFFFD	);	}
			else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c5_value],	z,	0xFFFD	);   }
			else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_c6_value],	z,	0xFFFD	);   }
			else if (pin == 7)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_c7_value],	z,	0xFFFD	);   }
	}
	chThdSleepMilliseconds(1);
        
}]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c0" x="364" y="70">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="420" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c1" x="518" y="70">
      <params>
         <frac32.u.map name="value" value="38.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="574" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c2" x="658" y="70">
      <params>
         <frac32.u.map name="value" value="38.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="714" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c3" x="798" y="70">
      <params>
         <frac32.u.map name="value" value="38.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="854" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c4" x="938" y="70">
      <params>
         <frac32.u.map name="value" value="33.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="994" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c5" x="1078" y="70">
      <params>
         <frac32.u.map name="value" value="4.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="1134" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c6" x="1218" y="70">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1274" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c7" x="1358" y="70">
      <params>
         <frac32.u.map name="value" value="21.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1414" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="434" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c9" x="364" y="266">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="434" y="266">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="c0" outlet="out"/>
         <dest obj="knob_bot_0" inlet="outlet"/>
         <dest obj="dial_1" inlet="in"/>
      </net>
      <net>
         <source obj="c1" outlet="out"/>
         <dest obj="knob_bot_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="c2" outlet="out"/>
         <dest obj="knob_bot_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="c3" outlet="out"/>
         <dest obj="knob_bot_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="c4" outlet="out"/>
         <dest obj="knob_bot_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="c5" outlet="out"/>
         <dest obj="knob_bot_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="c6" outlet="out"/>
         <dest obj="knob_bot_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="c7" outlet="out"/>
         <dest obj="knob_bot_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="c9" outlet="out"/>
         <dest obj="dial_2" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2152</x>
      <y>-57</y>
      <width>1467</width>
      <height>1005</height>
   </windowPos>
</patch-1.0>