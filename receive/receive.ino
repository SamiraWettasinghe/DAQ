int incomingByte = 0;

void setup()
{
  // Serial port init for debug
  Serial.begin(9600);
  if (Serial.available() > 0) {
    Serial.println("Serial monitor available");
  }

  Serial1.begin(9600);
  pinMode(22, OUTPUT);
}

void loop()
{
  digitalWrite(22, LOW);
  if (Serial1.available() > 0){
    incomingByte = Serial1.read();
    Serial.print(incomingByte);
  }
  delay(2);
}
