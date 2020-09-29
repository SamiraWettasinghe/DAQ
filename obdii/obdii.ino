/* OBD2 UART Interface Code */

char rxData[20];
char rxIndex = 0;

int vehSpeed = 0;
int rpm = 0;
int tps = 0;

void setup() {
  Serial.begin(9600);
  delay(1000);
  Serial.println("Start");

  /* Set up OBD-II Comms */
  Serial1.begin(9600);
  delay(1500);
  Serial1.println("ATZ");
  delay(2000);
  Serial1.flush();
}

void loop() {
  Serial1.flush();
  Serial1.println("010D"); // vehicle speed PID
  getResponse();
  getResponse();

  vehSpeed = strtol(&rxData[6],0,16);
  delay(100);
  Serial.print("Speed: ");
  Serial.print(vehSpeed);

  Serial1.flush();
  Serial1.println("010C"); // vehicle RPM
  getResponse();
  getResponse();
  
  rpm = ((strtol(&rxData[6],0,16)*256)+strtol(&rxData[9],0,16))/4; // RPM is two bytes long
  delay(100);
  Serial.print(" RPM: ");
  Serial.print(rpm);
  Serial.println();
}

/* The getResponse function collects incoming data from the UART into the rxData buffer
and only exits when a carriage return character is seen. Once the carriage return
string is detected, the rxData buffer is null terminated (so we can treat it as a string)
and the rxData index is reset to 0 so that the next string can be copied. */
void getResponse(void){
  char inChar=0;
  
  while(inChar != '\r'){
    if(Serial.available() > 0){
      if(Serial.peek() == '\r'){
        inChar=Serial.read();
        rxData[rxIndex]='\0';
        rxIndex=0;
      }
      else{
        inChar = Serial.read();
        rxData[rxIndex++]=inChar;
      }
    }
  }
}
