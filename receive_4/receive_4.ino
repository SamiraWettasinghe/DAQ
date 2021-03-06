#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <TinyGPS++.h>
// The TinyGPS++ object
TinyGPSPlus gps;

#define LED 38
#define ERR_LED 37

#define LED_ON HIGH
#define LED_OFF LOW

#define IO 22
#define IO_TRANSMIT HIGH
#define IO_RECEIVE LOW

#define FL 0x95
#define FR 0x85
#define RL 0x75
#define RR 0x65
#define HEAD 0xFF

enum state {
  HEADER,
  FROM,
  DATA_HIGH_A,
  DATA_LOW_A,
  DATA_HIGH_B,
  DATA_LOW_B,
  DATA_HIGH_C,
  DATA_LOW_C,
  D0,
  D1,
  D2,
  D3,
  D4,
  D5,
  D6,
  D7,
  D8,
  D9,
  D10,
  D11,
  D12,
  D13,
  D14,
  D15,
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
byte high_C;
byte low_C;
int stream[16];
int tempAvg[3];//Tin, Tmid, Tout
int TEMP_a;
int TEMP_b;
int TEMP_c;
int T[64];

long time_taken;
long start_time;
int FL_in = 0;
int FL_mid = 0;
int FL_out = 0;
int FR_in = 0;
int FR_mid = 0;
int FR_out = 0;
int RL_in = 0;
int RL_mid = 0;
int RL_out = 0;
int RR_in = 0;
int RR_mid = 0;
int RR_out = 0;


// IMU Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
String xacc, yacc, zacc, gyrox, gyroy, gyroz;

// SD Card Variables
File myFile;
const int chipSelect = 53;
int i = 0;
String j = "stuff";
String k = ".csv";
String l = j + i + k;// file name.csv

// Bluetooth Variables
uint16_t count = 0;

// GPS Variable
float lat0;
float lng0;
unsigned long gpsTime;
float gpsSpeed;

void setup()
{
  Serial.begin(115200);
  Serial2.begin(9600);//bluetooth
  Serial3.begin(9600);//GPS
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
  while (SD.exists(l)) {
    i = i + 1;
    l = j + i + k;
  }
  myFile = SD.open(l, FILE_WRITE);
  if (myFile) {
    myFile.println("Day,Month,Year,Hour,Minutes,Seconds,Milliseconds,Lat,Long,GPS Speed,AcX,AcY,AcZ,GyX,GyY,GyZ,FL Outer,FL Mid,FL Inner,FR Outer,FR Mid,FR Inner,RL Outer,RL Mid,RL Inner,RR Outer,RR Mid,RR Inner,Error");
  }
  myFile.close();
  digitalWrite(LED, LED_OFF);
  delay(500);
  toAddress = 0xF1;
}

String checksum(String str)
{
  byte checksum = 0x00;
  const char* buf = str.c_str();
  for (int i = 1; i < strlen(buf) - 1; i++) {
    checksum ^= str[i];
  }
  return String((checksum <= 0x0f ? "0" : "") + String(checksum, HEX));
}
void displayInfo()
{
  String str = "$RC3," + String(gpsTime) + "," + String(count++) + "," + xacc + "," + yacc + "," + zacc + "," + gyrox + "," + gyroy + "," + gyroz + ",,"; //$RC3,[time],[count],[xacc],[yacc],[zacc],[gyrox],[gyroy],[gyroz],[rpm/d1],
  str += ",,,,,,,,,,,,,,,*"; //[d2],[a1],[a2],[a3],[a4],[a5],[a6],[a7],[a8],[a9],[a10],[a11],[a12],[a13],[a14],[a15]*
  //Serial.println(str + checksum(str));
  Serial2.println(str + checksum(str));

  //BSQ app
  //  String str = String(stream[0]) + ",";
  //  for (int bt = 0; bt < 64; bt++) {
  //    if (bt == 63) {
  //      str += String (0)
  //    }
  //    str += String(T[bt]) + ",";
  //  }
  //  Serial2.println(str);
  //  delay(100);
  //  Serial.println(str);
}


void loop()
{
  nowTime = millis();

  if ((nowTime - prevTime_30) >= 30) {
    readTires();
    readIMU();
    storeSD();
    prevTime_30 = millis();
  }

  nowTime = millis();

  if ((nowTime - prevTime_100) >= 100) {
    readGPS();
    displayInfo();//BLUETOOTH
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
void calculateTemp1() {
  TEMP_a = (int)(((high_A ) << 4) + low_A);//may have to shift 8bit instead of 4
  TEMP_b = (int)(((high_B ) << 4) + low_B);
  TEMP_c = (int)(((high_C ) << 4) + low_C);

  //  toAddress = 0xC1;

  if (fromAddress == FL) {
    FL_in = TEMP_a;
    FL_mid = TEMP_b;
    FL_out = TEMP_c;
    toAddress = 0xF2;
    for (int bt = 0; bt < 16; bt++) {
      T[bt] = stream[bt];
    }
  }
  else if (fromAddress == FR) {
    FR_in = TEMP_a;
    FR_mid = TEMP_b;
    FR_out = TEMP_c;
    toAddress = 0xF3;
        for (int bt = 0; bt < 16; bt++) {
      T[bt+16] = stream[bt];
    }
  }
  else if (fromAddress == RL) {
    RL_in = TEMP_a;
    RL_mid = TEMP_b;
    RL_out = TEMP_c;
    toAddress = 0xF4;
        for (int bt = 0; bt < 16; bt++) {
      T[bt+32] = stream[bt];
    }
  }
  else if (fromAddress == RR) {
    RR_in = TEMP_a;
    RR_mid = TEMP_b;
    RR_out = TEMP_c;
    toAddress = 0xF1;      
    for (int bt = 0; bt < 16; bt++) {
      T[bt+48] = stream[bt];
    }
  }
  fromAddress = 0;
  high_A = 0;
  low_A = 0;
  high_B = 0;
  low_B = 0;
  digitalWrite(IO, IO_TRANSMIT);
  digitalWrite(LED, LED_OFF);
}
void readTires()
{
  if (toAddress == 0xF1) {
    digitalWrite(IO, IO_TRANSMIT);
    Serial1.write(FL);
    Serial1.flush();
    digitalWrite(IO, IO_RECEIVE);
    toAddress = 0;
  } else if (toAddress == 0xF2) {
    digitalWrite(IO, IO_TRANSMIT);
    Serial1.write(FR);
    Serial1.flush();
    digitalWrite(IO, IO_RECEIVE);
    toAddress = 0;
  } else if (toAddress == 0xF3) {
    digitalWrite(IO, IO_TRANSMIT);
    Serial1.write(RL);
    Serial1.flush();
    digitalWrite(IO, IO_RECEIVE);
    toAddress = 0;
  } else if (toAddress == 0xF4) {
    digitalWrite(IO, IO_TRANSMIT);
    Serial1.write(RR);
    Serial1.flush();
    digitalWrite(IO, IO_RECEIVE);
    toAddress = 0;
  }
  while (Serial1.available() > 0) {
    if (Serial1.available() >= 63) {
      errorCode = 0x01;
      Serial.println("Overflow Error");
      digitalWrite(ERR_LED, LED_ON);
    }
    readSerial(Serial1.read());
    counter = 0;
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
      myState = DATA_HIGH_C;
      low_B = p;
      break;
    case DATA_HIGH_C:
      myState = DATA_LOW_C;
      high_C = p;
      break;
    case DATA_LOW_C:
      myState = TO;
      low_C = p;
      break;
    case D0:
      myState = D1;
      stream[0] = (int)p;
      break;
    case D1:
      myState = D2;
      stream[1] = (int)p;
      break;
    case D2:
      myState = D3;
      stream[2] = (int)p;
      break;
    case D3:
      myState = D4;
      stream[3] = (int)p;
      break;
    case D4:
      myState = D5;
      stream[4] = (int)p;
      break;
    case D5:
      myState = D6;
      stream[5] = (int)p;
      break;
    case D6:
      myState = D7;
      stream[6] = (int)p;
      break;
    case D7:
      myState = D8;
      stream[7] = (int)p;
      break;
    case D8:
      myState = D9;
      stream[8] = (int)p;
      break;
    case D9:
      myState = D10;
      stream[9] = (int)p;
      break;
    case D10:
      myState = D11;
      stream[10] = (int)p;
      break;
    case D11:
      myState = D12;
      stream[11] = (int)p;
      break;
    case D12:
      myState = D13;
      stream[12] = (int)p;
      break;
    case D13:
      myState = D14;
      stream[13] = (int)p;
      break;
    case D14:
      myState = D15;
      stream[14] = (int)p;
      break;
    case D15:
      myState = TO;
      stream[15] = (int)p;
      break;
    case TO:
      toAddress = p;
      myState = HEADER;
      calculateTemp1();
      break;
  }
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

  xacc = (float)AcX / 16384, 3;
  yacc = (float)AcY / 16384, 3;
  zacc = (float)AcZ / 16384, 3;
  gyrox = (float)GyX / 131, 3;
  gyroy = (float)GyY / 131, 3;
  gyroz = (float)GyZ / 131, 3;
}

void storeSD()
{
  myFile = SD.open(l, FILE_WRITE);
  if (myFile) {
    myFile.print(gps.date.month());
    myFile.print(",");
    myFile.print(gps.date.day());
    myFile.print(",");
    myFile.print(gps.date.year());
    myFile.print(",");
    if (gps.time.hour() < 10) myFile.print("0");
    myFile.print(gps.time.hour());
    myFile.print(",");
    if (gps.time.minute() < 10) myFile.print("0");
    myFile.print(gps.time.minute());
    myFile.print(",");
    if (gps.time.second() < 10) myFile.print("0");
    myFile.print(gps.time.second());
    myFile.print(F(","));
    if (gps.time.centisecond() < 10) myFile.print("0");
    myFile.print(gps.time.centisecond());
    myFile.print(",");
    myFile.print(lat0);
    myFile.print(",");
    myFile.print(lng0);
    myFile.print(",");
    myFile.print(gpsSpeed);
    myFile.print(",");
    myFile.print(xacc);
    myFile.print(",");
    myFile.print(yacc);
    myFile.print(",");
    myFile.print(zacc);
    myFile.print(",");
    myFile.print(gyrox);
    myFile.print(",");
    myFile.print(gyrox);
    myFile.print(",");
    myFile.print(gyrox);
    myFile.print(",");
    myFile.print(FL_in);
    myFile.print(",");
    myFile.print(FL_mid);
    myFile.print(",");
    myFile.print(FL_out);
    myFile.print(",");
    myFile.print(FR_in);
    myFile.print(",");
    myFile.print(FR_mid);
    myFile.print(",");
    myFile.print(FR_out);
    myFile.print(",");
    myFile.print(RL_in);
    myFile.print(",");
    myFile.print(RL_mid);
    myFile.print(",");
    myFile.print(RL_out);
    myFile.print(",");
    myFile.print(RR_in);
    myFile.print(",");
    myFile.print(RR_mid);
    myFile.print(",");
    myFile.print(RR_out);
    myFile.print(",");
    myFile.print(errorCode);
    myFile.println();
  }
  myFile.close();
}

void readGPS()
{ while (Serial3.available() > 0)
    if (gps.encode(Serial3.read())) {
      if (gps.location.isValid())
      {
        gpsTime = gps.time.value();
        lat0 = (gps.location.lat(), 6);
        lng0 = (gps.location.lng(), 6);
        gpsSpeed = gps.speed.kmph();
      }
      if (millis() > 5000 && gps.charsProcessed() < 10)
      {
        Serial.println("No GPS detected: check wiring.");
        while (true);
      }
    }
}
