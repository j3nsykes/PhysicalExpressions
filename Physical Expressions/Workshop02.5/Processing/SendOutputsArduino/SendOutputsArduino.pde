
import processing.serial.*; // Import Serial library to talk to Arduino 

Serial myPort; // Send value to Arduino // 
int valueX, valueY;

void setup() { 
  printArray(Serial.list()); // shows available serial ports on the system 

  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);

  //canvas
  background(0);
  size(500, 500); // Create a window
}

void draw() { 
  background(0);
  valueX = int(map(mouseX, 0, width, 0, 180));
  valueY =int(map(mouseY, 0, height, 0, 180));

if(mousePressed==true){
 serialSend();
}
} 

//function to control sending data
void serialSend(){
 myPort.write(valueX+";"); //send 1 output to Arduino. Make sure you have the ";" deliminator !!!
  //myPort.write(valueX+","+valueY+";"); //send 2 outputs to Arduino
}


//void mousePressed(){
//value=int(random(180));
//}
