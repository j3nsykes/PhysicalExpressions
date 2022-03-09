
import processing.serial.*; // Import Serial library to talk to Arduino 


int data; // create a variable to hold the data we are sending to the Arduino 
float  intensityX, intensityY;
float l1=0;
int pressed;

Serial myPort; // Send value to Arduino // 


void setup() { 
  printArray(Serial.list()); // shows available serial ports on the system 

  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);
  background(0);
  size(500, 500); // Create a window
}

void draw() { 
  background(0);


  intensityX=map(mouseX, 0, width, 0, 190);
  intensityY=map(mouseY, 0, height, 0, 190);
  fill(255);
  textSize(14);
  text("intensityX"+nfc(intensityX,3)+'\n'+"intensityY"+nfc(intensityY,3),50,100);
  ellipse(intensityX,intensityY,20,20);
  pressed  = 0;
  if (mousePressed == true) {    
    pressed = 1;
  } else {                         
    pressed = 0;
  }
  if (pressed==1) {//only send if mouse Pressed 
    serialSend();
  }
} 

void serialSend() {
  //send the information out!

  myPort.write(int(intensityX)+","+int(intensityY)+'\n'); //simple send see how it ends with \n for new line!!!!
  // myPort.write(int(intensityX)+","+int(intensityY)+";");//more complex string  send
}
