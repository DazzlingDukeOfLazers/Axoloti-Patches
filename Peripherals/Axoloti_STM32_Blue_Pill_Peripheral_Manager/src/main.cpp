#include <Arduino.h>
#undef max
#undef min
//#include <TwoWire.h>


//#include <SoftwireI2CTest.h>
#include "OLED_SSD1306.h"
//#include "font_QuarterMuncher.cpp"




#define LED_BUILTIN PC13

//TwoWire myWire(PB9, PB8, SOFT_FAST);

void heartbeat(int iDelay)
{
    // put your main code here, to run repeatedly:
    digitalWrite(LED_BUILTIN, HIGH); // LED OFF

    delay(iDelay);

    digitalWrite(LED_BUILTIN, LOW); // LED ON

    delay(iDelay);
}


void setup()
{
    //InitFontQuarterMuncher();
    // put your setup code here, to run once:
    pinMode(LED_BUILTIN, OUTPUT);

    Serial1.begin(9600);




    //SoftWireI2CTest(SWire);``


    OLEDInit();
	//OLED_setstring();
	OLED_Sandbox();
	OLEDDisplay();
}



void loop()
{
    int incomingByte = 0;
    if (Serial1.available() > 0) {
        // read the incoming byte:
        incomingByte = Serial1.read();
        //parseByte(incomingByte);
        parseUARTByte(incomingByte);
        heartbeat(10);

        // say what you got:
        //Serial.print("I received: ");
        //Serial.println(incomingByte, DEC);
    }
    //heartbeat(3000);


}
