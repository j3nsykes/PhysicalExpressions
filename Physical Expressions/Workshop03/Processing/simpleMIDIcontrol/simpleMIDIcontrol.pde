import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus
int channel, velocity, pitch, number;
float value;


void setup() {
  size(400, 400);
  background(60);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  //                   Parent In Out
  //                     |    |  |
  //1=Processing to Ableton
  myBus = new MidiBus(this, -1, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.
}

void draw() {
  channel = 0;
  velocity = 127;

  //just sending MIDI notes
  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  delay(2000);
  myBus.sendNoteOff(channel, pitch, 0); // Send a Midi nodeOff

  //sending control values 
  number = 1;
  /*
  Your control number needs to be asigned to the Ableton controller number
   http://www.indiana.edu/~emusic/etext/MIDI/chapter3_MIDI6.shtml
   eg:1=modulator wheel
   in Ableton you should see in MIDI mode CC1 show up. Click an effect to map to this. 
   test with mouse
   */
  value=map(mouseX, 0, width, 0, 127);//map within 127 MIDI value range. 
  myBus.sendControllerChange(channel, number, int(value)); // Send a controllerChange
  delay(20); //uses delay function below
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println("up");
      pitch=64;
    } else if (keyCode == DOWN) {
      println("down");
      pitch = 60; //change note for alternate control
    }
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
