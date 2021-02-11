#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <TinyGPS++.h>

// The TinyGPS++ object
TinyGPSPlus gps;

// IMU Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;

// SD Card Variables
File myFile;
const int chipSelect = 53;
int i = 0;
String j = "stuff";
String k = ".csv";
String l = j + i + k;

void setup() {
  Serial3.begin(9600);
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  // Set up i2c comms with IMU
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
  Serial.print("Initialized IMU...");
  Serial.print("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");
  while (SD.exists(l)) {
    i=i+1;
    l=j+i+k;
    Serial.print(l);
  }
  myFile = SD.open(l, FILE_WRITE);
  if (myFile) {
    myFile.println("Day,Month,Year,Hour,Minutes,Seconds,Milliseconds,Lat,Long,GPS Speed,AcX,AcY,AcZ,GyX,GyY,GyZ,FL Outer,FL Inner,FR Outer,FR Inner,Error");
  }
  myFile.close();
}

void displayInfo()
{
  // Read IMU
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_addr, 14, true); // request a total of 14 registers

  AcX = Wire.read() << 8 | Wire.read(); // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = Wire.read() << 8 | Wire.read(); // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ = Wire.read() << 8 | Wire.read(); // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)

  Tmp = Wire.read() << 8 | Wire.read(); // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)

  GyX = Wire.read() << 8 | Wire.read(); // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY = Wire.read() << 8 | Wire.read(); // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ = Wire.read() << 8 | Wire.read(); // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  
  if (gps.location.isValid())
  {
    myFile = SD.open(l, FILE_WRITE);
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
      myFile.print(",");
      myFile.print((float)AcX / 16384), 3;
      myFile.print(",");
      myFile.print((float)AcY / 16384, 3);
      myFile.print(",");
      myFile.print((float)AcZ / 16384, 3);
      myFile.print(",");
      myFile.print((float)GyX / 131, 3);
      myFile.print(",");
      myFile.print((float)GyY / 131, 3);
      myFile.print(",");
      myFile.print((float)GyZ / 131, 3);
      myFile.println();
    }
    myFile.close();
  }
  else
  {
    Serial.print(F("INVALID"));
  }
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
