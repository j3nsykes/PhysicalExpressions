
/*
Simplified Code provided by jen Sykes. 
 References the DMXSimple library by Paul Stoffregen which is uploaded to an Arduino with DMX output
 https://github.com/PaulStoffregen/DmxSimple
 
 Processing code references example by Peter Knight 
 http://www.tinker.it 05 Mar 2009
 
 
 Some DMX lights commands...
 Showtech Sunstrip:
 channel = bulb
 intensity 0-255
 
 
 Analog Dimmer Box:
 channel 1 =0-255 values
 channel 2 =0-255 values
 channel 3 =0-255 values
 channel 4 =0-255 values
 
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
String DMXPRO_PORT="/dev/cu.usbserial-EN268074";//case matters ! on windows port must be upper cased. //this might be usbmodem...on Mac 
int DMXPRO_BAUDRATE=115000;


float diameter; 
float angle = 0;
int value; //dmx variables
int channel;
int data; // create a variable to hold the data we are sending to the Arduino



void setup() {
  printArray(Serial.list()); // shows available serial ports on the system 

  dmxOutput=new DmxP512(this, universeSize, false);


  if (DMXPRO) {
    dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
  }

  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);
  //find out what channel and values these require.

  size(640, 360);
  diameter = height - 10;
  noStroke();
  fill(255, 204, 0);
  dmxOutput.set(1, 255);
}

void draw() {

  background(0);

  //  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  // float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;

  //  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  //ellipse(width, height/2, d3, d3);

  angle += 0.02;
  data=int(d2);
  //println(d2);
  float newData=map(data, 10, 360, 0, 255);

  dmxOutput.set(1, int(newData));


  delay(20); // Short pause before repeating
}
