#include <Arduino.h>
//#include <TwoWire.h>

#include <SoftWire.h>
#include <SoftwireI2CTest.h>

SoftWire SWire(PB6, PB7, SOFT_FAST);


#define LED_BUILTIN PC13

//TwoWire myWire(PB9, PB8, SOFT_FAST);

void setup()
{
    // put your setup code here, to run once:
    pinMode(LED_BUILTIN, OUTPUT);

    SWire.begin();
    SoftWireI2CTest(SWire);

    //OLEDInit();
	//OLED_setstring();
	//OLED_Sandbox();
	//OLEDDisplay();
}

void loop()
{
    //heartbeat(3000);
    heartbeat(1000);

}
