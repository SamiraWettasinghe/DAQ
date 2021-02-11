#include <MLX90621.h>
#include <Wire.h>
int refresh_rate = 16;
MLX90621 sensor;

float temperatures[64];
double temp = 0.0;
double temp_in=0.0;
double temp_mid=0.0;
double temp_out=0.0;
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
  temp_in = 0;
  temp_mid = 0;
  temp_out = 0;
  for (int x = 0; x < 16; x++) {
    temp = 0;
    for (int y = 0; y < 4; y++) {
      temp += temperatures[y * refresh_rate + x];
    }
    temp = temp / 4;
    Serial.print(temp, 2);
    Serial.print(", ");
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
Serial.print(sensor.get_ambient_temperature());
Serial.print(',');
time_taken = millis() - start_time;
Serial.print(time_taken);

Serial.println("]");
delay(1);
}
