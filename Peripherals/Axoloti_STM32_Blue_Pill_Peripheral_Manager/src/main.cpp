#include <Arduino.h>
//#include <TwoWire.h>


//#include <SoftwireI2CTest.h>
#include "OLED_SSD1306.h"
//#include "font_QuarterMuncher.cpp"




#define LED_BUILTIN PC13

//TwoWire myWire(PB9, PB8, SOFT_FAST);

void setup()
{
    //InitFontQuarterMuncher();
    // put your setup code here, to run once:
    pinMode(LED_BUILTIN, OUTPUT);


    //SoftWireI2CTest(SWire);


    OLEDInit();
	//OLED_setstring();
	OLED_Sandbox();
	OLEDDisplay();
}

void loop()
{
    //heartbeat(3000);
    //heartbeat(1000);

}
