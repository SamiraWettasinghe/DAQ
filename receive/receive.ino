#include <Wire.h>
#include <SoftWire.h>
#include <SPI.h>
#include <SD.h>

unsigned long time;
unsigned long millisec;
unsigned long tseconds;
unsigned long tminutes;
unsigned long seconds;

// Tire Temp Comms
int incomingByte = 0;

// IMU Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;

// SD Card Variables
File myFile;
const int chipSelect = 11;
  
void setup()
{
  // Serial port init for debug
  Serial.begin(9600);
  Serial1.begin(9600);
  if (Serial1.available() > 0) {
    Serial.println("Serial monitor available");
  }
  
  pinMode(22, OUTPUT);

  // Set up i2c comms with IMU
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);

  // SD card init on CS D11
  Serial.print("Initializing SD Card...");
  if (!SD.begin(chipSelect)) {
    Serial.println("SD Initialization failed. Insert SD card and press reset");
    while (1);
  }
  Serial.println("SD Initialization Complete!");
  myFile = SD.open("stuff.csv", FILE_WRITE);
  if (myFile) {
    myFile.println("Minutes,Seconds,Milliseconds,FL Outer,FL Inner,FR Outer,FR Inner,RL Outer,RL Inner,RR Outer,RR Inner,AcX,AcY,AcZ,GyX,GyY,GyZ,Satellites,Lat,Long,GPS Speed,Vehicle Speed,RPM");
  }
  myFile.close();
}

void loop()
{
  digitalWrite(22, LOW);
  if (Serial1.available() > 0){
    incomingByte = Serial1.read();
    Serial.println(incomingByte, DEC);
  }

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

  Serial.print((float)AcX/16384), 3;
  Serial.print(",");
  Serial.print((float)AcY/16384, 3);
  Serial.print(",");
  Serial.print((float)AcZ/16384, 3);
  Serial.print(",");
  Serial.print((float)GyX/131, 3);
  Serial.print(",");
  Serial.print((float)GyY/131, 3);
  Serial.print(",");
  Serial.print((float)GyZ/131, 3);
  Serial.println();

  myFile = SD.open("stuff.csv", FILE_WRITE);
  if (myFile) {
    time = millis();
    convertTime(time);
    myFile.print(tminutes);
    myFile.print(",");
    myFile.print(seconds);
    myFile.print(",");
    myFile.print(millisec);
    myFile.print(",");
    myFile.print((float)AcX/16384), 3;
    myFile.print(",");
    myFile.print((float)AcY/16384, 3);
    myFile.print(",");
    myFile.print((float)AcZ/16384, 3);
    myFile.print(",");
    myFile.print((float)GyX/131, 3);
    myFile.print(",");
    myFile.print((float)GyY/131, 3);
    myFile.println();
    Serial.println("Logging...");
  }
  myFile.close();
  
  delay(50);
}

void convertTime(unsigned long times)
{
  millisec  = times % 1000;
  tseconds = times / 1000;
  tminutes = tseconds / 60;
  seconds = tseconds % 60;
}
