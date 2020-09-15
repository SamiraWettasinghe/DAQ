#include <SPI.h>
#include <mcp_can.h>
#include <Wire.h>

MCP_CAN CAN(10);

unsigned char len = 0; // length of received buffer
unsigned char buf[8]; // 8 byte buffer
unsigned int canID; // CAN Message ID
double tempFactor = 0.02;

const int MPU_addr=0x68;
int16_t imuValues[7];

// Try to initialize CAN at 500k
void setup()
{
    /* Set up i2c comms */
    Wire.begin();
    Wire.beginTransmission(MPU_addr);
    Wire.write(0x6B);  // PWR_MGMT_1 register
    Wire.write(0);     // set to zero (wakes up the MPU-6050)
    Wire.endTransmission(true);
    Serial.begin(9600);

    while (CAN_OK != CAN.begin(CAN_500KBPS))
    {
        Serial.println("CAN Initialization Failed, you failure");
        Serial.println("Trying again because you suck so hard...");
        delay(2000);
    }
    Serial.println("CAN Shield Initialized");

    // Begin the SD card UART serial
    Serial1.begin(9600);
}

void loop()
{
    if (CAN.checkReceive() == 3) { // 3 Means CAN_MSGAVAIL
        CAN.readMsgBuf(&len, buf); // len: data length, buf: data buffer
        canID = CAN.getCanId();

        // Print the data one byte at a time
        for (int i = 0; i<len; i++) {
            Serial.print(int(buf[i]));
            if(i<(len-1)) Serial.print(",");
        }
        Serial.println();

        // canIDs for tire temps are from 0x00 to 0x04
        if (canID == 0x01) {
          // Sensor A
          double tempData_A = 0x0000; // zero out the data
          tempData_A = (double)(((buf[2] & 0x007F) << 8) + buf[1]);
          tempData_A = (tempData_A * tempFactor) - 0.01;
          float celcius_A = tempData_A - 273.15;
          Serial.print("Celcius Sensor A: ");
          Serial.println(celcius_A);
  
          // Sensor B
          double tempData_B = 0x0000; // zero out the data
          tempData_B = (double)(((buf[6] & 0x007F) << 8) + buf[5]);
          tempData_B = (tempData_B * tempFactor) - 0.01;
          float celcius_B = tempData_B - 273.15;
          Serial.print("Celcius Sensor B: ");
          Serial.println(celcius_B);
        }
    }
    else {
        Serial.println("No Message");
    }
    
    readIMU(imuValues);
    Serial1.print("<");
    Serial1.print(imuValues[0]);
    Serial1.print(",");
    Serial1.print(imuValues[1]);
    Serial1.print(",");
    Serial1.print(imuValues[2]);
    Serial1.print(",");
    Serial1.print(imuValues[4]);
    Serial1.print(",");
    Serial1.print(imuValues[5]);
    Serial1.print(",");
    Serial1.print(imuValues[6]);
    Serial1.print(">");

    delay(10);
}

void readIMU(int16_t arr[]) {
    Wire.beginTransmission(MPU_addr);
    Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
    Wire.endTransmission(false);
    Wire.requestFrom(MPU_addr,14,true);  // request a total of 14 registers
    
    arr[0]=Wire.read()<<8|Wire.read();  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)    
    arr[1]=Wire.read()<<8|Wire.read();  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
    arr[2]=Wire.read()<<8|Wire.read();  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
    arr[3]=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
    arr[4]=Wire.read()<<8|Wire.read();  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
    arr[5]=Wire.read()<<8|Wire.read();  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
    arr[6]=Wire.read()<<8|Wire.read();  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
    delay(2);
}
