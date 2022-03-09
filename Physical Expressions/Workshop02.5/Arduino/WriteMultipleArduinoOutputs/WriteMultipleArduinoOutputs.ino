/*
  Test code for the Arduino Uno
  Written by Tom Bonar for testing
  Sensors being used for this code are the MB10X0 from MaxBotix
  All PW inputs are coded in this for simplicity.
  Remove the comments to use the additional sensor inputs

  Sketch adapted by Jen Sykes for 3 comma separated sensor values to be sent to Processing.
*/
int sensorPin1 = A0;
int sensorPin2 = A1;
int sensorPin3 = A2;
long sensor1, sensor2, sensor3;

void setup () {
  Serial.begin(9600);
}

void read_sensor() {


  sensor1 = analogRead(sensorPin1);
  sensor2 = analogRead(sensorPin2);
  sensor3 = analogRead(sensorPin3);

}



//This section of code is if you want to print the range readings to your computer too remove this from the code put /* before the code section and */ after the code
void printall() {
  Serial.print(sensor1);
  Serial.print(","); //note the separation by a comma.
  //This is important so Processing can read it correctly!
  Serial.print(sensor2);
  Serial.print(",");
  Serial.println(sensor3); //important the last value is println not print!

}

void loop () {
  read_sensor();
  printall();
  delay(100); // This delay time changes by 50 for every sensor in the chain.  For 5 sensors this will be 250
}
