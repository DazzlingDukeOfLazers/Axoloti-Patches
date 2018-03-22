// SoftWire SWire(PB6, PB7, SOFT_FAST);

// SWire.begin();
#include <Softwire.h>
#include <Arduino.h>

#define LED_BUILTIN PC13

void SetDebugLEDOn()
{
    digitalWrite(LED_BUILTIN, LOW);
}

void SetDebugLEDOff()
{
    digitalWrite(LED_BUILTIN, HIGH);
}

void heartbeat(int iDelay)
{
    // put your main code here, to run repeatedly:
    digitalWrite(LED_BUILTIN, HIGH); // LED OFF

    delay(iDelay);

    digitalWrite(LED_BUILTIN, LOW); // LED ON

    delay(iDelay);
}

void blinkStart(int iNumBlinks, int iBlinkDelay)
{
    for (int i=0; i<iNumBlinks; i++) {heartbeat(iBlinkDelay);}
}



void SoftWireI2CTest( SoftWire SWire )
//void SoftWireI2CTest(  )
{
  byte error, address;
  int nDevices;
  int iMode = 0;
  blinkStart(10, 200);
  //Serial.println("Scanning...");



  nDevices = 0;
  if(1)//for(address = 1; address < 127; address++)
  {
      address = 0x3C;

    // The i2c_scanner uses the return value of
    // the Write.endTransmisstion to see if
    // a device did acknowledge to the address.

    SWire.beginTransmission(address);
    error = SWire.endTransmission();

    if (error == 0)
    {
      //Serial.print("I2C device found at address 0x");
      //if (address < 16)
        //Serial.print("0");
     // Serial.println(address, HEX);
        iMode = 1;
        nDevices++;
    }
    else if (error == 4)
    {
        iMode = 2;
     // Serial.print("Unknown error at address 0x");
      //if (address < 16)
        //Serial.print("0");
      //Serial.println(address, HEX);
    }
  }

  if (iMode == 1)
  {
      while(1)
      {
          blinkStart(4,200);
          delay(2000);
      }
  }
  if (iMode == 2)
  {
      while(1)
      {
          blinkStart(2,200);
          delay(2000);
      }
  }
  //if (nDevices == 0)
    //Serial.println("No I2C devices found");
 //else
    //Serial.println("done");


  //delay(5000);           // wait 5 seconds for next scan
}
