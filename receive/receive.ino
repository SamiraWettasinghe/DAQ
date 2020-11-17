#include <Wire.h>
#include <SoftWire.h>

// Tire Temp Comms
int incomingByte = 0;

// IMU Variables
const int MPU_addr = 0x68;
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
  
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
  
  delay(50);
}
