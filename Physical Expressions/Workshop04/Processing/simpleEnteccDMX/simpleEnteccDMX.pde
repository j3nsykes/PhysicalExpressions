/*
for studio ParCans CX-3 make sure setting on physical light is 
 ADDR001
 and setting DMX 
 
 Channel 1 = intensity/brightness of red values = 0 - 255
 Channel 2 = intensity of green
 Channel 3 = intensity of blue
 Channel 4 = intensity of white
 */

import dmxP512.*;
import processing.serial.*;

DmxP512 dmxOutput;
int universeSize=128;

boolean DMXPRO=true;
String DMXPRO_PORT="/dev/cu.usbserial-EN268074";//case matters ! on windows port must be upper cased. //this might be usbmodem...on Mac 
int DMXPRO_BAUDRATE=115000;


void setup() {

  size(500, 500);  

  dmxOutput=new DmxP512(this, universeSize, false);


  if (DMXPRO) {
    dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
  }
}

void draw() {    
  int nbChannel1=1;  //define the DMX channel you wish to control
  int nbChannel2=3;  //define the DMX channel you wish to control
  background(0);


  float value = map(mouseX, 0, width, 0, 255); //control value going out (eg:brightness?) with mouseX
  dmxOutput.set(nbChannel1, int(value));

  float value2 = map(mouseY, 0, height, 0, 255); //control value going out (eg:brightness?) with mouseX
  dmxOutput.set(nbChannel2, int(value2));
  
  fill(value, 0, 0);
  rectMode(CENTER);
  rect(width/2, height/2, 300, 300);
}
