<patch-1.0 appVersion="1.0.12">
   <obj type="OLED/OLED_Test" uuid="9820e042-d578-4400-9e5d-fe9aa1d4efdc" name="OLED_Test_1" x="476" y="140">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[int cnt = 1;
bool gate = 1;
uint8_t *rxbuf;
uint8_t *txbuf;
systime_t tmo = MS2ST(4);


// TBD, figure out cross platform solution to relative directories

//#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\knobs.c"
//#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\led.c"
//#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\padcaps.c"

#include "C:\\Program Files (x86)\\Arduino\\libraries\\Adafruit_SSD1306\\Adafruit_SSD1306.h"
#include "C:\\Program Files (x86)\\Arduino\\libraries\\Adafruit-GFX-Library\Adafruit_GFX.h"












// Default Voodoo to make serial communication working; Rabbithole of shared memory
void LinkTxRxBuffers(void)
{
	static uint8_t _txbuf[8] __attribute__ ((section (".sram2")));
	static uint8_t _rxbuf[8] __attribute__ ((section (".sram2")));
	txbuf = _txbuf;
	rxbuf = _rxbuf;
}



void setup(void) {




}
void loop(void)
{	
	
	chThdSleepMilliseconds(1); 
	
}
]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="gpio/i2c/config" uuid="b095a33e56de5fcd23740a7d983bc0bafb315d81" name="i2c.begin_1" x="84" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLX" x="1890" y="840">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_3" x="1736" y="882">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_4" x="1736" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLY" x="1890" y="980">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="mux_3" outlet="o"/>
         <dest obj="joyLX" inlet="outlet"/>
      </net>
      <net>
         <source obj="mux_4" outlet="o"/>
         <dest obj="joyLY" inlet="outlet"/>
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
      <x>-1449</x>
      <y>101</y>
      <width>976</width>
      <height>531</height>
   </windowPos>
</patch-1.0>