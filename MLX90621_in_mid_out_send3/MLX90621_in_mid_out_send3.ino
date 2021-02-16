#include <MLX90621.h>
#include <Wire.h>

#define LED 7
#define LED_ON LOW
#define LED_OFF HIGH

#define IO 2
#define IO_TRANSMIT HIGH
#define IO_RECEIVE LOW

#define HEADER 0xFF
#define FL 0x95

int refresh_rate = 16;
MLX90621 sensor;

float temperatures[64];
double temp[3];
int tempAvg0;//Tin, Tmid, Tout
int tempAvg1;
int tempAvg2;
long time_taken;
long start_time;

boolean sendData = true;
byte messageRequest;
byte NANO = 0x95;//FL


void setup() {
  Wire.begin();
  sensor.initialise(refresh_rate);

  Serial.begin(115200);
  //LED
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LED_ON);
  delay(500);
  // DIP switch address
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);

  //assign address
  if (3) {
    NANO = 0x85;//FR
  }
  else if (4) {
    NANO = 0x75;//RR
  }  else if (5) {
    NANO = 0x65;//RL
  }
  delay(100);
  digitalWrite(LED, LED_OFF);
  
  // I/O control for serial comms
  pinMode(2, OUTPUT);
  digitalWrite(LED, LED_ON);
  delay(500);
  digitalWrite(LED, LED_OFF);
}

void readSensor() {
  digitalWrite(LED, LED_ON);
  start_time = millis();
  sensor.get_temperatures(temperatures);
  temp[1] = 0;
  temp[2] = 0;
  temp[3] = 0;
  for (int x = 1; x < 16; x++) {
    temp[0] = 0;
    for (int y = 0; y < 4; y++) {
      temp[0] += temperatures[y * refresh_rate + x];
    }
    temp[0] = temp[0] / 4;
    if (x < 6) {
      //Tin
      temp[1] += temp[0];
    }
    else if (x > 10) {
      //Tout
      temp[3] += temp[0];
    }
    else {
      //Tmid
      temp[2] += temp[0];
    }
  }
  // save AvgTemp as integer
  tempAvg0 = temp[1] / 5;
  tempAvg1 = temp[2] / 5;
  tempAvg2 = temp[3] / 5;

  time_taken = millis() - start_time;
  delay(1);
}
void loop() {
  digitalWrite(LED, LED_ON);
  
  digitalWrite(IO, IO_RECEIVE);
  if (sendData) {
    while ((Serial.available() > 0) ) {
      messageRequest = Serial.read();
      if (messageRequest == FL) {
        digitalWrite(LED, LED_OFF);
        digitalWrite(IO, IO_TRANSMIT);
        digitalWrite(LED, LED_ON);
        sendData = false;
        readSensor();
      }
    }
  }

  else if (!sendData) {
    digitalWrite(LED, LED_OFF);
    // HEADER is FF
    Serial.write(HEADER);
    delay(2);

    // FROM
    Serial.write(NANO);
    delay(2);

    // DATA payload
    Serial.write(highByte(tempAvg0));
    //delay(1);
    Serial.write(lowByte(tempAvg0));
    //delay(1);
    Serial.write(highByte(tempAvg1));
    //delay(1);
    Serial.write(lowByte(tempAvg1));
    //delay(1);
    Serial.write(highByte(tempAvg2));
    //delay(1);
    Serial.write(lowByte(tempAvg2));
    //delay(1);
    
    // end payload
    Serial.write(0x0f);
    //delay(2);
    digitalWrite(LED, LED_ON);
    sendData = true;
    Serial.flush();
    digitalWrite(IO, IO_RECEIVE);

  }
}
