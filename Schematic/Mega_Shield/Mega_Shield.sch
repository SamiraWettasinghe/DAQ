EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J9
U 1 1 5F8F3F29
P 7450 5650
F 0 "J9" H 7400 5650 50  0000 C CNN
F 1 "SD_Card_Module" H 7650 5950 50  0000 C CNN
F 2 "Onboard_Sensors:SD_Module_Vertical" H 7450 5650 50  0001 C CNN
F 3 "~" H 7450 5650 50  0001 C CNN
	1    7450 5650
	-1   0    0    1   
$EndComp
$Comp
L Mega_Shield-rescue:ISL81487EIPZ-TTS_UART U1
U 1 1 5F8D746F
P 3650 1350
F 0 "U1" H 3650 1775 50  0000 C CNN
F 1 "ISL81487EIPZ" H 3650 1684 50  0000 C CNN
F 2 "TTS-URAT:ISL81487EIPZ-PDIP" H 3650 1350 50  0001 C CNN
F 3 "" H 3650 1350 50  0001 C CNN
	1    3650 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 1600 4100 1600
Text Label 6950 2750 0    50   ~ 0
D22
Text Label 3950 1300 0    50   ~ 0
D22
Text Label 3950 1450 0    50   ~ 0
D22
Wire Wire Line
	3350 1300 3050 1300
Wire Wire Line
	3350 1450 3300 1450
Wire Wire Line
	3300 1450 3300 1600
$Comp
L Connector:Mini-DIN-4 J1
U 1 1 5F8ED783
P 1250 2000
F 0 "J1" V 1204 2230 50  0000 L CNN
F 1 "Mini-DIN-4" V 1295 2230 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x02_P2.54mm_Vertical" H 1250 2000 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 1250 2000 50  0001 C CNN
	1    1250 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 1300 1350 1700
Wire Wire Line
	1350 2400 1350 2300
$Comp
L Device:D_Zener D1
U 1 1 5F8F038A
P 2300 1450
F 0 "D1" V 2254 1530 50  0000 L CNN
F 1 "D_Zener" V 2345 1530 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2300 1450 50  0001 C CNN
F 3 "~" H 2300 1450 50  0001 C CNN
	1    2300 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F8F1A0C
P 2300 1650
F 0 "#PWR06" H 2300 1400 50  0001 C CNN
F 1 "GND" H 2305 1477 50  0000 C CNN
F 2 "" H 2300 1650 50  0001 C CNN
F 3 "" H 2300 1650 50  0001 C CNN
	1    2300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1600 2300 1650
$Comp
L Device:D_Zener D2
U 1 1 5F8F3024
P 2400 2550
F 0 "D2" V 2354 2630 50  0000 L CNN
F 1 "D_Zener" V 2445 2630 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2400 2550 50  0001 C CNN
F 3 "~" H 2400 2550 50  0001 C CNN
	1    2400 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F8F3573
P 2400 2750
F 0 "#PWR07" H 2400 2500 50  0001 C CNN
F 1 "GND" H 2405 2577 50  0000 C CNN
F 2 "" H 2400 2750 50  0001 C CNN
F 3 "" H 2400 2750 50  0001 C CNN
	1    2400 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2700 2400 2750
Wire Wire Line
	1250 2300 1250 2350
$Comp
L Device:R R1
U 1 1 5F8EBE5B
P 3050 1450
F 0 "R1" H 3120 1496 50  0000 L CNN
F 1 "100" H 3120 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2980 1450 50  0001 C CNN
F 3 "~" H 3050 1450 50  0001 C CNN
	1    3050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1700 1250 1600
Wire Wire Line
	1250 1600 850  1600
$Comp
L power:VCC #PWR09
U 1 1 5F8E9EDB
P 3250 1100
F 0 "#PWR09" H 3250 950 50  0001 C CNN
F 1 "VCC" H 3265 1273 50  0000 C CNN
F 2 "" H 3250 1100 50  0001 C CNN
F 3 "" H 3250 1100 50  0001 C CNN
	1    3250 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F8FF73F
P 2850 1000
F 0 "C1" H 2965 1046 50  0000 L CNN
F 1 "0.1uF" H 2965 955 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2888 850 50  0001 C CNN
F 3 "~" H 2850 1000 50  0001 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F900B2C
P 2850 800
F 0 "#PWR08" H 2850 550 50  0001 C CNN
F 1 "GND" H 2855 627 50  0000 C CNN
F 2 "" H 2850 800 50  0001 C CNN
F 3 "" H 2850 800 50  0001 C CNN
	1    2850 800 
	-1   0    0    1   
$EndComp
Text Label 6950 2350 0    50   ~ 0
D10
Wire Wire Line
	4050 5750 4350 5750
Wire Wire Line
	4050 5750 4050 5700
$Comp
L power:VCC #PWR017
U 1 1 5F90DE60
P 7600 6050
F 0 "#PWR017" H 7600 5900 50  0001 C CNN
F 1 "VCC" H 7615 6223 50  0000 C CNN
F 2 "" H 7600 6050 50  0001 C CNN
F 3 "" H 7600 6050 50  0001 C CNN
	1    7600 6050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F9126E2
P 7250 5100
F 0 "#PWR016" H 7250 4850 50  0001 C CNN
F 1 "GND" H 7255 4927 50  0000 C CNN
F 2 "" H 7250 5100 50  0001 C CNN
F 3 "" H 7250 5100 50  0001 C CNN
	1    7250 5100
	-1   0    0    1   
$EndComp
Text Label 6950 1550 0    50   ~ 0
D2
$Comp
L power:GND #PWR015
U 1 1 5F926BD4
P 4100 3850
F 0 "#PWR015" H 4100 3600 50  0001 C CNN
F 1 "GND" H 4105 3677 50  0000 C CNN
F 2 "" H 4100 3850 50  0001 C CNN
F 3 "" H 4100 3850 50  0001 C CNN
	1    4100 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 5F92A51F
P 3950 3850
F 0 "#PWR012" H 3950 3700 50  0001 C CNN
F 1 "VCC" H 3965 4023 50  0000 C CNN
F 2 "" H 3950 3850 50  0001 C CNN
F 3 "" H 3950 3850 50  0001 C CNN
	1    3950 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2850 850  2850 800 
Wire Wire Line
	3250 1100 3250 1150
Connection ~ 3250 1150
Wire Wire Line
	2400 2400 2400 1600
Wire Wire Line
	3300 1600 3050 1600
Wire Wire Line
	4100 1850 4350 1850
Wire Wire Line
	3950 1150 4150 1150
Text Label 4350 5550 2    50   ~ 0
5V
Text Label 4350 4950 2    50   ~ 0
GND
Text Label 4350 5050 2    50   ~ 0
GND
NoConn ~ 5400 1100
NoConn ~ 5500 1100
NoConn ~ 5600 1100
NoConn ~ 5700 1100
NoConn ~ 5800 1100
NoConn ~ 5900 1100
Text Label 4350 1550 2    50   ~ 0
D0
Text Label 4350 1650 2    50   ~ 0
D1
Text Label 4350 1750 2    50   ~ 0
D19
Text Label 4350 1850 2    50   ~ 0
D18
Text Label 4350 1950 2    50   ~ 0
D17
Text Label 4350 2050 2    50   ~ 0
D16
Text Label 4350 2150 2    50   ~ 0
D15
Text Label 4350 2250 2    50   ~ 0
D14
Text Label 4350 2550 2    50   ~ 0
SDA
Text Label 4350 2650 2    50   ~ 0
SCL
Text Label 4350 2350 2    50   ~ 0
D20
Text Label 4350 2450 2    50   ~ 0
D21
Text Label 4350 2850 2    50   ~ 0
A0
Text Label 4350 2950 2    50   ~ 0
A1
Text Label 4350 3050 2    50   ~ 0
A2
Text Label 4350 3150 2    50   ~ 0
A3
Text Label 4350 3250 2    50   ~ 0
A4
Text Label 4350 3350 2    50   ~ 0
A5
Text Label 4350 3450 2    50   ~ 0
A6
Text Label 4350 3650 2    50   ~ 0
A8
Text Label 4350 3750 2    50   ~ 0
A9
Text Label 4350 3850 2    50   ~ 0
A10
Text Label 4350 3950 2    50   ~ 0
A11
Text Label 4350 4050 2    50   ~ 0
A12
Text Label 4350 4150 2    50   ~ 0
A13
Text Label 4350 4250 2    50   ~ 0
A14
Text Label 4350 4350 2    50   ~ 0
A15
Text Label 4350 4450 2    50   ~ 0
AREF
Text Label 4350 4650 2    50   ~ 0
RESET
Text Label 4350 4750 2    50   ~ 0
IOREF
Text Label 4350 5250 2    50   ~ 0
GND
Text Label 4350 5350 2    50   ~ 0
GND
Text Label 4350 5450 2    50   ~ 0
3V3
Text Label 4350 5650 2    50   ~ 0
5V
Text Label 4350 5750 2    50   ~ 0
5V
Text Label 4350 5850 2    50   ~ 0
VIN
Text Label 6950 5850 0    50   ~ 0
D53
Text Label 6950 5750 0    50   ~ 0
D52
Text Label 6950 5650 0    50   ~ 0
D51
Text Label 6950 5550 0    50   ~ 0
D50
Text Label 6950 5450 0    50   ~ 0
D49
Text Label 6950 5350 0    50   ~ 0
D48
Text Label 6950 5250 0    50   ~ 0
D47
Text Label 6950 5150 0    50   ~ 0
D46
Text Label 6950 5050 0    50   ~ 0
D45
Text Label 6950 4950 0    50   ~ 0
D44
Text Label 6950 4850 0    50   ~ 0
D43
Text Label 6950 4750 0    50   ~ 0
D42
Text Label 6950 4650 0    50   ~ 0
D41
Text Label 6950 4550 0    50   ~ 0
D40
Text Label 6950 4450 0    50   ~ 0
D39
Text Label 6950 4350 0    50   ~ 0
D38
Text Label 6950 4250 0    50   ~ 0
D37
Text Label 6950 4150 0    50   ~ 0
D36
Text Label 6950 4050 0    50   ~ 0
D35
Text Label 6950 3950 0    50   ~ 0
D34
Text Label 6950 3850 0    50   ~ 0
D33
Text Label 6950 3750 0    50   ~ 0
D32
Text Label 6950 3650 0    50   ~ 0
D31
Text Label 6950 3550 0    50   ~ 0
D30
Text Label 6950 3450 0    50   ~ 0
D29
Text Label 6950 3350 0    50   ~ 0
D28
Text Label 6950 3250 0    50   ~ 0
D27
Text Label 6950 3150 0    50   ~ 0
D26
Text Label 6950 3050 0    50   ~ 0
D25
Text Label 6950 2950 0    50   ~ 0
D24
Text Label 6950 2850 0    50   ~ 0
D23
Text Label 6950 2650 0    50   ~ 0
D13
Text Label 6950 2550 0    50   ~ 0
D12
Text Label 6950 2450 0    50   ~ 0
D11
Text Label 6950 2250 0    50   ~ 0
D9
Text Label 6950 2150 0    50   ~ 0
D8
Text Label 6950 2050 0    50   ~ 0
D7
Text Label 6950 1950 0    50   ~ 0
D6
Text Label 6950 1850 0    50   ~ 0
D5
Text Label 6950 1750 0    50   ~ 0
D4
Text Label 6950 1650 0    50   ~ 0
D3
Wire Wire Line
	4100 1600 4100 1850
Wire Wire Line
	4350 1750 4150 1750
Wire Wire Line
	4150 1750 4150 1150
Wire Wire Line
	2850 1150 3250 1150
Wire Wire Line
	3250 1150 3350 1150
$Comp
L Connector:Mini-DIN-4 J4
U 1 1 5F903D98
P 1250 5150
F 0 "J4" V 1204 5380 50  0000 L CNN
F 1 "Mini-DIN-4" V 1295 5380 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x02_P2.54mm_Vertical" H 1250 5150 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 1250 5150 50  0001 C CNN
	1    1250 5150
	0    1    1    0   
$EndComp
Connection ~ 3050 1300
Wire Wire Line
	2000 4750 1350 4750
Wire Wire Line
	1350 4750 1350 4850
Wire Wire Line
	2200 5550 1350 5550
Wire Wire Line
	1350 5550 1350 5450
Connection ~ 2300 1300
Wire Wire Line
	2300 1300 3050 1300
Wire Wire Line
	1250 4850 1250 4750
Wire Wire Line
	1250 4750 850  4750
Connection ~ 850  4750
Wire Wire Line
	850  4750 850  5850
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 5F8F5A4B
P 2600 4900
F 0 "J8" H 2550 4850 50  0000 C CNN
F 1 "NEO-6M" H 2700 4650 50  0000 C CNN
F 2 "Onboard_Sensors:NEO-6M" H 2600 4900 50  0001 C CNN
F 3 "~" H 2600 4900 50  0001 C CNN
	1    2600 4900
	1    0    0    -1  
$EndComp
Text Label 4350 5150 2    50   ~ 0
GND
$Comp
L Device:LED D4
U 1 1 5F920F36
P 7600 4900
F 0 "D4" V 7639 4782 50  0000 R CNN
F 1 "RED" V 7548 4782 50  0000 R CNN
F 2 "Digikey:LED_3mm_Radial" H 7600 4900 50  0001 C CNN
F 3 "~" H 7600 4900 50  0001 C CNN
	1    7600 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 4350 7600 4400
Wire Wire Line
	1250 5450 1000 5450
Connection ~ 1000 5450
Wire Wire Line
	1000 5450 1000 6000
Wire Wire Line
	1000 2350 1250 2350
$Comp
L Device:R R2
U 1 1 5FA529EF
P 7600 4550
F 0 "R2" H 7670 4596 50  0000 L CNN
F 1 "4.7k" H 7670 4505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7530 4550 50  0001 C CNN
F 3 "~" H 7600 4550 50  0001 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 4700 7600 4750
Wire Wire Line
	6950 4350 7600 4350
Wire Wire Line
	6950 5650 7250 5650
Wire Wire Line
	7250 5550 6950 5550
Wire Wire Line
	7250 5750 6950 5750
Wire Wire Line
	7250 5850 6950 5850
Wire Wire Line
	7250 5350 7250 5200
Wire Wire Line
	7250 5450 7200 5450
Wire Wire Line
	7200 5450 7200 5250
Wire Wire Line
	7200 5250 7600 5250
Wire Wire Line
	7600 5250 7600 6050
$Comp
L power:VDD #PWR019
U 1 1 5FD1FB07
P 4050 5400
F 0 "#PWR019" H 4050 5250 50  0001 C CNN
F 1 "VDD" H 4065 5573 50  0000 C CNN
F 2 "" H 4050 5400 50  0001 C CNN
F 3 "" H 4050 5400 50  0001 C CNN
	1    4050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5450 4050 5450
Wire Wire Line
	4050 5450 4050 5400
Wire Wire Line
	4000 4950 4000 4850
Wire Wire Line
	4000 4950 4350 4950
$Comp
L power:GND #PWR013
U 1 1 5F910D06
P 4000 4850
F 0 "#PWR013" H 4000 4600 50  0001 C CNN
F 1 "GND" H 4005 4677 50  0000 C CNN
F 2 "" H 4000 4850 50  0001 C CNN
F 3 "" H 4000 4850 50  0001 C CNN
	1    4000 4850
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x08_Male J7
U 1 1 60012E5F
P 3650 3150
F 0 "J7" H 3650 3500 50  0000 C CNN
F 1 "MPU 6050" H 3750 2700 50  0000 C CNN
F 2 "Onboard_Sensors:GY-521" H 3650 3150 50  0001 C CNN
F 3 "~" H 3650 3150 50  0001 C CNN
	1    3650 3150
	1    0    0    -1  
$EndComp
$Comp
L Mega_Shield-rescue:Arduino_Mega2560_Shield-arduino XA1
U 1 1 5F8E6D38
P 5650 3700
F 0 "XA1" H 5650 1319 60  0000 C CNN
F 1 "Arduino_Mega2560_Shield" H 5650 1213 60  0000 C CNN
F 2 "Arduino:Arduino_Mega2560_Shield" H 6350 6450 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 6350 6450 60  0001 C CNN
	1    5650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3550 3950 3550
Connection ~ 3950 3550
Wire Wire Line
	3950 3550 3950 3850
Wire Wire Line
	3850 3450 4100 3450
Connection ~ 4100 3450
Wire Wire Line
	4100 3450 4100 3850
Wire Wire Line
	3850 3350 4200 3350
Wire Wire Line
	3850 3250 4150 3250
Wire Wire Line
	3850 3150 4100 3150
Wire Wire Line
	4100 3150 4100 3450
Text Label 3850 3050 0    50   ~ 0
D2
NoConn ~ 3850 2950
NoConn ~ 3850 2850
Text GLabel 3500 2850 0    50   Input ~ 0
INT
Text GLabel 3500 2950 0    50   Input ~ 0
ADC
Text GLabel 3500 3050 0    50   Input ~ 0
XCL
Text GLabel 3500 3150 0    50   Input ~ 0
XDA
Text GLabel 3500 3250 0    50   Input ~ 0
SDA
Text GLabel 3500 3350 0    50   Input ~ 0
SCL
Text GLabel 3500 3450 0    50   Input ~ 0
GND
Text GLabel 3500 3550 0    50   Input ~ 0
VCC
Text Label 3050 1950 0    50   ~ 0
D17
Text Label 3050 1850 0    50   ~ 0
D16
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 6005CACC
P 2850 1950
F 0 "J6" H 2850 2200 50  0000 C CNN
F 1 "BLE HC-05" H 2900 1600 50  0000 C CNN
F 2 "Onboard_Sensors:BLEHC-05" H 2850 1950 50  0001 C CNN
F 3 "~" H 2850 1950 50  0001 C CNN
	1    2850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2150 3250 2150
Wire Wire Line
	3250 2150 3250 2650
Wire Wire Line
	3250 2650 3950 2650
Wire Wire Line
	3950 2650 3950 3550
$Comp
L power:GND #PWR010
U 1 1 5F8EAC8E
P 3350 2050
F 0 "#PWR010" H 3350 1800 50  0001 C CNN
F 1 "GND" H 3355 1877 50  0000 C CNN
F 2 "" H 3350 2050 50  0001 C CNN
F 3 "" H 3350 2050 50  0001 C CNN
	1    3350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1600 3350 2050
Wire Wire Line
	3050 2050 3350 2050
Connection ~ 3350 2050
Wire Wire Line
	2400 1600 3050 1600
Connection ~ 3050 1600
Text GLabel 2700 1750 0    50   Input ~ 0
STATE
Text GLabel 2700 1850 0    50   Input ~ 0
RX
Text GLabel 2700 1950 0    50   Input ~ 0
TX
Text GLabel 2700 2050 0    50   Input ~ 0
GND
Text GLabel 2700 2150 0    50   Input ~ 0
VCC
Text GLabel 2700 2250 0    50   Input ~ 0
INT
Wire Wire Line
	2900 6650 2300 6650
Wire Wire Line
	2300 6650 2300 6800
Wire Wire Line
	2400 6800 2400 6050
Wire Wire Line
	2400 6050 2900 6050
$Comp
L power:GND #PWR02
U 1 1 600D54A4
P 3800 6600
F 0 "#PWR02" H 3800 6350 50  0001 C CNN
F 1 "GND" H 3805 6427 50  0000 C CNN
F 2 "" H 3800 6600 50  0001 C CNN
F 3 "" H 3800 6600 50  0001 C CNN
	1    3800 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 6350 2550 6400
Wire Wire Line
	2600 6350 2550 6350
$Comp
L power:GND #PWR01
U 1 1 5F9CBB76
P 2550 6400
F 0 "#PWR01" H 2550 6150 50  0001 C CNN
F 1 "GND" H 2555 6227 50  0000 C CNN
F 2 "" H 2550 6400 50  0001 C CNN
F 3 "" H 2550 6400 50  0001 C CNN
	1    2550 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6000 3850 6600
Wire Wire Line
	3850 6600 3800 6600
Connection ~ 3850 6600
Wire Wire Line
	850  1600 850  4750
Wire Wire Line
	1000 2350 1000 5450
$Comp
L power:VCC #PWR0101
U 1 1 600AFCDD
P 4050 5700
F 0 "#PWR0101" H 4050 5550 50  0001 C CNN
F 1 "VCC" H 4065 5873 50  0000 C CNN
F 2 "" H 4050 5700 50  0001 C CNN
F 3 "" H 4050 5700 50  0001 C CNN
	1    4050 5700
	1    0    0    -1  
$EndComp
Text GLabel 4250 6700 2    50   Input ~ 0
VO+
Text GLabel 4250 6600 2    50   Input ~ 0
GND
Text GLabel 4250 6500 2    50   Input ~ 0
IN+
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 600CCBA8
P 4250 6500
F 0 "J2" H 4100 6700 50  0000 L CNN
F 1 "Conn_01x04_Female" H 3850 6200 50  0000 L CNN
F 2 "Onboard_Sensors:Voltage_Regulator" H 4250 6500 50  0001 C CNN
F 3 "~" H 4250 6500 50  0001 C CNN
	1    4250 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6600 4050 6600
NoConn ~ 4050 6400
$Comp
L Device:D_Bridge_+AA- D3
U 1 1 5F9B1CA7
P 2900 6350
F 0 "D3" H 2850 6350 50  0000 L CNN
F 1 "D_Bridge_+AA-" H 2650 6000 50  0000 L CNN
F 2 "TTS-URAT:KBP306GTB" H 2900 6350 50  0001 C CNN
F 3 "~" H 2900 6350 50  0001 C CNN
	1    2900 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 5150 7600 5150
Wire Wire Line
	7600 5150 7600 5050
Connection ~ 7250 5150
Wire Wire Line
	7250 5150 7250 5100
$Comp
L Connector:Mini-DIN-4 J3
U 1 1 600CA1DA
P 2350 7200
F 0 "J3" H 2304 7430 50  0000 L CNN
F 1 "Mini-DIN-4" H 2150 6950 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x02_P2.54mm_Vertical" H 2350 7200 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 2350 7200 50  0001 C CNN
	1    2350 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6800 1950 6800
Wire Wire Line
	1950 6800 1950 7200
Wire Wire Line
	1950 7200 2050 7200
Wire Wire Line
	2650 7200 2700 7200
Wire Wire Line
	2700 7200 2700 6800
Wire Wire Line
	2700 6800 2400 6800
Wire Wire Line
	4150 3250 4150 2350
Wire Wire Line
	4150 2350 4350 2350
Wire Wire Line
	4200 3350 4200 2450
Wire Wire Line
	4200 2450 4350 2450
Text Label 3050 1750 0    50   ~ 0
D23
$Comp
L Device:R R3
U 1 1 60320B40
P 8050 4700
F 0 "R3" H 8120 4746 50  0000 L CNN
F 1 "4.7k" H 8120 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7980 4700 50  0001 C CNN
F 3 "~" H 8050 4700 50  0001 C CNN
	1    8050 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 6032122A
P 8050 5000
F 0 "D5" V 8089 4882 50  0000 R CNN
F 1 "RED" V 7998 4882 50  0000 R CNN
F 2 "Digikey:LED_3mm_Radial" H 8050 5000 50  0001 C CNN
F 3 "~" H 8050 5000 50  0001 C CNN
	1    8050 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 5150 8050 5200
Wire Wire Line
	8050 5200 7250 5200
Connection ~ 7250 5200
Wire Wire Line
	7250 5200 7250 5150
Connection ~ 2400 2400
Connection ~ 2000 1300
Wire Wire Line
	2000 1300 2300 1300
Wire Wire Line
	1350 1300 2000 1300
Wire Wire Line
	2200 2400 2200 5550
Wire Wire Line
	2000 1300 2000 4750
Wire Wire Line
	2200 2400 2400 2400
Connection ~ 2200 2400
Wire Wire Line
	1350 2400 2200 2400
$Comp
L Connector:Conn_01x06_Female J10
U 1 1 6032055E
P 3600 5000
F 0 "J10" H 3628 4976 50  0000 L CNN
F 1 "Serial Reader" H 3150 4600 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 3600 5000 50  0001 C CNN
F 3 "~" H 3600 5000 50  0001 C CNN
	1    3600 5000
	1    0    0    -1  
$EndComp
NoConn ~ 3400 4800
NoConn ~ 3400 5200
$Comp
L power:GND #PWR04
U 1 1 603285E4
P 3250 5300
F 0 "#PWR04" H 3250 5050 50  0001 C CNN
F 1 "GND" H 3255 5127 50  0000 C CNN
F 2 "" H 3250 5300 50  0001 C CNN
F 3 "" H 3250 5300 50  0001 C CNN
	1    3250 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 5300 3300 5300
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 6032D232
P 3150 4400
F 0 "J5" V 3212 4544 50  0000 L CNN
F 1 "Jumper" V 3303 4544 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3150 4400 50  0001 C CNN
F 3 "~" H 3150 4400 50  0001 C CNN
	1    3150 4400
	0    1    1    0   
$EndComp
Text Label 2800 4900 0    50   ~ 0
D14
Text Label 2800 5000 0    50   ~ 0
D15
Wire Wire Line
	3150 4600 3150 4800
Wire Wire Line
	3150 4800 2800 4800
Wire Wire Line
	3250 4600 3250 5100
Wire Wire Line
	3250 5100 3400 5100
$Comp
L power:VCC #PWR03
U 1 1 603587E0
P 3050 4600
F 0 "#PWR03" H 3050 4450 50  0001 C CNN
F 1 "VCC" H 3050 4750 50  0000 C CNN
F 2 "" H 3050 4600 50  0001 C CNN
F 3 "" H 3050 4600 50  0001 C CNN
	1    3050 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 4900 3100 4900
Wire Wire Line
	3100 4900 3100 5000
Wire Wire Line
	3100 5000 3400 5000
Wire Wire Line
	2800 5000 3000 5000
Wire Wire Line
	3000 5000 3000 5050
Wire Wire Line
	3000 5050 3200 5050
Wire Wire Line
	3200 5050 3200 4900
Wire Wire Line
	3200 4900 3400 4900
Wire Wire Line
	2800 5100 3050 5100
Wire Wire Line
	3050 5100 3050 5200
Wire Wire Line
	3050 5200 3300 5200
Wire Wire Line
	3300 5200 3300 5300
Connection ~ 3300 5300
Wire Wire Line
	3300 5300 3400 5300
Text Label 8050 4550 1    50   ~ 0
D40
Wire Wire Line
	3850 7100 3850 6750
Wire Wire Line
	2050 7100 2050 6900
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6033D4ED
P 2950 3950
F 0 "J11" H 2900 3900 50  0000 C CNN
F 1 "RESET SWT" H 3100 3750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2950 3950 50  0001 C CNN
F 3 "~" H 2950 3950 50  0001 C CNN
	1    2950 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J12
U 1 1 6034557A
P 3450 6950
F 0 "J12" V 3512 7094 50  0000 L CNN
F 1 "Switch" V 3400 6800 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3450 6950 50  0001 C CNN
F 3 "~" H 3450 6950 50  0001 C CNN
	1    3450 6950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1000 6000 3850 6000
Wire Wire Line
	4000 6700 4000 7100
Wire Wire Line
	4000 7100 4550 7100
Wire Wire Line
	4550 7100 4550 6050
Wire Wire Line
	4550 6050 3950 6050
Wire Wire Line
	3950 6050 3950 5850
Wire Wire Line
	4000 6700 4050 6700
Connection ~ 3950 5850
Wire Wire Line
	3950 5850 4350 5850
Wire Wire Line
	850  5850 3950 5850
Wire Wire Line
	3200 6350 3350 6350
Wire Wire Line
	3350 6350 3350 6550
Wire Wire Line
	4100 6500 4050 6500
Wire Wire Line
	3450 6500 3450 6750
Connection ~ 4050 6500
Wire Wire Line
	4050 6500 3450 6500
Wire Wire Line
	3350 6550 3100 6550
Wire Wire Line
	3100 6550 3100 6900
Wire Wire Line
	3100 6900 2050 6900
Connection ~ 3350 6550
Wire Wire Line
	3350 6550 3350 6750
Wire Wire Line
	3850 6750 3550 6750
Connection ~ 3850 6750
Wire Wire Line
	3850 6750 3850 6600
Wire Wire Line
	2650 7100 3850 7100
Text GLabel 2450 4900 0    50   Input ~ 0
RX
Text GLabel 2450 4800 0    50   Input ~ 0
VCC
Text GLabel 2450 5000 0    50   Input ~ 0
TX
Text GLabel 2450 5100 0    50   Input ~ 0
GND
Text Label 3150 4050 0    50   ~ 0
RESET
$Comp
L power:GND #PWR05
U 1 1 6033E4BD
P 3450 3950
F 0 "#PWR05" H 3450 3700 50  0001 C CNN
F 1 "GND" H 3455 3777 50  0000 C CNN
F 2 "" H 3450 3950 50  0001 C CNN
F 3 "" H 3450 3950 50  0001 C CNN
	1    3450 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 3950 3450 3950
$EndSCHEMATC
