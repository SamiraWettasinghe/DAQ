
#include <MLX90621.h>
#include <Wire.h>
int refresh_rate = 16;
MLX90621 sensor;

float temperatures[64];

void setup(){
    Serial.begin(115200);
    Serial.println("Starting MLX90621 thermopile sensor");
    pinMode(13, OUTPUT);
    digitalWrite(13, HIGH);

    Wire.begin();
    sensor.initialise(refresh_rate);
}

void loop(){
    Serial.println("\n\nReading sensor...");

    long start_time = millis();
    sensor.get_temperatures(temperatures);
    long time_taken = millis() - start_time;

    Serial.print("Time taken: ");
    Serial.println(time_taken);

    for(int y=0;y<64;y+=16){ //go through all the rows
        Serial.print('[');
        for(int x=0;x<16;x++){ //go through all the columns
            Serial.print(temperatures[y+x], 2);

            if (x < 15) {
                Serial.print(", ");
            }
        }
        
        Serial.println(']');
    }
    digitalWrite(13, LOW);
    Serial.print("Ambient temperature: ");
    Serial.print(sensor.get_ambient_temperature());
    Serial.println("°C");
    delay(500);
}
