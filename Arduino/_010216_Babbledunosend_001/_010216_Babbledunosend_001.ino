/* YourDuinoStarter Example: nRF24L01 Transmit Joystick values
 - WHAT IT DOES: Reads Analog values on A0, A1 and transmits
   them over a nRF24L01 Radio Link to another transceiver.
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
   - 
   Analog Joystick or two 10K potentiometers:
   GND to Arduino GND
   VCC to Arduino +5V
   X Pot to Arduino A0
   Y Pot to Arduino A1
   
 - V1.00 11/26/13
   Based on examples at http://www.bajdi.com/
   Questions: terry@yourduino.com */

/*-----( Import needed libraries )-----*/
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

//I2C add
#include <Wire.h>
#include <BH1750.h>
#include <BMP085.h>
#include "I2Cdev.h"
#include "MPU6050.h"


/*-----( Declare Constants and Pin Numbers )-----*/
#define CE_PIN   9
#define CSN_PIN 10
#define ACCEL_X A0
#define ACCEL_Y A1
#define ACCEL_Z A2
#define GSR A3
#define OUTPUT_READABLE_ACCELGYRO

BMP085 barometer;

float temperature;
int32_t lastMicros;

// NOTE: the "LL" at the end of the constant is "LongLong" type
const uint64_t pipe = 0xE8E8F0F0E1LL; // Define the transmit pipe
int16_t ax, ay, az;
int16_t gx, gy, gz;

// I2C Add
BH1750 lightMeter;
MPU6050 accelgyro;


/*-----( Declare objects )-----*/
RF24 radio(CE_PIN, CSN_PIN); // Create a Radio
/*-----( Declare Variables )-----*/
int str[9];  // 2 element array holding Joystick readings. NOTE. EXTENDED.
void setup()   /****** SETUP: RUNS ONCE ******/
{
  Serial.begin(9600);
  radio.begin();
  // I2C Add
  lightMeter.begin();
  barometer.initialize();
  accelgyro.initialize();
  
  radio.openWritingPipe(pipe);
}//--(end setup )---


void loop()   /****** LOOP: RUNS CONSTANTLY ******/
{
  uint16_t lux = lightMeter.readLightLevel();
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
   // request temperature
    barometer.setControl(BMP085_MODE_TEMPERATURE);
    
    // wait appropriate time for conversion (4.5ms delay)
    lastMicros = micros();
    while (micros() - lastMicros < barometer.getMeasureDelayMicroseconds());

    // read calibrated temperature value in degrees Celsius
    temperature = barometer.getTemperatureC();
  str[0] = analogRead(ACCEL_X);
  str[1] = analogRead(ACCEL_Y);
  str[2] = analogRead(ACCEL_Z);
  str[3] = ax;
  str[4] = ay;
  str[5] = az;
  str[6] = lux;
  str[7] = int(temperature * 10);
  str[8] = analogRead(GSR);
  
  
  radio.write(str, sizeof(str) );

}//--(end main loop )---

/*-----( Declare User-written Functions )-----*/

//NONE
//*********( THE END )***********
