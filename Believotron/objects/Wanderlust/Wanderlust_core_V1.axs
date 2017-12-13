<patch-1.0 appVersion="1.0.12">
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_5" x="532" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_0" x="658" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_6" x="532" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_1" x="658" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_7" x="532" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_2" x="658" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_8" x="532" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_3" x="658" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/load fn" uuid="12a194acdd5b94470e044f98e8e025d0dac65e18" name="load_1" x="938" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Reverse Knobs" x="70" y="154">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gpio/spi/config" uuid="d3e75d8a02e2ccabbbc2af3bc2fcdb8ea65a6133" name="config_1" x="252" y="154">
      <params/>
      <attribs>
         <combo attributeName="clock_polarity" selection="CPOL=0"/>
         <combo attributeName="clock_phase" selection="CPHA=0"/>
         <combo attributeName="baudrate" selection="FPCLK/64"/>
         <combo attributeName="format" selection="LSB first"/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_9" x="532" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_4" x="658" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_10" x="532" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_5" x="658" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/i2c/config" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="266" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_11" x="532" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_6" x="658" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_1" x="1120" y="252">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=""/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_12" x="532" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="knob_top_7" x="658" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_1" x="14" y="308">
      <params/>
      <attribs>
         <table attributeName="str" table="THISSHITZBANNAN"/>
      </attribs>
   </obj>
   <obj type="script/BelievotronCore_PCB1005_KnobCore" uuid="dea40d4c-0e25-49d0-993a-55866aabd090" name="BelievotronCore_PCB1005_KnobCore_1" x="266" y="308">
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
#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\OLED\\OLED_SSD1306.cpp"


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

	// OLED setup:
	txbuf[0]=0;
	txbuf[1]=0xAE;
	chThdSleepMilliseconds(10);
	OLEDInit();
	OLED_setstring();
	//OLED_Sandbox();
	OLEDDisplay();
	

}
void loop(void)
{	
	
	
	readADCAndOutput(GPIOB, 7, 0);		
	readADCAndOutput(GPIOB, 6, 1);
	chThdSleepMilliseconds(1); 	

// Debug - TBD enable with switch, and perform without loss of audio processing

//	static int iOLED=0;	
//	iOLED++;
//	if (iOLED==2000)
//	{
//		OLEDInit();
//		//OLED_Sandbox();
//		OLED_setstring();
//		OLEDDisplay();
//		iOLED=0;
//	}

	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_2" x="14" y="378">
      <params/>
      <attribs>
         <table attributeName="str" table="What  Spaces?123"/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_13" x="672" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY0_Y" x="812" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_1" x="518" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY0_X" x="728" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_3" x="14" y="448">
      <params/>
      <attribs>
         <table attributeName="str" table="This is fun"/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_14" x="672" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY1_Y" x="812" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_4" x="14" y="518">
      <params/>
      <attribs>
         <table attributeName="str" table="Super Fun"/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_2" x="518" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY1_X" x="728" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_5" x="14" y="588">
      <params/>
      <attribs>
         <table attributeName="str" table="Second Column"/>
      </attribs>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_15" x="672" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY2_Y" x="812" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_3" x="518" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY2_X" x="728" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_16" x="672" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY3_Y" x="812" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/unipolar2bipolar" uuid="efc8ee28c508740c5edf7995eaaa07a6d6818e5e" name="unipolar2bipolar_4" x="518" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="JOY3_X" x="728" y="756">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="1218" y="826" text="tbd scale volume out"/>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_3" x="1050" y="840">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PA1 (ADC1_IN1)"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="Volume" x="1428" y="868">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/digital" uuid="f59f139e8da912742832dc541157f20f30b7ac1b" name="digital_2" x="1050" y="966">
      <params/>
      <attribs>
         <combo attributeName="pad" selection="PC1"/>
         <combo attributeName="mode" selection="pullup"/>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="JOY0_BTN" x="1428" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_1" x="1204" y="980">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/digital" uuid="f59f139e8da912742832dc541157f20f30b7ac1b" name="digital_4" x="1050" y="1050">
      <params/>
      <attribs>
         <combo attributeName="pad" selection="PC2"/>
         <combo attributeName="mode" selection="pullup"/>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="JOY1_BTN" x="1428" y="1050">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_5" x="1204" y="1064">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/digital" uuid="f59f139e8da912742832dc541157f20f30b7ac1b" name="digital_5" x="1050" y="1134">
      <params/>
      <attribs>
         <combo attributeName="pad" selection="PC3"/>
         <combo attributeName="mode" selection="pullup"/>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="JOY2_BTN" x="1428" y="1134">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_6" x="1204" y="1148">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/digital" uuid="f59f139e8da912742832dc541157f20f30b7ac1b" name="digital_6" x="1050" y="1218">
      <params/>
      <attribs>
         <combo attributeName="pad" selection="PC4"/>
         <combo attributeName="mode" selection="pullup"/>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="JOY3_BTN" x="1428" y="1218">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_7" x="1204" y="1232">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Reverse Knobs" outlet="o"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="reverseKnobs_"/>
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
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT0_"/>
         <dest obj="unipolar2bipolar_5" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT1_"/>
         <dest obj="unipolar2bipolar_6" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT2_"/>
         <dest obj="unipolar2bipolar_7" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT3_"/>
         <dest obj="unipolar2bipolar_8" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT4_"/>
         <dest obj="unipolar2bipolar_9" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT5_"/>
         <dest obj="unipolar2bipolar_10" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT6_"/>
         <dest obj="unipolar2bipolar_11" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbT7_"/>
         <dest obj="unipolar2bipolar_12" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB0_"/>
         <dest obj="unipolar2bipolar_13" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB2_"/>
         <dest obj="unipolar2bipolar_14" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB4_"/>
         <dest obj="unipolar2bipolar_15" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB6_"/>
         <dest obj="unipolar2bipolar_16" inlet="i"/>
      </net>
      <net>
         <source obj="digital_4" outlet="out"/>
         <dest obj="inv_5" inlet="i"/>
      </net>
      <net>
         <source obj="inv_5" outlet="o"/>
         <dest obj="JOY1_BTN" inlet="outlet"/>
      </net>
      <net>
         <source obj="digital_5" outlet="out"/>
         <dest obj="inv_6" inlet="i"/>
      </net>
      <net>
         <source obj="inv_6" outlet="o"/>
         <dest obj="JOY2_BTN" inlet="outlet"/>
      </net>
      <net>
         <source obj="digital_6" outlet="out"/>
         <dest obj="inv_7" inlet="i"/>
      </net>
      <net>
         <source obj="inv_7" outlet="o"/>
         <dest obj="JOY3_BTN" inlet="outlet"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB1_"/>
         <dest obj="unipolar2bipolar_1" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB3_"/>
         <dest obj="unipolar2bipolar_2" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB5_"/>
         <dest obj="unipolar2bipolar_3" inlet="i"/>
      </net>
      <net>
         <source obj="BelievotronCore_PCB1005_KnobCore_1" outlet="knbB7_"/>
         <dest obj="unipolar2bipolar_4" inlet="i"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_5" outlet="o"/>
         <dest obj="knob_top_0" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_6" outlet="o"/>
         <dest obj="knob_top_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_7" outlet="o"/>
         <dest obj="knob_top_2" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_8" outlet="o"/>
         <dest obj="knob_top_3" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_9" outlet="o"/>
         <dest obj="knob_top_4" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_10" outlet="o"/>
         <dest obj="knob_top_5" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_11" outlet="o"/>
         <dest obj="knob_top_6" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_12" outlet="o"/>
         <dest obj="knob_top_7" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_1" outlet="o"/>
         <dest obj="JOY0_X" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_2" outlet="o"/>
         <dest obj="JOY1_X" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_3" outlet="o"/>
         <dest obj="JOY2_X" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_4" outlet="o"/>
         <dest obj="JOY3_X" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_16" outlet="o"/>
         <dest obj="JOY3_Y" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_15" outlet="o"/>
         <dest obj="JOY2_Y" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_14" outlet="o"/>
         <dest obj="JOY1_Y" inlet="outlet"/>
      </net>
      <net>
         <source obj="unipolar2bipolar_13" outlet="o"/>
         <dest obj="JOY0_Y" inlet="outlet"/>
      </net>
      <net>
         <source obj="c_1" outlet="out"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="OLEDA0_"/>
      </net>
      <net>
         <source obj="c_2" outlet="out"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="OLEDA1_"/>
      </net>
      <net>
         <source obj="c_3" outlet="out"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="OLEDA2_"/>
      </net>
      <net>
         <source obj="c_4" outlet="out"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="OLEDA3_"/>
      </net>
      <net>
         <source obj="c_5" outlet="out"/>
         <dest obj="BelievotronCore_PCB1005_KnobCore_1" inlet="OLEDB0_"/>
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
      <x>-8</x>
      <y>-8</y>
      <width>1514</width>
      <height>1014</height>
   </windowPos>
</patch-1.0>