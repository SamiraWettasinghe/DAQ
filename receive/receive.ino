#include <mcp_can.h>
#include <Wire.h>
#include <SD.h>
#include <SPI.h>

MCP_CAN CAN(10);

unsigned char len = 0; // length of received buffer
unsigned char buf[8]; // 8 byte buffer
unsigned int canID; // CAN Message ID
double tempFactor = 0.02;
int tx = 1;
int rx = 0;
float celcius_A = 0.0;
float celcius_B = 0.0;

const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;

File myFile;
const int chipSelect = 11;

unsigned long time=0;
unsigned long ttsHighWord=0;
unsigned long ttsLowWord=0;
unsigned long ttsTime=0;
unsigned long millisec=0;
unsigned long tseconds=0;
unsigned long tminutes=0;
unsigned long seconds=0;

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
    myFile.println("Minutes,Seconds,Milliseconds,FL Outer,FL Inner,FR Outer,FR Inner,RL Inner,RL Outer,RR Inner,RR Outer,AcX,AcY,AcZ,GyX,GyY,GyZ");
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
  delay(5000);
}

void loop()
{
  if (CAN.checkReceive() == 3) { // 3 Means CAN_MSGAVAIL
    CAN.readMsgBuf(&len, buf); // len: data length, buf: data buffer
    canID = CAN.getCanId();

    // canIDs for tire temps are from 0x00 to 0x04
    if (canID == 0x01) {
      // Sensor A
      double tempData_A = 0x0000; // zero out the data
      tempData_A = (double)(((buf[5] & 0x007F) << 8) + buf[4]);
      tempData_A = (tempData_A * tempFactor) - 0.01;
      celcius_A = tempData_A - 273.15;
      Serial.print("Celcius Sensor A: ");
      Serial.println(celcius_A);

      // Sensor B
      double tempData_B = 0x0000; // zero out the data
      tempData_B = (double)(((buf[7] & 0x007F) << 8) + buf[6]);
      tempData_B = (tempData_B * tempFactor) - 0.01;
      celcius_B = tempData_B - 273.15;
      Serial.print("Celcius Sensor B: ");
      Serial.println(celcius_B);

      ttsHighWord = word(buf[0], buf[1]);
      ttsLowWord = word(buf[2], buf[3]);
      ttsTime = ttsHighWord << 16 | ttsLowWord;
    }
  }
  else {
    // Serial.println("No CAN Message");
  }

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
      myFile.print(AcX);
      myFile.print(",");
      myFile.print(AcY);
      myFile.print(",");
      myFile.print(AcZ);
      myFile.print(",");
      myFile.print(GyX);
      myFile.print(",");
      myFile.print(GyY);
      myFile.print(",");
      myFile.print(GyZ);
      myFile.println();
  }
  myFile.close();

  delay(10);
}

void convertTime(unsigned long times)
{
  millisec  = times % 1000;
  tseconds = times / 1000;
  tminutes = tseconds / 60;
  seconds = tseconds % 60;
}
 
