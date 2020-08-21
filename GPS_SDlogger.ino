#include "TinyGPS++.h"
#include "SoftwareSerial.h"
#include "SPI.h"
#include "SD.h"

File dataFile;
SoftwareSerial serial_connection(2, 3); //RX=pin 2, TX=pin 3
TinyGPSPlus gps;//This is the GPS object that will pretty much do all the grunt work with the NMEA data

void setup()
{
  Serial.begin(9600);//This opens up communications to the Serial monitor in the Arduino IDE
  serial_connection.begin(9600);//This opens up communications to the GPS
  Serial.println("GPS Start");//Just show to the monitor that the sketch has started
  if (!SD.begin(4)) {
    Serial.println("failed");
    // don't do anything more
  }
  else {
    Serial.println("ok");
  }
}

void loop() {

  //flushing out data at the start of each loop, not sure it is really neccessay
  Serial.flush();
  serial_connection.flush();

  while (serial_connection.available()) //While there are characters to come from the GPS
  {
    gps.encode(serial_connection.read());//This feeds the serial NMEA data into the library one char at a time
  }
  if (gps.location.isUpdated()) //This will pretty much be fired all the time anyway but will at least reduce it to only after a package of NMEA data comes in
  {
    // Test to see if GPS is fixed
    if (gps.satellites.value() > 0) {
      dataFile = SD.open("gps.txt", FILE_WRITE);
      // save data to SD if data is fixed
      if (dataFile) {
        Serial.println("writing");
        dataFile.print(gps.satellites.value());
        dataFile.print(",");
        // time
        dataFile.print(gps.time.value());
        dataFile.print(",");
        // latitude
        dataFile.print(gps.location.lat(), 6);
        dataFile.print(",");
        // longitude
        dataFile.print(gps.location.lng(), 6);
        dataFile.print(",");
        // altitude
        dataFile.print(gps.altitude.meters());
        dataFile.print(",");
        // speed
        dataFile.print(gps.speed.kmph());
        dataFile.println("");
        Serial.println("done");
      }
      else {
        Serial.println("error");
        Serial.println(gps.satellites.value());
      }

      // close file on SD card
      dataFile.close();
    }
  }
}
