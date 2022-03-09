
int dcMotorPin = 6;

void setup() {
  // put your setup code here, to run once:
pinMode(6,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(6,HIGH);
delay(500);
digitalWrite(6,LOW);
delay(500);

/*
analogWrite(6,80); //speed control 
delay(500);
analogWrite(6,0);
delay(500);
*/
}
