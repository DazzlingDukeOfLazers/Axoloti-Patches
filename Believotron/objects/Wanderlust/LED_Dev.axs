<patch-1.0 appVersion="1.0.10">
   <obj type="gpio/spi/config" sha="62af644b09e7f654b36d66533da8ea5971ddb351" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="14" y="14">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <comment type="patch/comment" x="224" y="42" text="Believotron Wanderlust Knob and LED Object"/>
   <obj type="drj/seq/seq_clk_sync" uuid="de6909eb627413af5b43f97184c1306f4b3a4793" name="seq_clk_sync_1" x="42" y="126">
      <params>
         <int32 name="clockdiv" value="1"/>
         <bool32.tgl name="miditransport" value="0"/>
         <frac32.s.map name="tempo" value="0.0"/>
         <frac32.u.map name="gatelength" value="0.0"/>
         <int32 name="seqlength" value="0"/>
      </params>
      <attribs>
         <combo attributeName="clocksource" selection="Internal"/>
         <combo attributeName="device" selection="omni"/>
      </attribs>
   </obj>
   <obj type="Wanderlust/stepLFO" uuid="2711aa2c-4058-41c4-8bec-a9474cee6628" name="obj_2" x="952" y="126">
      <params>
         <frac32.s.map name="saw_1" value="-9.0"/>
         <int32 name="counter2_1" value="16"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_3" x="630" y="182">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/BPM_Counter" uuid="e83aa0b2-e56d-42d9-8ef0-9312d4a5a0e4" name="obj_1" x="336" y="196">
      <params>
         <frac32.s.map name="square_1" value="-28.0"/>
         <int32 name="counter2_1" value="4"/>
         <bool32.tgl name="toggle_1" value="0"/>
         <frac32.s.map name="stepSize" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="87617898f70d90033f8add921438bf0d11721fdd" name="hex_2" x="1428" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="966" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="784" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_1" x="1428" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/saw r" uuid="6f79e6694e3e4b26c8732e836e54962eaf88dd1a" name="saw_1" x="602" y="364">
      <params>
         <frac32.s.map name="pitch" value="-1.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="script/Knobs_and_LEDs" uuid="ebc31452-ca44-46f9-81ed-d12c11874806" name="Knobs_and_LEDs_1" x="1232" y="364">
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
	palWritePad(GPIOC,5,1);	// LED
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOA,4,1);	// Knob, Bottom Row
	
}

//#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\knobs.c"
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
   <obj type="math/&lt;" uuid="e1b31418165304d34c713638837722589dcacb6" name="&lt;_1" x="1078" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/to i" uuid="305966430ee86b5c3b8e18cde0c721657c558a87" name="to_1" x="882" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="1428" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_6" x="1008" y="434">
      <params>
         <int32 name="value" value="34"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_3" x="938" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/div 2" uuid="f14884de1baf3e615e12ee162a96a013eca76789" name="div_1" x="784" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="1386" y="504">
      <params>
         <int32 name="value" value="11"/>
      </params>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="sine_1" x="560" y="518">
      <params>
         <frac32.s.map name="pitch" value="-13.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/&gt;" uuid="a459588d6498caeb4daf3a07f9d5e9b4a657262f" name="&gt;_1" x="938" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/counter2" sha="520bfefaef89b5ba4deb2a4d79b4236f0b321489" uuid="d9536f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_1" x="1036" y="518">
      <params>
         <int32 name="maximum" onParent="true" value="16"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_4" x="1176" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_5" x="826" y="546">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop0" x="546" y="658">
      <params>
         <frac32.u.map name="value" value="17.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="616" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop1" x="700" y="658">
      <params>
         <frac32.u.map name="value" value="17.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="770" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop2" x="854" y="658">
      <params>
         <frac32.u.map name="value" value="58.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="924" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop3" x="1008" y="658">
      <params>
         <frac32.u.map name="value" value="53.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="1078" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop4" x="1162" y="658">
      <params>
         <frac32.u.map name="value" value="52.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="1232" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop5" x="1316" y="658">
      <params>
         <frac32.u.map name="value" value="33.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="1386" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop6" x="1470" y="658">
      <params>
         <frac32.u.map name="value" value="49.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1540" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobTop7" x="1624" y="658">
      <params>
         <frac32.u.map name="value" value="28.25"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1694" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="616" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot0" x="546" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_0" x="616" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot1" x="700" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_1" x="770" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot2" x="854" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_2" x="924" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot3" x="1008" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_3" x="1078" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot4" x="1162" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_4" x="1232" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot5" x="1316" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_5" x="1386" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot6" x="1470" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_6" x="1540" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" sha="501c30e07dedf3d701e8d0b33c3c234908c3388e" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="knobBot7" x="1624" y="798">
      <params>
         <frac32.u.map name="value" value="63.75"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_bot_7" x="1694" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="616" y="840">
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
         <source obj="dial_3" outlet="out"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="div_1" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="to_1" inlet="i"/>
      </net>
      <net>
         <source obj="to_1" outlet="o"/>
         <dest obj="i_3" inlet="in"/>
         <dest obj="&lt;_1" inlet="in1"/>
         <dest obj="&gt;_1" inlet="in1"/>
      </net>
      <net>
         <source obj="counter2_1" outlet="o"/>
         <dest obj="i_4" inlet="in"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="&gt;_1" inlet="in2"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="&lt;_1" inlet="in2"/>
      </net>
      <net>
         <source obj="&lt;_1" outlet="out"/>
         <dest obj="counter2_1" inlet="inc"/>
      </net>
      <net>
         <source obj="saw_1" outlet="wave"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="div_1" inlet="in"/>
      </net>
      <net>
         <source obj="obj_2" outlet="intensity"/>
         <dest obj="Knobs_and_LEDs_1" inlet="in1_"/>
      </net>
      <net>
         <source obj="obj_2" outlet="step"/>
         <dest obj="Knobs_and_LEDs_1" inlet="step_"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2039</x>
      <y>274</y>
      <width>1839</width>
      <height>1036</height>
   </windowPos>
</patch-1.0>