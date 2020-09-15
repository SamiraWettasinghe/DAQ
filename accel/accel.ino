#include<Wire.h>

const int MPU_addr=0x68;
float imuValues[7];
float accel_deadzone = 8/16384.0;
float gyro_deadzone = 1/131.0;
int16_t AxOffset,AyOffset,AzOffset,GxOffset,GyOffset,GzOffset;

void setup(){

  /* Set up i2c comms */
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
  Serial.begin(9600);
}
void loop(){
  readIMU(imuValues);
}

void readIMU(float arr[]) {
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_addr,14,true);  // request a total of 14 registers
  
  arr[0]=(Wire.read()<<8|Wire.read()) / 16384.0;  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)    
  arr[1]=(Wire.read()<<8|Wire.read()) / 16384.0;  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  arr[2]=(Wire.read()<<8|Wire.read()) / 16384.0;  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  arr[3]=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  arr[4]=(Wire.read()<<8|Wire.read()) / 131.0;  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  arr[5]=(Wire.read()<<8|Wire.read()) / 131.0;  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  arr[6]=(Wire.read()<<8|Wire.read()) / 131.0;  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  delay(2);
}
