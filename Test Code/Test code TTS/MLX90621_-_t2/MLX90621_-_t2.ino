#include <MLX90621.h>
#include <Wire.h>
int refresh_rate = 16;
MLX90621 sensor;

float temperatures[64];
double temp = 0.0;
long time_taken;
long start_time;

void setup() {
  Serial.begin(115200);
  Serial.println("Starting MLX90621 thermopile sensor");
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);

  Wire.begin();
  sensor.initialise(refresh_rate);
}

void loop() {
  start_time = millis();
  sensor.get_temperatures(temperatures);
  for (int x = 0; x < 16; x++) {
    temp = 0;
    for (int y = 0; y < 4; y++) {
      temp += temperatures[y * refresh_rate + x];
    }
    temp = temp / 4;
    Serial.print(temp, 2);
    Serial.print(", ");
  }
  //    for(int y=0;y<64;y+=16){ //go through all the rows
  //        Serial.print('[');
  //        for(int x=0;x<16;x++){ //go through all the columns
  //            Serial.print(temperatures[y+x], 2);
  //
  //            if (x < 15) {
  //                Serial.print(", ");
  //            }
  //        }

  digitalWrite(13, LOW);
  Serial.print(sensor.get_ambient_temperature());
  Serial.print(',');
  time_taken = millis() - start_time;
  Serial.print(time_taken);
  
  Serial.println("]");
  delay(1);
}
