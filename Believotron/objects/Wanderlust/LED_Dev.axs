<patch-1.0 appVersion="1.0.10">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_3" x="266" y="14">
      <params>
         <frac32.u.map name="value" value="0.20000000298023224"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="462" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_2" x="686" y="14">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="14" y="28" text="Believotron Wanderlust Knob Bottom Row Object."/>
   <obj type="math/div 64" uuid="da82c8ea54e956811f1d7264d921628e3301971e" name="div_1" x="350" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/Knobs_and_LEDs" uuid="ebc31452-ca44-46f9-81ed-d12c11874806" name="Knobs_and_LEDs_1" x="546" y="56">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[/*
	Believotron Wanderlust Knob / Potentiometer Interface

	Two parallel SPI MCP3008 ADCs, read, and output to knobBot0-7, and knobTop0-7

	Herstory:
	2016-06-22	Dazzling Duke of Lazers
				Cleaned up file for release
				Initial Release
*/
 
uint8_t *txbuf;
uint8_t *rxbuf;

// Turns all the SPI chip selects off
void SPI_CS_ALL_OFF()
{
	// Disable Chip Select
	palWritePad(GPIOC,5,0);	// LED
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOA,4,1);	// Knob, Bottom Row
	
}

#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\knobs.c"
#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\led.c"

void setup(void){

	// Bind the SRAM to the local variables
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;

	// Setup Knob Top
	palSetPadMode(GPIOB,7,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	// Setup Knob Bottom
	palSetPadMode(GPIOA,4,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
	// Setup LED
	palSetPadMode(GPIOC,5,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208

	SPI_CS_ALL_OFF();	

	LEDInit();
	
}

 
void loop(void){	
	
	

	//readADCAndOutput();	
	HighlightLED(step, in1);
	UpdateStrip();
       	
	chThdSleepMilliseconds(50); // So far has to be above 20 ms, otherwise there's not enough overhead to reconnect via USB. Unless, maybe we added a long pause every once in a while...        
}

]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="gpio/spi/config" sha="62af644b09e7f654b36d66533da8ea5971ddb351" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="28" y="70">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_1" x="770" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="364" y="126">
      <params>
         <int32 name="value" value="6"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="770" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop0" x="28" y="210">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="98" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop1" x="182" y="210">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="252" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop2" x="336" y="210">
      <params>
         <frac32.u.map name="value" value="36.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="406" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop3" x="490" y="210">
      <params>
         <frac32.u.map name="value" value="38.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="560" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop4" x="644" y="210">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="714" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop5" x="798" y="210">
      <params>
         <frac32.u.map name="value" value="22.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="868" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop6" x="952" y="210">
      <params>
         <frac32.u.map name="value" value="16.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1022" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop7" x="1106" y="210">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1176" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="98" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot0" x="28" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="98" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot1" x="182" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="252" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot2" x="336" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="406" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot3" x="490" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="560" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot4" x="644" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="714" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot5" x="798" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="868" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot6" x="952" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1022" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot7" x="1106" y="350">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1176" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="98" y="392">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="knobBot0" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="knob_bot_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot1" outlet="out"/>
         <dest obj="knob_bot_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot2" outlet="out"/>
         <dest obj="knob_bot_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot3" outlet="out"/>
         <dest obj="knob_bot_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot4" outlet="out"/>
         <dest obj="knob_bot_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot5" outlet="out"/>
         <dest obj="knob_bot_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot6" outlet="out"/>
         <dest obj="knob_bot_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobBot7" outlet="out"/>
         <dest obj="knob_bot_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop0" outlet="out"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="knob_top_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop2" outlet="out"/>
         <dest obj="knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop3" outlet="out"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop4" outlet="out"/>
         <dest obj="knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop5" outlet="out"/>
         <dest obj="knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop6" outlet="out"/>
         <dest obj="knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop7" outlet="out"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="knobTop1" outlet="out"/>
         <dest obj="knob_top_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="Knobs_and_LEDs_1" outlet="out3_"/>
         <dest obj="i_1" inlet="in"/>
         <dest obj="hex_1" inlet="in"/>
      </net>
      <net>
         <source obj="Knobs_and_LEDs_1" outlet="out2_"/>
         <dest obj="hex_2" inlet="in"/>
      </net>
      <net>
         <source obj="i_2" outlet="out"/>
         <dest obj="Knobs_and_LEDs_1" inlet="step_"/>
      </net>
      <net>
         <source obj="dial_3" outlet="out"/>
         <dest obj="div_1" inlet="in"/>
         <dest obj="Knobs_and_LEDs_1" inlet="in1_"/>
      </net>
      <net>
         <source obj="div_1" outlet="out"/>
         <dest obj="dial_4" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2091</x>
      <y>199</y>
      <width>1312</width>
      <height>625</height>
   </windowPos>
</patch-1.0>