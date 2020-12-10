#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#define FL 0x95
#define FR 0xA3

enum state {
  FROM,
  DATA_HIGH_A,
  DATA_LOW_A,
  DATA_HIGH_B,
  DATA_LOW_B,
  TO
};

enum state myState;

unsigned long time;
unsigned long tseconds;
unsigned long tminutes;
unsigned long seconds;
unsigned long millisec;

// Tire Temp Comms
boolean breakNow = false;
byte fromAddress;
byte high_A;
byte low_A;
byte high_B;
byte low_B;
double TEMP_A = 0;
double TEMP_B = 0;
double tempFactor = 0.02;

double FL_A = 0;
double FL_B = 0;
double FR_A = 0;
double FR_B = 0;

// IMU Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;

// SD Card Variables
File myFile;
const int chipSelect = 53;

void setup()
{
  Serial.begin(9600);
  Serial.println("Debug monitor started");
  
  // Status LED
  pinMode(38, OUTPUT);
  digitalWrite(38, LOW);
  delay(500);
  digitalWrite(38, HIGH);

  delay(1000);
  
  Serial1.begin(9600);
  digitalWrite(38, LOW);
  delay(500);
  digitalWrite(38, HIGH);

  delay(1000);
  
  // I/O control for serial comms
  pinMode(22, OUTPUT);
  digitalWrite(38, LOW);
  delay(500);
  digitalWrite(38, HIGH);

  delay(1000);

  // Set up i2c comms with IMU
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
  digitalWrite(38, LOW);
  delay(500);
  digitalWrite(38, HIGH);

  delay(1000);

//  digitalWrite(38, LOW);
//  Serial.print("Initializing SD Card...");
//  if (!SD.begin(chipSelect)) {
//    Serial.println("SD Initialization failed. Insert SD card and press reset");
//    while (1);
//  }
//  Serial.println("SD Initialization Complete!");
//  myFile = SD.open("stuff.csv", FILE_WRITE);
//  if (myFile) {
//    myFile.println("Minutes,Seconds,Milliseconds,FL Outer,FL Inner,FR Outer,FR Inner,RL Outer,RL Inner,RR Outer,RR Inner,AcX,AcY,AcZ,GyX,GyY,GyZ,Satellites,Lat,Long,GPS Speed,Vehicle Speed,RPM");
//  }
//  myFile.close();
//  delay(500);
//  digitalWrite(38, HIGH);
//
//  delay(1000);

  digitalWrite(22, HIGH);
  Serial1.write(0x83);
  Serial.println("Enable Message sent");
  delay(50);
  digitalWrite(22, LOW);
}

void loop()
{

  while ((Serial1.available() > 0) && (!breakNow)) {
    if (Serial1.available() >= 63) {
      Serial.println("OVERFLOW");
    }
    else {
      readSerial(Serial1.read());
    }
  }
  breakNow = false;

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

  // myFile = SD.open("stuff.csv", FILE_WRITE);
  // if (myFile) {
  //   time = millis();
  //   convertTime(time);
  //   myFile.print(tminutes);
  //   myFile.print(",");
  //   myFile.print(seconds);
  //   myFile.print(",");
  //   myFile.print(millisec);
  //   myFile.print(",");
  //   myFile.print(FL_A);
  //   myFile.print(",");
  //   myFile.print(FL_B);
  //   myFile.print(",");
  //   myFile.print(FR_A);
  //   myFile.print(",");
  //   myFile.print(FR_B);
  //   myFile.print(",");
  //   myFile.print((float)AcX/16384), 3;
  //   myFile.print(",");
  //   myFile.print((float)AcY/16384, 3);
  //   myFile.print(",");
  //   myFile.print((float)AcZ/16384, 3);
  //   myFile.print(",");
  //   myFile.print((float)GyX/131, 3);
  //   myFile.print(",");
  //   myFile.print((float)GyY/131, 3);
  //   myFile.println();
  //   Serial.println("Logging...");
  // }
  // myFile.close();
}

void convertTime(unsigned long times)
{
  millisec  = times % 1000;
  tseconds = times / 1000;
  tminutes = tseconds / 60;
  seconds = tseconds % 60;
}

void readSerial(byte p) {
//  Serial.println(p);
//  if (p == FL || p == FR) {
//    myState = FROM;
//  }

  switch (myState) {

    case FROM:
      if (p == FL || p == FR) {
        myState = DATA_HIGH_A;
        fromAddress = p;
      }
      break;

    case DATA_HIGH_A:
      myState = DATA_LOW_A;
      high_A = p;
      break;

    case DATA_LOW_A:
      myState = DATA_HIGH_B;
      low_A = p;
      break;

    case DATA_HIGH_B:
      myState = DATA_LOW_B;
      high_B = p;
      break;

    case DATA_LOW_B:
      myState = TO;
      low_B = p;
      break;

    case TO:
      myState = FROM;
      calculateTemp();
      breakNow = true;
      break;
  }
}

void calculateTemp() {
  TEMP_A = (double)(((high_A & 0x007F) << 8) + low_A);
  TEMP_A = (TEMP_A * tempFactor) - 0.01;
  TEMP_A = TEMP_A - 273.15;

  TEMP_B = (double)(((high_B & 0x007F) << 8) + low_B);
  TEMP_B = (TEMP_B * tempFactor) - 0.01;
  TEMP_B = TEMP_B - 273.15;

  if (fromAddress == FL) {
    FL_A = TEMP_A;
    FL_B = TEMP_B;
    Serial.print("FL_A: ");
    Serial.print(FL_A);
    Serial.print(" | FL_B: ");
    Serial.print(FL_B);
    Serial.println();
  }

  else if (fromAddress == FR) {
    FR_A = TEMP_A;
    FR_B = TEMP_B;
    Serial.print("FR_A: ");
    Serial.print(FR_A);
    Serial.print(" | FR_B: ");
    Serial.print(FR_B);
    Serial.println();
  }

  fromAddress = 0;
  high_A = 0;
  low_A = 0;
  high_B = 0;
  low_B = 0;
}
