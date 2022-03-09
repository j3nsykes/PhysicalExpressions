import processing.serial.*;
String myString = null;
Serial myPort;  // The serial port
float sensor1 = 0;        // red value
float sensor2 = 0;      // green value
float sensor3 = 0;       // blue value

int minThreshold=5; //set your min and max range for your sensor
int maxThreshold=60;// easier to change all the mapping inputs up here than in x amount of lines of code below. 





void setupSerial(int _portNum) {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[_portNum], 115200);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
}

//get the serial information. 
void getSensorsInput() {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n'); //new line

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // split the string on the commas and convert the resulting substrings
    // into an integer array:
    float[] sensors = float(split(inString, ","));
    // if the array has at least three elements, you know you got the whole
    // thing.  Put the numbers in the sensor variables:
    if (sensors.length >= 3) {
      // map them to the range 0-255:
      sensor1 = map(sensors[0], minThreshold, maxThreshold, 0, 255);
      sensor2 = map(sensors[1], minThreshold, maxThreshold, 0, 255);
      sensor3 = map(sensors[2], minThreshold, maxThreshold, 0, 255);
    }
  }
}
