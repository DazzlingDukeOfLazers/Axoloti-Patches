#include <Arduino.h>
#undef max
#undef min
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


    //SoftWireI2CTest(SWire);``


    OLEDInit();
	//OLED_setstring();
	OLED_Sandbox();
	OLEDDisplay();
}

void heartbeat(int iDelay)
{
    // put your main code here, to run repeatedly:
    digitalWrite(LED_BUILTIN, HIGH); // LED OFF

    delay(iDelay);

    digitalWrite(LED_BUILTIN, LOW); // LED ON

    delay(iDelay);
}

void loop()
{
    //heartbeat(3000);
    heartbeat(1000);

}
