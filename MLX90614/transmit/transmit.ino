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

int dev_A = 0x3A << 1; // address location sensor 1
int dev_B = 0x4B << 1; // address location sesnor 2

int val = 0;

int data_low = 0;
int data_high = 0;
int pec = 0;
double tempFactor = 0.02;
double tempData_A = 0;
double tempData_B = 0;

byte megaRequest = 0;

void setup()
{
    // Status LED
    pinMode(7, OUTPUT);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);

    delay(1000);
    
    Serial.begin(9600);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);

    delay(1000);

    // I/O control for serial comms
    pinMode(2, OUTPUT);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);

    delay(1000);

    // DIP switch address
    pinMode(3, INPUT);
    pinMode(4, INPUT);
    pinMode(5, INPUT);
    pinMode(6, INPUT);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);

    delay(1000);

    i2c_init();
    PORTC = (1 << PORTC4) | (1 << PORTC5);
    digitalWrite(7, LOW);
    delay(3000);
    digitalWrite(7, HIGH);

    delay(1000);

    // start bit, 3 bit sender, 3 bit receiver, end bit
    // 1 000 001 1
    digitalWrite(2, LOW);
    while (megaRequest != 0x83) {
        digitalWrite(7, LOW);
        delay(300);
        if (Serial.availabe() > 0) {
            megaRequest = Serial.read();
        }
    }
    digitalWrite(2, HIGH);
    digitalWrite(7, HIGH);
    readSensor();
    
    // 1 001 010 1
    Serial.write(0x95);
    Serial.write(tempData_A);
    Serial.write(tempData_B);
    Serial.write(0);
    digitalWrite(2, LOW);
}

void loop()
{
    digitalWrite(2, LOW);
    megaRequest = 0;
    // 1 100 001 1
    while (megaRequest != 0xC3) {
        digitalWrite(7, LOW);
        if (Serial.available() > 0) {
            megaRequest = Serial.read();
        }
    }

    digitalWrite(2, HIGH);
    digitalWrite(7, HIGH);
    readSensor();
    Serial.write(0x95);
    Serial.write(tempData_A);
    Serial.write(tempData_B);
    Serial.write(0);
}

void readSensor()
{
    tempData_A = 0;
    tempData_B = 0;

    // read sensor 1
    i2c_start_wait(dev_A + I2C_WRITE);
    i2c_write(0x07); // RAM location of Tobj1
    i2c_rep_start(dev_A + I2C_READ);
    data_low = i2c_readAck();
    data_high = i2c_readAck();
    pec = i2c_readNak();
    i2c_stop();
    tempData_A = (double)(((data_high & 0x007F) << 8) + data_low);
    tempData_A = (tempData_A * tempFactor) - 0.01;
    tempData_A = tempData_A - 273.15;

    // read sensor 2
    i2c_start_wait(dev_B + I2C_WRITE);
    i2c_write(0x07);
    i2c_rep_start(dev_B + I2C_READ);
    data_low = i2c_readAck();
    data_high = i2c_readAck();
    pec = i2c_readNak();
    i2c_stop();
    tempData_B = (double)(((data_high & 0x007F) << 8) + data_low);
    tempData_B = (tempData_B * tempFactor) - 0.01;
    tempData_B = tempData_B - 273.15;
}