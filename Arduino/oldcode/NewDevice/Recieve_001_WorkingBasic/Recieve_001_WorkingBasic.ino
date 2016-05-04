/* YourDuinoStarter Example: nRF24L01 Receive Joystick values

 - WHAT IT DOES: Receives data from another transceiver with
   2 Analog values from a Joystick or 2 Potentiometers
   Displays received values on Serial Monitor
 - SEE the comments after "//" on each line below
 - CONNECTIONS: nRF24L01 Modules See:
 http://arduino-info.wikispaces.com/Nrf24L01-2.4GHz-HowTo
   1 - GND
   2 - VCC 3.3V !!! NOT 5V
   3 - CE to Arduino pin 9
   4 - CSN to Arduino pin 10
   5 - SCK to Arduino pin 13
   6 - MOSI to Arduino pin 11
   7 - MISO to Arduino pin 12
   8 - UNUSED
   
 - V1.00 11/26/13
   Based on examples at http://www.bajdi.com/
   Questions: terry@yourduino.com */

/*-----( Import needed libraries )-----*/
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
/*-----( Declare Constants and Pin Numbers )-----*/
#define CE_PIN   9
#define CSN_PIN 10

// NOTE: the "LL" at the end of the constant is "LongLong" type
const uint64_t pipe = 0xE8E8F0F0E1LL; // Define the transmit pipe


/*-----( Declare objects )-----*/
RF24 radio(CE_PIN, CSN_PIN); // Create a Radio
/*-----( Declare Variables )-----*/
int str[9];  // 2 element array holding Joystick readings

void setup()   /****** SETUP: RUNS ONCE ******/
{
  Serial.begin(115200);
  delay(1000);
  Serial.println("Nrf24L01 Receiver Starting");
  radio.begin();
  radio.openReadingPipe(1,pipe);
  radio.startListening();;
}//--(end setup )---


void loop()   /****** LOOP: RUNS CONSTANTLY ******/
{
  if ( radio.available() )
  {
    while ( radio.available() )
{
// Dump the payloads until we’ve gotten everything
// Fetch the payload, and see if this was the last one.
//format X, Y, Z, Heading, Switch
  radio.read( str, sizeof(str) );
      //FORMAT: x-y-z-x2-y2-x-z2-lux-temp-GSR
      
      Serial.print("msg= ");
      Serial.print(str[0]);
      Serial.print(" ");      
      Serial.print(str[1]);
      Serial.print(" ");
      Serial.print(str[2]);
      Serial.print(" ");
      Serial.print(str[3]);
      Serial.print(" ");
      Serial.print(str[4]);
      Serial.print(" ");
      Serial.print(str[5]);
      Serial.println("     ");
      }
  }
  else
  {    
      //Serial.println("No radio available");
  }

}//--(end main loop )---

/*-----( Declare User-written Functions )-----*/

//NONE
//*********( THE END )***********

