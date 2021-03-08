#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#define LED 38
#define ERR_LED 37

#define LED_ON LOW
#define LED_OFF HIGH

#define IO 22
#define IO_TRANSMIT HIGH
#define IO_RECEIVE LOW

#define FL 0x95
#define FR 0xA3
#define HEAD 0xFF

enum state {
  HEADER,
  FROM,
  DATA_HIGH_A,
  DATA_LOW_A,
  DATA_HIGH_B,
  DATA_LOW_B,
  TO
};

// flags
byte errorCode = 0x00;
int counter = 0;

enum state myState;

unsigned long time;
unsigned long tseconds;
unsigned long tminutes;
unsigned long seconds;
unsigned long millisec;

unsigned long prevTime_30 = 0;
unsigned long prevTime_100 = 0;
unsigned long nowTime = 0;

// Tire Temp Comms
boolean breakNow = false;
byte fromAddress;
byte toAddress;
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
  Serial.begin(115200);
  Serial.println("Debug monitor started");
  
  // Hearbeat LED
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LED_ON);
  delay(500);
  digitalWrite(LED, LED_OFF);

  delay(1000);

// Error LED
  pinMode(ERR_LED, OUTPUT);
  digitalWrite(ERR_LED, LED_ON);
  delay(500);
  digitalWrite(ERR_LED, LED_OFF);

  delay(1000);
  
  Serial1.begin(115200);
  digitalWrite(LED, LED_ON);
  delay(500);
  digitalWrite(LED, LED_OFF);

  delay(1000);
  
  // I/O control for serial comms
  pinMode(IO, OUTPUT);
  digitalWrite(LED, LED_ON);
  delay(500);
  digitalWrite(LED, LED_OFF);

  delay(1000);

  // Set up i2c comms with IMU
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
  digitalWrite(LED, LED_ON);
  delay(500);
  digitalWrite(LED, LED_OFF);

  delay(1000);

  digitalWrite(LED, LED_ON);
  Serial.print("Initializing SD Card...");
  if (!SD.begin(chipSelect)) {
    Serial.println("SD Initialization failed. Insert SD card and press reset");
    while (1);
  }
  Serial.println("SD Initialization Complete!");
  myFile = SD.open("stuff.csv", FILE_WRITE);
  if (myFile) {
    myFile.println("Minutes,Seconds,Milliseconds,FL Outer,FL Inner,FR Outer,FR Inner,AcX,AcY,AcZ,GyX,GyY,GyZ,Error");
  }
  myFile.close();
  digitalWrite(LED, LED_OFF);
  delay(500);

  toAddress = 0xC1;
}

void loop()
{
  nowTime = millis();

  if ((nowTime-prevTime_30) >= 30) {
    readTires();
    readIMU();
    storeSD();
    prevTime_30 = millis();
  }

  nowTime = millis();

  if ((nowTime-prevTime_100) >= 100) {
    readGPS();
    storeSD();
    prevTime_100 = millis();
  }
}

void convertTime(unsigned long times)
{
  millisec  = times % 1000;
  tseconds = times / 1000;
  tminutes = tseconds / 60;
  seconds = tseconds % 60;
}

void readTires()
{
  while (Serial1.available() > 0) {
    if (Serial1.available() >= 63) {
      errorCode = 0x01;
      Serial.println("Overflow Error");
      digitalWrite(ERR_LED, LED_ON);
    }
    readSerial(Serial1.read());
    counter = 0;
  }

  if (toAddress == 0xC1) {
    digitalWrite(IO, IO_TRANSMIT);
    Serial1.write(0x83);
    Serial1.flush();
    digitalWrite(IO, IO_RECEIVE);
    toAddress = 0;
  }
}

void readSerial(byte p) {

  if (p == HEAD) {
    if (myState != HEADER) {
      errorCode = 0x02;
      Serial.println("Received data is not as expected. Did not expect HEADER.");
      digitalWrite(ERR_LED, LED_ON);
    }
    myState = HEADER;
  }

  switch (myState) {

    case HEADER:
      if (p == HEAD) {
        myState = FROM;
      }
      else {
        errorCode = 0x03;
        Serial.println("Received data is not as expected. Expected HEADER but received something else");
        digitalWrite(ERR_LED, LED_ON);
      }
      break;

    case FROM:
      myState = DATA_HIGH_A;
      fromAddress = p;
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
      toAddress = p;
      myState = HEADER;
      calculateTemp();
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

void readIMU()
{
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
}

void storeSD()
{
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
    myFile.print(FL_A);
    myFile.print(",");
    myFile.print(FL_B);
    myFile.print(",");
    myFile.print(FR_A);
    myFile.print(",");
    myFile.print(FR_B);
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
    myFile.print(errorCode);
    myFile.println();
  }
  myFile.close();
}

void readGPS()
{
  // put GPS code here
}
