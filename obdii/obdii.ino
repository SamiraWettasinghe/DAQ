/* OBD2 UART Interface Code */
#include <SPI.h>
#include <mcp_can.h>

char rxData[20];
char rxIndex = 0;

int vehSpeed = 0;
int rpm = 0;
int tps = 0;

MCP_CAN CAN(10);
byte high = 0x00;
byte low = 0x00;
byte data[8] = {0, 0, 0, 0, 0, 0, 0, 0};

void setup() {

  /* Set up OBD-II Comms */
  Serial.begin(9600);
  delay(1500);
  Serial.println("ATZ");
  delay(2000);
  Serial.flush();

  /* Set up Mega CAN Comms */
  while (CAN_OK != CAN.begin(CAN_500KBPS))
  {
    // do nothing
    delay (2000);
  }
}

void loop() {
  Serial.flush();
  Serial.println("010D"); // vehicle speed PID
  getResponse();
  getResponse();

  vehSpeed = strtol(&rxData[6],0,16);
  delay(100);

  Serial.flush();
  Serial.println("010C"); // vehicle RPM
  getResponse();
  getResponse();
  
  rpm = ((strtol(&rxData[6],0,16)*256)+strtol(&rxData[9],0,16))/4; // RPM is two bytes long
  delay(100);

  // send data over CAN
  data[0] = (byte)vehSpeed;
  data[1] = highByte(rpm);
  data[2] = lowByte(rpm);

  CAN.sendMsgBuf(0x05, 0, 8, data);
  delay(100);
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
