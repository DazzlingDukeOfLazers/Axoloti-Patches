<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="28" text="Believotron Wanderlust Knob Bottom Row Object."/>
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

	for(int iDevice=0; iDevice<2; iDevice++)
	{
		for(int pin=0; pin<8; pin++){
		
			{ // Assemble the Command for readback
				txbuf[0] = pin < 4 ? 0b01100000 : 0b11100000;
			
				if      (pin % 4 == 0)	{	txbuf[1] = 0b00000000;	} // pin == 0 || pin == 4
				else if (pin % 4 == 1)	{	txbuf[1] = 0b00000010;	} // pin == 1 || pin == 5
				else if (pin % 4 == 2)	{	txbuf[1] = 0b00000001;   } // pin == 2 || pin == 6
				else                 	{	txbuf[1] = 0b00000011;   }
				
			}		
			
			SPI_CS_ALL_OFF();
	
			if (iDevice == 0 ) palWritePad(	GPIOA,	4,	0		);	// enable ADC
			if (iDevice == 1 ) palWritePad(	GPIOB,	7,	0		);	// enable ADC			
			
			spiSend(		&SPID1,	3,	txbuf	);	// send SPI data txbuf[]
			spiReceive(	&SPID1,	3,	rxbuf	);	// receive SPI data from MCP3208
			
			SPI_CS_ALL_OFF();
			           
			// I don't know why I'm only getting 8 bits. Probably a difference btwn the 3208 and the 3008. I only need 8 bits for demo
			uint32_t z = ( (0x0000007F & rxbuf[0]) << 1) | ( (rxbuf[0] & 0x00000080) > 6);
			z = 0x00FF ^ z;
			z = z<<19;
			//int z = (0x00FF ^ rxbuf[0]);
			//int z = (!rxbuf[0]);		
	
			if (iDevice == 0)
			{
				if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot0_value],	z,	0xFFFD	);	}
				else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot1_value],	z,	0xFFFD	);   }
				else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot2_value],	z,	0xFFFD	);   }
				else if (pin == 3)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobBot7_value],	z,	0xFFFD	);   }	
			}
			if (iDevice == 1)
			{
				if      (pin == 0)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop0_value],	z,	0xFFFD	);	}
				else if (pin == 1)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop1_value],	z,	0xFFFD	);   }
				else if (pin == 2)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop2_value],	z,	0xFFFD	);   }
				else if (pin == 3)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop3_value],	z,	0xFFFD	);   }
				else if (pin == 4)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop4_value],	z,	0xFFFD	);	}
				else if (pin == 5)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop5_value],	z,	0xFFFD	);   }
				else if (pin == 6)	{	PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop6_value],	z,	0xFFFD	);   }
				else if (pin == 7)	{    PExParameterChange(	&parent->PExch[PARAM_INDEX_knobTop7_value],	z,	0xFFFD	);   }
			}
		
		} // For each Pin
	} // For each row
       
	

	
	chThdSleepMilliseconds(1);
        
}]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop0" x="364" y="84">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_0" x="420" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop1" x="504" y="84">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_1" x="574" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop2" x="658" y="84">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_2" x="714" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop3" x="798" y="84">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_3" x="868" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop4" x="952" y="84">
      <params>
         <frac32.u.map name="value" value="51.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_4" x="1022" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop5" x="1106" y="84">
      <params>
         <frac32.u.map name="value" value="51.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_5" x="1176" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop6" x="1260" y="84">
      <params>
         <frac32.u.map name="value" value="17.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_6" x="1330" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop7" x="1414" y="84">
      <params>
         <frac32.u.map name="value" value="48.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_top_7" x="1484" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="420" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot0" x="364" y="224">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_0" x="420" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot1" x="518" y="224">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_1" x="574" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot2" x="658" y="224">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_2" x="714" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot3" x="812" y="224">
      <params>
         <frac32.u.map name="value" value="51.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_3" x="868" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot4" x="966" y="224">
      <params>
         <frac32.u.map name="value" value="51.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_4" x="1022" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot5" x="1120" y="224">
      <params>
         <frac32.u.map name="value" value="17.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_5" x="1176" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot6" x="1274" y="224">
      <params>
         <frac32.u.map name="value" value="48.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_6" x="1330" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot7" x="1428" y="224">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="_knob_bot_7" x="1484" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="420" y="266">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="knobBot0" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="_knob_bot_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot1" outlet="out"/>
         <dest obj="_knob_bot_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot2" outlet="out"/>
         <dest obj="_knob_bot_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot3" outlet="out"/>
         <dest obj="_knob_bot_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot4" outlet="out"/>
         <dest obj="_knob_bot_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot5" outlet="out"/>
         <dest obj="_knob_bot_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot6" outlet="out"/>
         <dest obj="_knob_bot_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot7" outlet="out"/>
         <dest obj="_knob_bot_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop0" outlet="out"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="_knob_top_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop2" outlet="out"/>
         <dest obj="_knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop3" outlet="out"/>
         <dest obj="_knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop4" outlet="out"/>
         <dest obj="_knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop5" outlet="out"/>
         <dest obj="_knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop6" outlet="out"/>
         <dest obj="_knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop7" outlet="out"/>
         <dest obj="_knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop1" outlet="out"/>
         <dest obj="_knob_top_1" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2115</x>
      <y>-14</y>
      <width>1660</width>
      <height>1209</height>
   </windowPos>
</patch-1.0>