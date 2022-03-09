
/*
 Case Switch example Code provided by jen Sykes. 
 References the DMXSimple library by Paul Stoffregen which is uploaded to an Arduino with DMX output
 https://github.com/PaulStoffregen/DmxSimple
 
 Processing code references example by Peter Knight 
 http://www.tinker.it 05 Mar 2009
 
 
 Some DMX lights commands...
 Showtech Sunstrip:
 channel= bulb number
 brightness 0-255
 
 Analog Dimmer Box:
 

 
 QTX Par Can 64
 channel 1= bulb on 
 channel 5 = red
 channel 6 = blue
 channel 7 = green 
 
 */
import dmxP512.*;
import processing.serial.*;

DmxP512 dmxOutput;
int universeSize=128;

boolean DMXPRO=true;
String DMXPRO_PORT="/dev/cu.usbserial-EN263607";//case matters ! on windows port must be upper cased. //this might be usbmodem...on Mac 
int DMXPRO_BAUDRATE=115000;

int value;//dmx value 
int channel; //dmx channel



void setup() { 


  size(256, 256); // Create a window
  //initialise communiction over serial
  dmxOutput=new DmxP512(this, universeSize, false);


  if (DMXPRO) {
    dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
  }

  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);
  //find out what channel and values these require.

  //method for setting multiple channels
  /*
  for (int i=0; i<5; i++) {
   channel=i;
   value=0;
    dmxOutput.set(channel, int(value));
   }
   */
}

void draw() { 

  //put channel and value changes inside each case 
  //then use the keys on your keyboard to cycle through the states. 
  //keys can be replaced with sensor values in similar methods to week01. 
  
  switch(key) {
  case 'a':
    channel=4;
    value=150;
    println("ONE");
    break;
  case 'b':

    channel=4;
    value=255;
    println("TWO");
    break;

  case 'c':

    channel=1;
    value=150;
    println("THREE");
    break;
  case 'd':

    channel=1;
    value=100;
    println("FOUR");
    break;

  case 'e':

    channel=2;
    value=100;
    println("FIVE");
    break;

  case 'f':

    channel=2;
    value=200;
    println("SIX");
    break;

  case 'g':

    channel=3;
    value=200;
    println("SEVEN");
    break;
  }

  dmxOutput.set(channel, int(value)); // Send new channel values to Arduino 
  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);

  delay(20); // Short pause before repeating
} 
