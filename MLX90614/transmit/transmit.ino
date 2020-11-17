/*
Transmit node transmit data from tire temp nanos to mega.
*/

int dev_A = 0x3A << 1; // address location sensor 1
int dev_B = 0x4B << 1; // address location sesnor 2

int val = 0;

void setup()
{
    // Status LED
    pinMode(7, OUTPUT);
    
    Serial.begin(9600);
    //Serial.println("Setup...");

    // I/O control for serial comms
    pinMode(2, OUTPUT);

    // DIP switch address
    pinMode(3, INPUT);
    pinMode(4, INPUT);
    pinMode(5, INPUT);
    pinMode(6, INPUT);

//    i2c_init();
//    PORTC = (1 << PORTC4) | (1 << PORTC5);
//    Serial.println("i2c Initialized");
}

void loop()
{
//    int data_low_A = 0;
//    int data_high_A = 0;
//    int pec_A = 0;
//    int data_high_B = 0;
//    int data_low_B = 0;
//    int pec_B = 0;
//
//    // read sensor 1
//    i2c_start_wait(dev_A + I2C_WRITE);
//    i2c_write(0x07); // RAM location of Tobj1
//    i2c_rep_start(dev_A + I2C_READ);
//    data_low_A = i2c_readAck();
//    data_high_A = i2c_readAck();
//    pec_A = i2c_readNak();
//    i2c_stop();
//    Serial.print("A ");
//    Serial.print(data_low_A);
//    Serial.println();
//
//    // read sensor 2
//    i2c_start_wait(dev_B + I2C_WRITE);
//    i2c_write(0x07);
//    i2c_rep_start(dev_B + I2C_READ);
//    data_low_B = i2c_readAck();
//    data_high_B = i2c_readAck();
//    pec_B = i2c_readNak();
//    i2c_stop();
//    Serial.print("B ");
//    Serial.print(data_low_B);
//    Serial.println();
//
//    time = millis();
//    timeBuffer[0] = time;
//    timeBuffer[1] = time >> 8;
//    timeBuffer[2] = time >> 16;
//    timeBuffer[3] = time >> 24;

    digitalWrite(2, HIGH);
    delay(2);
    Serial.write(69);
    digitalWrite(2, HIGH);

    val = digitalRead(3);
    val = digitalRead(4);
    val = digitalRead(5);
    val = digitalRead(6);

    digitalWrite(7, LOW);
    Serial.println("LOW");
    delay(1000);
    digitalWrite(7, HIGH);
    Serial.println("HIGH");
    delay(1000);
}
