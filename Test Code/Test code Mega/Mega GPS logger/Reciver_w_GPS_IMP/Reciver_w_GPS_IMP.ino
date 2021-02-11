#include <SPI.h>
#include <SD.h>
#include <TinyGPS++.h>

// The TinyGPS++ object
TinyGPSPlus gps;

// SD Card Variables
File myFile;
const int chipSelect = 53;

void setup() {
  Serial3.begin(9600);
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  Serial.print("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");
  myFile = SD.open("stuff.csv", FILE_WRITE);
  if (myFile) {
    myFile.println("Day,Month,Year,Hour,Minutes,Seconds,Milliseconds,Lat,Long,GPS Speed,FL Outer,FL Inner,FR Outer,FR Inner,AcX,AcY,AcZ,GyX,GyY,GyZ,Error");
  }
  myFile.close();
}


void displayInfo()
{
  if (gps.location.isValid())
  {

    myFile = SD.open("stuff.csv", FILE_WRITE);
    if (myFile) {
      myFile.print(gps.date.month());
      myFile.print(F(","));
      myFile.print(gps.date.day());
      myFile.print(F(","));
      myFile.print(gps.date.year());
      myFile.print(F(","));
      if (gps.time.hour() < 10) myFile.print(F("0"));
      myFile.print(gps.time.hour());
      myFile.print(F(","));
      if (gps.time.minute() < 10) myFile.print(F("0"));
      myFile.print(gps.time.minute());
      myFile.print(F(","));
      if (gps.time.second() < 10) myFile.print(F("0"));
      myFile.print(gps.time.second());
      myFile.print(F(","));
      if (gps.time.centisecond() < 10) myFile.print(F("0"));
      myFile.print(gps.time.centisecond());
      myFile.print(F(","));
      myFile.print(gps.location.lat(), 6);
      myFile.print(F(","));
      myFile.print(gps.location.lng(), 6);
      myFile.print(F(","));
      myFile.print(gps.speed.kmph());
      myFile.println();
    }
    myFile.close();
  }
  else
  {
    Serial.print(F("INVALID"));
  }
  Serial.println();
}
void loop() {
  while (Serial3.available() > 0)
    if (gps.encode(Serial3.read()))
      displayInfo();
  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
    while (true);
  }
}
