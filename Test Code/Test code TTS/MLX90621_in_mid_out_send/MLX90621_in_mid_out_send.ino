#include <I2cMaster.h>
#include <TwiMap.h>

#include <MLX90621.h>
#include <Wire.h>
#define HEADER 0xFF
int refresh_rate = 16;
MLX90621 sensor;

float temperatures[64];
double temp = 0.0;
double temp_in = 0.0;
double temp_mid = 0.0;
double temp_out = 0.0;
long time_taken;
long start_time;
boolean sendData = false;
byte messageRequest = 0;

String stringVal = "";


void setup() {
  Wire.begin();
  sensor.initialise(refresh_rate);
  Serial.begin(115200);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
}

void loop() {
  while ((Serial.available() > 0) && (!sendData)) {
    messageRequest = Serial.read();
    if (messageRequest == 'a') {
      sendData = true;


      readSensor();
//      // HEADER is FF
//      Serial.write(HEADER);
//      delay(2);
//
//      // FROM
//      Serial.write(0x95);
//      delay(2);
      // DATA payload

      stringVal = String(int(temp_in)); //combining both whole and decimal part in string with a full                                                                      //stop between them
      Serial.print(stringVal + ",");             //display string value
      delay(2);

      stringVal = String(int(temp_mid)); //combining both whole and decimal part in string with a full                                                                      //stop between them
      Serial.print(stringVal + ",");
      delay(2);

      stringVal = String(int(temp_out)); //combining both whole and decimal part in string with a full                                                                      //stop between them
      Serial.println(stringVal + ",");
      delay(2);
      // TO
      //Serial.write(0xA3);
      delay(2);

      sendData = false;

    }
  }
}


void readSensor() {
  start_time = millis();
  sensor.get_temperatures(temperatures);
  temp_in = 0;
  temp_mid = 0;
  temp_out = 0;
  for (int x = 0; x < 16; x++) {
    temp = 0;
    for (int y = 0; y < 4; y++) {
      temp += temperatures[y * refresh_rate + x];
    }
    temp = temp / 4;
    if (x < 4) {
      temp_in += temp;
    }
    else if (x > 10) {
      temp_out += temp;
    }
    else {
      temp_mid += temp;
    }
  }

  temp_in = temp_in / 5;
  temp_mid = temp_mid / 6;
  temp_out = temp_out / 5;
  digitalWrite(13, LOW);
  time_taken = millis() - start_time;
  delay(1);
}
