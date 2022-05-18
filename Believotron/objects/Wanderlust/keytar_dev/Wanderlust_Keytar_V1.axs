<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Reverse Knobs" x="70" y="56">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gpio/spi/config" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="252" y="56">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="gpio/i2c/config" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="266" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="518" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="602" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="686" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="770" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="854" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="938" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="1022" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="1106" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="script/Believotron_PCB1006_Fader8" uuid="84d6730a-509c-4e51-a33b-624846116bb1" name="Believotron_PCB1006_Fader8_1" x="252" y="224">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);


// TBD, figure out cross platform solution to relative directories

#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\knobs.c"


// <SPI stuff - knobs, mostly>
// Turns all the SPI chip selects off
void SPI_CS_ALL_OFF()
{
	// Disable Chip Select	
	palWritePad(GPIOB,7,1);  // Knob, Top Row
	palWritePad(GPIOB,6,1);	// Knob, Bottom Row
	
}
// </SPI stuff>

// Default Voodoo to make serial communication working; Rabbithole of shared memory
void LinkTxRxBuffers(void)
{
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
}

void setup(void) 
{
	chThdSleepMilliseconds(1000); 
	LinkTxRxBuffers();

	// enable and reset SPI Chip selects
	{
		// Setup Knob Top
		palSetPadMode(GPIOB,7,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
		// Setup Knob Bottom
		palSetPadMode(GPIOB,6,PAL_MODE_OUTPUT_PUSHPULL);        // MCP3208
	
		SPI_CS_ALL_OFF();	
	}
	
	out1 = 0xABBA;
	
	rxbuf[0] = 0;	
	txbuf[0] = 0; // CAP1188_PRODID;


	out2 = 0xBEEF;
	out3 = 0xABBA;

}
void loop(void)
{	
	readADCAndOutput(GPIOB, 7, 0);		
	//readADCAndOutput(GPIOB, 6, 1);
	chThdSleepMilliseconds(1); 	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <comment type="patch/comment" x="658" y="616" text="tbd scale volume out"/>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_3" x="490" y="630">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PA1 (ADC1_IN1)"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="Volume" x="840" y="630">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="504" y="728" text="tbd scale volume out"/>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_4" x="504" y="742">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC0 (ADC1_IN10)"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOYX" x="854" y="742">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="504" y="812" text="tbd scale volume out"/>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_5" x="504" y="826">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC1 (ADC1_IN11)"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOYY" x="854" y="826">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/digital" uuid="f59f139e8da912742832dc541157f20f30b7ac1b" name="digital_2" x="490" y="896">
      <params/>
      <attribs>
         <combo attributeName="pad" selection="PB0"/>
         <combo attributeName="mode" selection="pullup"/>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="JOY0_BTN" x="868" y="896">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_1" x="644" y="910">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Reverse Knobs" outlet="o"/>
         <dest obj="Believotron_PCB1006_Fader8_1" inlet="reverseKnobs_"/>
      </net>
      <net>
         <source obj="analog_3" outlet="out"/>
         <dest obj="Volume" inlet="outlet"/>
      </net>
      <net>
         <source obj="digital_2" outlet="out"/>
         <dest obj="inv_1" inlet="i"/>
      </net>
      <net>
         <source obj="inv_1" outlet="o"/>
         <dest obj="JOY0_BTN" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT0_"/>
         <dest obj="knob_top_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT1_"/>
         <dest obj="knob_top_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT2_"/>
         <dest obj="knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT4_"/>
         <dest obj="knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT3_"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT5_"/>
         <dest obj="knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT6_"/>
         <dest obj="knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="Believotron_PCB1006_Fader8_1" outlet="knbT7_"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_4" outlet="out"/>
         <dest obj="JOYX" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_5" outlet="out"/>
         <dest obj="JOYY" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>0</NPresets>
      <NPresetEntries>0</NPresetEntries>
      <NModulationSources>0</NModulationSources>
      <NModulationTargetsPerSource>0</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-79</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>