void setup() {
  setupSerial(3);//setup the serial
}


void draw() {
  getSensorsInput(); //get the data
  background(0);
  textAlign(LEFT, TOP);
  textSize(18);  
  fill(255);
  text(nfs(int(sensor1), 3) +'\n'+nfs(int(sensor2), 3) +'\n'+nfs(int(sensor3), 3) +'\n', 20, 20);
}
