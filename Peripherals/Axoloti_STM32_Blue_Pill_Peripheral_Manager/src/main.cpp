#include <Arduino.h>
//#include <TwoWire.h>

#define LED_BUILTIN PC13

//TwoWire myWire(PB9, PB8, SOFT_FAST);

void setup()
{
    // put your setup code here, to run once:
    pinMode(LED_BUILTIN, OUTPUT);
}


void hearbeat(int iDelay)
{
    // put your main code here, to run repeatedly:
    digitalWrite(LED_BUILTIN, HIGH);

    delay(iDelay);

    digitalWrite(LED_BUILTIN, LOW);

    delay(iDelay);
}


void loop()
{
    hearbeat(3000);
}
