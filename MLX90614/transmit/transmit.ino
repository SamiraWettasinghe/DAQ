/*
Transmit node transmit data from tire temp nanos to mega.

TODO:

    Time stamp transmission:
        time = millis();
        timeBuffer[0] = time;
        timeBuffer[1] = time >> 8;
        timeBuffer[2] = time >> 16;
        timeBuffer[3] = time >> 24;

    Auto adressing:
        val = digitalRead(3);
        val = digitalRead(4);
        val = digitalRead(5);
        val = digitalRead(6);
*/
#include <i2cmaster.h>

#define LED 7
#define LED_ON LOW
#define LED_OFF HIGH
#define IO 2
#define IO_TRANSMIT HIGH
#define IO_RECEIVE LOW
#define HEADER 0xFF

int dev_A = 0x5A << 1; // address location sensor 1
int dev_B = 0x5B << 1; // address location sesnor 2

int val = 0;

int8_t data_low_A = 0;
int8_t data_high_A = 0;
int8_t data_low_B = 0;
int8_t data_high_B = 0;
int pec = 0;
double tempFactor = 0.02;

byte megaRequest = 0;
byte messageRequest = 0;
boolean sendData = false;

void setup()
{
    // Status LED
    pinMode(7, OUTPUT);
    digitalWrite(LED, LED_ON);
    delay(500);
    digitalWrite(LED, LED_OFF);

    delay(1000);
    
    Serial.begin(115200);
    digitalWrite(LED, LED_ON);
    delay(500);
    digitalWrite(LED, LED_OFF);

    delay(1000);

    // I/O control for serial comms
    pinMode(2, OUTPUT);
    digitalWrite(LED, LED_ON);
    delay(500);
    digitalWrite(LED, LED_OFF);

    delay(1000);

    // DIP switch address
    pinMode(3, INPUT);
    pinMode(4, INPUT);
    pinMode(5, INPUT);
    pinMode(6, INPUT);
    digitalWrite(LED, LED_ON);
    delay(500);
    digitalWrite(LED, LED_OFF);

    delay(1000);

    i2c_init();
    PORTC = (1 << PORTC4) | (1 << PORTC5);
    digitalWrite(LED, LED_ON);
    delay(500);
    digitalWrite(LED, LED_OFF);

    digitalWrite(IO, IO_RECEIVE);

    delay(1000);
}

void loop()
{
    
    while ((Serial.available() > 0) && (!sendData)) {
        messageRequest = Serial.read();
        if (messageRequest == 0x95) {
            sendData = true;
        }
    }

    if (sendData) {
        digitalWrite(LED, LED_ON);
        digitalWrite(IO, IO_TRANSMIT);

        readSensor();

       // HEADER is FF
        Serial.write(HEADER);
        delay(2);

        // FROM
        Serial.write(0x95);
        delay(2);

        // DATA payload
        Serial.write(data_high_A);
        delay(2);
        Serial.write(data_low_A);
        delay(2);
        Serial.write(data_high_B);
        delay(2);
        Serial.write(data_low_B);
        delay(2);

        // TO
        Serial.write(0xA3);
        delay(2);

        sendData = false;

        digitalWrite(IO, IO_RECEIVE);
        digitalWrite(LED, LED_OFF);
    }
    delay(100);
}

void readSensor()
{
    // read sensor 1
    i2c_start_wait(dev_A + I2C_WRITE);
    i2c_write(0x07); // RAM location of Tobj1
    i2c_rep_start(dev_A + I2C_READ);
    data_low_A = i2c_readAck();
    data_high_A = i2c_readAck();
    pec = i2c_readNak();
    i2c_stop();

    // read sensor 2
    i2c_start_wait(dev_B + I2C_WRITE);
    i2c_write(0x07);
    i2c_rep_start(dev_B + I2C_READ);
    data_low_B = i2c_readAck();
    data_high_B = i2c_readAck();
    pec = i2c_readNak();
    i2c_stop();
}
