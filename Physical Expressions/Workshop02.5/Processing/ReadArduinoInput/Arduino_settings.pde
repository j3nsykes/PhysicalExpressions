import processing.serial.*;
String myString = null;
Serial myPort;  // The serial port
String lastSensorString = "";
int sensorIntReading = 0;
int lf = 10;    // Linefeed in ASCII



void setupSerial(int _portNum) {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[_portNum], 115200);
  myPort.clear();
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void getSensorInput() {
  if (myPort.available () > 0) {
    myString = myPort.readStringUntil(lf);
    if (myString != null) {
      String s = trim(myString); // READING!!!
      if (lastSensorString.equals(s) == false) { // NEW READING!!!
        lastSensorString = s; // remember this reading
        int newSensorIntReading = int(s); // convert it to integer to be useful
        if (newSensorIntReading != -1) { // Helps avoid random false positive input
          sensorIntReading = newSensorIntReading;
        }
      }
    }
  }
}
