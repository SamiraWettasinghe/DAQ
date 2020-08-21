# Accelerometer Integration Instructions

## Sensor Info
The sensor is an MPU-6050 which is a MEMS accelerometer and MEMS gyro on board one chip. This chip is a complete 6 DOF accelerometer. The specific supplier part number is GY-521 from [Gikfun](https://www.amazon.ca/gp/product/B07JPK26X2/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1). The breakout board comes with a voltage regulator as well as pull up resistors already onboard. There are some cases where the boards come with the wrong capacitor or bad capacitor which results in noisy readings.

## Sensor Communications
The sensor uses i2c to interface with the Arduino through the SCL and SDA pins. Through these pins, the sensor acts as a slave to the main controler (Arduino in this case). There is also a secondary i2c bus that you can access through the XDA and XCL pins where the sensor can be configured as the master. These two pins won't be used for this project.

## Instructions
This board does not need to be wired to an external through hole PCB. It ca be mounted directly to a surface with wires going from the accelerometer pin to the Nano pin. The mapping is as follows:
Accelerometer | Nano
------------- | ----
INT | D2
ADO | GND
SDA | A4
SCL | A5
GND | GND
VCC | 5V

The Nano will need a power source so make sure to connect VIN and GND to the positive and negative of a 9 volt (or other external battery). The CAN communication wiring is the same as before.

## Mounting
I recomend the surface should be a smooth, hard surface (such as a machined block of aluminium).There are two mounting holes on the acclerometer board that can be used. The accelerometer, Nano and MCP2515 can be packaged into one enclosure. This package needs to be located as close as possible to the vehicle centre of gravity. On the BRZ, this is near the cup holders and as low as possible.

## Code
The code is already configured to communicate via CAN to the Mega. Two messages will be sent, one for the linear accelerometer data (CAN ID 0x06) and the other for the gyrometer data (CAN ID 0x07).