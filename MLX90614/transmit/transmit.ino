/*
Transmit node transmit data from nano to mega.

TODO:
- Read sensor data
- Read data from three sensors
- Send sensor data 
https://protosupplies.com/product/mcp2515-can-bus-interface-module/
*/

#include <SPI.h>
#include <mcp_can.h>
#include <i2cmaster.h>

MCP_CAN CAN(10);
byte data[8] = {0, 0, 0, 0, 0, 0, 0, 0};

unsigned long time;
byte timeBuffer[4] = {0, 0, 0, 0};

void setup()
{
    Serial.begin(115200);
    Serial.println("Setup...");

    while (CAN_OK != CAN.begin(CAN_500KBPS))
    {
        Serial.println("CAN Initialization Failed, you failure");
        Serial.println("Trying again because you suck so hard...");
        delay(2000);
    }
    Serial.println("CAN Shield Initialized");

    i2c_init();
    PORTC = (1 << PORTC4) | (1 << PORTC5);
    Serial.println("i2c Initialized");
}

// Try to initialize CAN at 500k
void loop()
{
    int data_low_A = 0;
    int data_high_A = 0;
    int pec_A = 0;
    int data_high_B = 0;
    int data_low_B = 0;
    int pec_B = 0;

    int dev_A = 0x55 << 1; // address location sensor 1
    int dev_B = 0x3B << 1; // address location sesnor 2

    // read sensor 1
    i2c_start_wait(dev_A + I2C_WRITE);
    i2c_write(0x07); // RAM location of Tobj1
    i2c_rep_start(dev_A + I2C_READ);
    data_low_A = i2c_readAck();
    data_high_A = i2c_readAck();
    pec_A = i2c_readNak();
    i2c_stop();

    // read sensor 2
    i2c_start_wait(dev_B + I2C_WRITE);
    i2c_write(0x07);
    i2c_rep_start(dev_B + I2C_READ);
    data_low_B = i2c_readAck();
    data_high_B = i2c_readAck();
    pec_B = i2c_readNak();
    i2c_stop();

    time = millis();
    timeBuffer[0] = time;
    timeBuffer[1] = time >> 8;
    timeBuffer[2] = time >> 16;
    timeBuffer[3] = time >> 24;

    // send data over CAN
    data[0] = (byte)timeBuffer[0];
    data[1] = (byte)timeBuffer[1];
    data[2] = (byte)timeBuffer[2];
    data[3] = (byte)timeBuffer[3];
    data[4] = (byte)data_low_A;
    data[5] = (byte)data_high_A;
    data[6] = (byte)data_low_B;
    data[7] = (byte)data_high_B;

    // CAN.sendMsgBuf(msg ID, standard frame, # of data bytes, data array)
    CAN.sendMsgBuf(0x01, 0, 8, data);
    delay(100);
}
