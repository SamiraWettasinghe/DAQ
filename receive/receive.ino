#include <mcp_can.h>
#include <Wire.h>
#include <SD.h>
#include <SPI.h>
#include "TinyGPS++.h"

// CAN TIre Temp Variables
MCP_CAN CAN(10);
unsigned char len = 0;
unsigned char buf[8];
unsigned int canID;
const double tempFactor = 0.02;

// Assume sensor A is outer and sensor B is inner
float celcius_FL_A = 0.0;
float celcius_FL_B = 0.0;
float celcius_FR_A = 0.0;
float celcius_FR_B = 0.0;
float celcius_RL_A = 0.0;
float celcius_RL_B = 0.0;
float celcius_RR_A = 0.0;
float celcius_RR_B = 0.0;
double tempData_A = 0x000;
double tempData_B = 0x000;

// Accelerometer Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;

// SD Card Variables
File myFile;
const int chipSelect = 11;

// CAN Tire Temp Variables
unsigned long time;
unsigned long ttsHighWord;
unsigned long ttsLowWord;
unsigned long millisec;
unsigned long tseconds;
unsigned long tminutes;
unsigned long seconds;
unsigned long ttsTime_FL;
unsigned long ttsTime_FR;
unsigned long ttsTime_RL;
unsigned long ttsTime_RR;

// set to zero if you want to skip the SD storage
const unsigned long tol = 0;

// set to true if you want to skip the coherency check
const boolean verbose = true;

// OBD-II Variables
char rxData[20];
char rxIndex = 0;
int vehSpeed = 0;
int rpm = 0;
int tps = 0;
const boolean isOBD = false;

// GPS Variables
TinyGPSPlus gps;
const boolean isGPS = true;
float lat;
float lng;
unsigned long gpsTime;
float gpsSpeed;
float alt;
unsigned long satellites;

void setup()
{
  // Set up i2c comms
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);

  // Serial port init for debug
  Serial.begin(9600);
  if (Serial.available() > 0) {
    Serial.println("Serial monitor available");
  }

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

  // Sensor CAN bus init
  while (CAN_OK != CAN.begin(CAN_500KBPS))
  {
    Serial.println("CAN Initialization Failed, you failure");
    Serial.println("Trying again because you suck so hard...");
    delay(2000);
  }
  Serial.println("CAN Shield Initialized");

  // OBD-II setup
  if (isOBD) {
    Serial1.begin(9600);
    Serial.println("Setting up OBD Comms...");
    delay(2000);
    Serial1.print("ATZ\r");
    delay(2);
    OBD_read();
    Serial1.print("ATE0\r");
    OBD_read();
    Serial.print("OBD Comms Set");
    delay(3000);
  }

  // GPS Setup
  if (isGPS) {
    Serial2.begin(9600);
    Serial.println("GPS Start");
    delay(2000);
  }
}

void loop()
{
  // Read Tire Temps over CAN
  if (CAN.checkReceive() == 3) { // 3 Means CAN_MSGAVAIL
    CAN.readMsgBuf(&len, buf); // len: data length, buf: data buffer
    canID = CAN.getCanId();

    tempData_A = 0x0000; // zero out the data
    tempData_A = (double)(((buf[5] & 0x007F) << 8) + buf[4]);
    tempData_A = (tempData_A * tempFactor) - 0.01;

    tempData_B = 0x0000;
    tempData_B = (double)(((buf[7] & 0x007F) << 8) + buf[6]);
    tempData_B = (tempData_B * tempFactor) - 0.01;

    // canIDs for tire temps are from 0x00 to 0x04
    // Front Left
    if (canID == 0x01) {
      celcius_FL_A = tempData_A - 273.15;
      celcius_FL_B = tempData_B - 273.15;
      
      Serial.print("Celcius Sensor FL A: ");
      Serial.println(celcius_FL_A);
      Serial.print("Celcius Sensor FL B: ");
      Serial.println(celcius_FL_B);

      ttsHighWord = word(buf[0], buf[1]);
      ttsLowWord = word(buf[2], buf[3]);
      ttsTime_FL = ttsHighWord << 16 | ttsLowWord;
    }

    // Front Right
    else if (canID == 0x02) {
      celcius_FR_A = tempData_A - 273.15;
      celcius_FR_B = tempData_B - 273.15;
      
      Serial.print("Celcius Sensor FR A: ");
      Serial.println(celcius_FR_A);
      Serial.print("Celcius Sensor FR B: ");
      Serial.println(celcius_FR_B);

      ttsHighWord = word(buf[0], buf[1]);
      ttsLowWord = word(buf[2], buf[3]);
      ttsTime_FR = ttsHighWord << 16 | ttsLowWord;
    }

    // Right Left
    else if (canID == 0x03) {
      celcius_RL_A = tempData_A - 273.15;
      celcius_RL_B = tempData_B - 273.15;
      
      Serial.print("Celcius Sensor RL A: ");
      Serial.println(celcius_RL_A);
      Serial.print("Celcius Sensor RL B: ");
      Serial.println(celcius_RL_B);

      ttsHighWord = word(buf[0], buf[1]);
      ttsLowWord = word(buf[2], buf[3]);
      ttsTime_RL = ttsHighWord << 16 | ttsLowWord;
    }

    // Rear Right
    else if (canID == 0x04) {
      celcius_RR_A = tempData_A - 273.15;
      celcius_RR_B = tempData_B - 273.15;
      
      Serial.print("Celcius Sensor RR A: ");
      Serial.println(celcius_RR_A);
      Serial.print("Celcius Sensor RR B: ");
      Serial.println(celcius_RR_B);

      ttsHighWord = word(buf[0], buf[1]);
      ttsLowWord = word(buf[2], buf[3]);
      ttsTime_RR = ttsHighWord << 16 | ttsLowWord;
    }
  }
  else {
    // Serial.println("No CAN Message");
  }

  // Read Accelerometer
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

  // Read OBD data
  if (isOBD) {
    rpm = getRPM();
    vehSpeed = getSPEED();
    Serial.print("S:");
    Serial.print (vehSpeed);
    Serial.print (",");
    Serial.print("R:");
    Serial.println (rpm);
    Serial.flush();
  }

  // Read GPS
  if (isGPS) {
    Serial2.flush();
    while (Serial2.available() > 0) {
      gps.encode(Serial2.read());
    }

    if (gps.location.isUpdated()) {
      if (gps.satellites.value() > 0) {
        satellites = gps.satellites.value();
        gpsTime = gps.time.value();
        lat = (gps.location.lat(), 6);
        lng = (gps.location.lng(), 6);
        alt = gps.altitude.meters();
        gpsSpeed = gps.speed.kmph();
        Serial.print(satellites);
        Serial.print(",");
        Serial.print(gps.location.lat(), 6);
        Serial.print(",");
        Serial.print(gps.location.lng(), 6);
        Serial.println();
      }
      else {
        Serial.println("Connecting...");
      }
    }
  }

  // TODO: Coherency check on GPS Time
  // TODO: Test if coherency checks work
  if (isCoherent() || verbose) {
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
      myFile.print(celcius_FL_A);
      myFile.print(",");
      myFile.print(celcius_FL_B);
      myFile.print(",");
      myFile.print(celcius_FR_A);
      myFile.print(",");
      myFile.print(celcius_FR_B);
      myFile.print(",");
      myFile.print(celcius_RL_A);
      myFile.print(",");
      myFile.print(celcius_RL_B);
      myFile.print(",");
      myFile.print(celcius_RR_A);
      myFile.print(",");
      myFile.print(celcius_RR_B);
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
      myFile.print(",");
      myFile.print((float)GyZ/131, 3);
      myFile.print(",");
      myFile.print(satellites);
      myFile.print(",");
      myFile.print(lat, 6);
      myFile.print(",");
      myFile.print(lng, 6);
      myFile.print(",");
      myFile.print(gpsSpeed, 3);
      myFile.print(",");
      myFile.print(vehSpeed);
      myFile.print(",");
      myFile.print(rpm);
      myFile.println();
      Serial.println("Logging...");
    }
    myFile.close();
  }

  delay(20);
}

void OBD_read(void)
{
  char c;
  do {
    if (Serial1.available() > 0)
    {
      c = Serial1.read();
      if ((c != '>') && (c != '\r') && (c != '\n')) // Keep these out of our buffer
      {
        rxData[rxIndex++] = c; //Add whatever we receive to the buffer
      }
    }
  } while (c != '>'); //  The ELM327 ends its response with this char so when we get it we exit out.
  rxData[rxIndex++] = '\0'; // Converts the array into a string
  rxIndex = 0; // Set this to 0 so next time we call the read we get a "clean buffer"
}

int getRPM(void)
{
  //Query the OBD-II-UART for the Vehicle rpm
  Serial1.flush();
  Serial1.print("010C\r");
  OBD_read();

  return ((strtol(&rxData[6], 0, 16) * 256) + strtol(&rxData[9], 0, 16)) / 4;
}

int getSPEED(void)
{
  //Query the OBD-II-UART for the vehicle speed
  Serial1.flush();
  Serial1.print("010D\r");
  OBD_read();

  return strtol(&rxData[6], 0, 16);
}

void convertTime(unsigned long times)
{
  millisec  = times % 1000;
  tseconds = times / 1000;
  tminutes = tseconds / 60;
  seconds = tseconds % 60;
}

boolean isCoherent() {
  if ((abs(ttsTime_FL-ttsTime_FR) < tol) &&
      (abs(ttsTime_FL-ttsTime_RL) < tol) &&
      (abs(ttsTime_FL-ttsTime_RR) < tol) &&
      (abs(ttsTime_FR-ttsTime_RL) < tol) &&
      (abs(ttsTime_FR-ttsTime_RR) < tol) &&
      (abs(ttsTime_RL-ttsTime_RR) < tol)) {
    return true;
  }
  else {
    return false;
  }
}
