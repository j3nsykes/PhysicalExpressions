void setup() {
  setupSerial(3);//setup the serial 
}


void draw() {
  getSensorInput(); //get the data
  background(0);
  textAlign(LEFT, TOP);
  textSize(18);  
  fill(255);
  text(nfs(int(sensorIntReading), 3) +" cm", 20, 20);
}
