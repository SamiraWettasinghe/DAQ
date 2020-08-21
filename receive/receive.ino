/*
Receive Node for CAN bus architecture done on Arduino Mega.

https://protosupplies.com/product/mcp2515-can-bus-interface-module/
*/

#include <SPI.h>
#include <mcp_can.h>

MCP_CAN CAN(10);

unsigned char len = 0; // length of received buffer
unsigned char buf[8]; // 8 byte buffer
unsigned int canID; // CAN Message ID
double tempFactor = 0.02;
int tx = 1;
int rx = 0;

// Try to initialize CAN at 500k
void setup()
{
    Serial.begin(9600);
    pinMode(tx, OUTPUT);
    pinMode(rx, INPUT);

    if (Serial.available() > 0) {
        Serial.println("Serial monitor available");
    }

    while (CAN_OK != CAN.begin(CAN_500KBPS))
    {
        Serial.println("CAN Initialization Failed, you failure");
        Serial.println("Trying again because you suck so hard...");
        delay(2000);
    }
    Serial.println("CAN Shield Initialized");
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
        if (canID <= 0x04) {
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

        //canID for OBD-II data is 0x05
        else if (canID == 0x05) {
          int vehSpeed = buf[0];
          Serial.println(vehSpeed);
          
          int rpm = word(buf[1], buf[2]);
          Serial.println(rpm);
        }

        // canID for accelerometer is 0x06
        else if (canID == 0x06) {
          int AcX = word(buf[0], buf[1]);
          int AcY = word(buf[2], buf[3]);
          int AcZ = word(buf[4], buf[5]);

          Serial.print("AcX = "); Serial.print(AcX);
          Serial.print(" | AcY = "); Serial.print(AcY);
          Serial.print(" | AcZ = "); Serial.print(AcZ);
        }

        //canID for gyrometer is 0x07
        else if (canID == 0x07) {
          int GyX = word(buf[0], buf[1]);
          int GyY = word(buf[2], buf[3]);
          int GyZ = word(buf[4], buf[5]);

          Serial.print("GyX = "); Serial.print(GyX);
          Serial.print(" | GyY = "); Serial.print(GyY);
          Serial.print(" | GyZ = "); Serial.println(GyZ);
        }
    }
    else {
        Serial.println("No Message");
        delay(10000);
    }
}
