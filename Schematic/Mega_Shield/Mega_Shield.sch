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
L arduino:Arduino_Mega2560_Shield XA1
U 1 1 5F8E6D38
P 5650 3700
F 0 "XA1" H 5650 1319 60  0000 C CNN
F 1 "Arduino_Mega2560_Shield" H 5650 1213 60  0000 C CNN
F 2 "Arduino:Arduino_Mega2560_Shield" H 6350 6450 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 6350 6450 60  0001 C CNN
	1    5650 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J9
U 1 1 5F8F3F29
P 7550 5850
F 0 "J9" H 7500 5850 50  0000 C CNN
F 1 "SD_Card_Module" H 7650 5450 50  0000 C CNN
F 2 "Onboard_Sensors:SD_Module" H 7550 5850 50  0001 C CNN
F 3 "~" H 7550 5850 50  0001 C CNN
	1    7550 5850
	-1   0    0    1   
$EndComp
$Comp
L TTS_UART:ISL81487EIPZ U1
U 1 1 5F8D746F
P 3650 1350
F 0 "U1" H 3650 1775 50  0000 C CNN
F 1 "ISL81487EIPZ" H 3650 1684 50  0000 C CNN
F 2 "TTS-UART:ISL81487EIPZ-PDIP" H 3650 1350 50  0001 C CNN
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
F 2 "TTS-UART:KMDGX-4S-BS" H 1250 2000 50  0001 C CNN
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
F 2 "Diode_SMD:D_SOD-923" H 2300 1450 50  0001 C CNN
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
P 2600 2550
F 0 "D2" V 2554 2630 50  0000 L CNN
F 1 "D_Zener" V 2645 2630 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-923" H 2600 2550 50  0001 C CNN
F 3 "~" H 2600 2550 50  0001 C CNN
	1    2600 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F8F3573
P 2600 2750
F 0 "#PWR07" H 2600 2500 50  0001 C CNN
F 1 "GND" H 2605 2577 50  0000 C CNN
F 2 "" H 2600 2750 50  0001 C CNN
F 3 "" H 2600 2750 50  0001 C CNN
	1    2600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2700 2600 2750
Wire Wire Line
	1250 2300 1250 2350
$Comp
L Device:R R1
U 1 1 5F8EBE5B
P 3050 1450
F 0 "R1" H 3120 1496 50  0000 L CNN
F 1 "100" H 3120 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2980 1450 50  0001 C CNN
F 3 "~" H 3050 1450 50  0001 C CNN
	1    3050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1700 1250 1600
Wire Wire Line
	1250 1600 850  1600
Wire Wire Line
	850  5850 2150 5850
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
Wire Wire Line
	2150 6150 2150 5850
Wire Wire Line
	2050 6150 2050 6000
Text Label 6950 2350 0    50   ~ 0
D10
$Comp
L power:VCC #PWR014
U 1 1 5F90BA51
P 4050 5700
F 0 "#PWR014" H 4050 5550 50  0001 C CNN
F 1 "VCC" H 4065 5873 50  0000 C CNN
F 2 "" H 4050 5700 50  0001 C CNN
F 3 "" H 4050 5700 50  0001 C CNN
	1    4050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5750 4350 5750
Wire Wire Line
	4050 5750 4050 5700
$Comp
L power:VCC #PWR017
U 1 1 5F90DE60
P 7150 6250
F 0 "#PWR017" H 7150 6100 50  0001 C CNN
F 1 "VCC" H 7165 6423 50  0000 C CNN
F 2 "" H 7150 6250 50  0001 C CNN
F 3 "" H 7150 6250 50  0001 C CNN
	1    7150 6250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F910D06
P 4000 5000
F 0 "#PWR013" H 4000 4750 50  0001 C CNN
F 1 "GND" H 4005 4827 50  0000 C CNN
F 2 "" H 4000 5000 50  0001 C CNN
F 3 "" H 4000 5000 50  0001 C CNN
	1    4000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5000 4000 4950
Wire Wire Line
	4000 4950 4350 4950
$Comp
L power:GND #PWR016
U 1 1 5F9126E2
P 6950 6250
F 0 "#PWR016" H 6950 6000 50  0001 C CNN
F 1 "GND" H 6955 6077 50  0000 C CNN
F 2 "" H 6950 6250 50  0001 C CNN
F 3 "" H 6950 6250 50  0001 C CNN
	1    6950 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6250 7150 6050
Wire Wire Line
	7150 6050 7350 6050
Wire Wire Line
	6950 6250 6950 5950
Wire Wire Line
	6950 5950 7350 5950
Wire Wire Line
	7350 5550 6950 5550
Wire Wire Line
	6950 5650 7350 5650
Wire Wire Line
	7350 5750 6950 5750
Wire Wire Line
	6950 5850 7350 5850
Wire Wire Line
	3800 3250 4350 3250
Wire Wire Line
	4350 3350 3800 3350
Text Label 6950 1550 0    50   ~ 0
D2
Text Label 3800 2850 0    50   ~ 0
D2
$Comp
L power:GND #PWR015
U 1 1 5F926BD4
P 4100 3650
F 0 "#PWR015" H 4100 3400 50  0001 C CNN
F 1 "GND" H 4105 3477 50  0000 C CNN
F 2 "" H 4100 3650 50  0001 C CNN
F 3 "" H 4100 3650 50  0001 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 5F92A51F
P 3950 3650
F 0 "#PWR012" H 3950 3500 50  0001 C CNN
F 1 "VCC" H 3965 3823 50  0000 C CNN
F 2 "" H 3950 3650 50  0001 C CNN
F 3 "" H 3950 3650 50  0001 C CNN
	1    3950 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 3650 3950 3550
Wire Wire Line
	3950 3550 3800 3550
Wire Wire Line
	2850 850  2850 800 
Wire Wire Line
	3250 1100 3250 1150
Connection ~ 3250 1150
Wire Wire Line
	2600 2400 2600 1600
Wire Wire Line
	3300 1600 3050 1600
Wire Wire Line
	3350 1950 4350 1950
Wire Wire Line
	3350 2050 4350 2050
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5F97C872
P 3150 2050
F 0 "J6" H 3100 2050 50  0000 C CNN
F 1 "SF_OBDII" H 3250 1900 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3150 2050 50  0001 C CNN
F 3 "~" H 3150 2050 50  0001 C CNN
	1    3150 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2150 4350 2150
Wire Wire Line
	3850 2250 4350 2250
Wire Wire Line
	4100 3450 4100 3650
Connection ~ 4100 3450
Wire Wire Line
	3800 3450 4100 3450
Wire Wire Line
	3850 2350 4100 2350
Wire Wire Line
	3950 2450 3850 2450
Wire Wire Line
	3950 2450 3950 3550
Connection ~ 3950 3550
$Comp
L power:GND #PWR011
U 1 1 5F9C08F6
P 3450 2250
F 0 "#PWR011" H 3450 2000 50  0001 C CNN
F 1 "GND" H 3455 2077 50  0000 C CNN
F 2 "" H 3450 2250 50  0001 C CNN
F 3 "" H 3450 2250 50  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2250 3450 2150
Wire Wire Line
	3450 2150 3350 2150
$Comp
L power:GND #PWR010
U 1 1 5F8EAC8E
P 3350 1650
F 0 "#PWR010" H 3350 1400 50  0001 C CNN
F 1 "GND" H 3355 1477 50  0000 C CNN
F 2 "" H 3350 1650 50  0001 C CNN
F 3 "" H 3350 1650 50  0001 C CNN
	1    3350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1650 3350 1600
Wire Wire Line
	4100 1850 4350 1850
Wire Wire Line
	3950 1150 4150 1150
Text Label 4350 5550 2    50   ~ 0
5V
Text Label 8650 1650 2    50   ~ 0
5V
Text Label 8650 1750 2    50   ~ 0
D22
Text Label 9150 1750 0    50   ~ 0
D23
Text Label 8650 1850 2    50   ~ 0
D24
Text Label 9150 1850 0    50   ~ 0
D25
Text Label 8650 1950 2    50   ~ 0
D26
Text Label 9150 1950 0    50   ~ 0
D27
Text Label 8650 2050 2    50   ~ 0
D28
Text Label 9150 2050 0    50   ~ 0
D29
Text Label 8650 2150 2    50   ~ 0
D30
Text Label 9150 2150 0    50   ~ 0
D31
Text Label 8650 2250 2    50   ~ 0
D32
Text Label 9150 2250 0    50   ~ 0
D33
Text Label 8650 2350 2    50   ~ 0
D34
Text Label 9150 2350 0    50   ~ 0
D35
Text Label 8650 2450 2    50   ~ 0
D36
Text Label 9150 2450 0    50   ~ 0
D37
Text Label 8650 2550 2    50   ~ 0
D38
Text Label 9150 2550 0    50   ~ 0
D39
Text Label 8650 2650 2    50   ~ 0
D40
Text Label 9150 2650 0    50   ~ 0
D41
Text Label 8650 2750 2    50   ~ 0
D42
Text Label 9150 2750 0    50   ~ 0
D43
Text Label 8650 2850 2    50   ~ 0
D44
Text Label 9150 2850 0    50   ~ 0
D45
Text Label 8650 2950 2    50   ~ 0
D46
Text Label 9150 2950 0    50   ~ 0
D47
Text Label 8650 3050 2    50   ~ 0
D48
Text Label 9150 3050 0    50   ~ 0
D49
Text Label 8650 3150 2    50   ~ 0
D50
Text Label 9150 3150 0    50   ~ 0
D51
Text Label 8650 3250 2    50   ~ 0
D52
Text Label 9150 3250 0    50   ~ 0
D53
Text Label 8650 3350 2    50   ~ 0
GND
Text Label 9150 3350 0    50   ~ 0
GND
Text Label 4350 4950 2    50   ~ 0
GND
Text Label 4350 5050 2    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x18_Odd_Even J12
U 1 1 5F9E3A92
P 8850 2450
F 0 "J12" H 8900 3467 50  0000 C CNN
F 1 "Conn_02x18_Odd_Even" H 8900 3376 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x18_P2.54mm_Vertical" H 8850 2450 50  0001 C CNN
F 3 "~" H 8850 2450 50  0001 C CNN
	1    8850 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J13
U 1 1 5FA03D83
P 9350 3900
F 0 "J13" H 9430 3892 50  0000 L CNN
F 1 "Conn_01x08" H 9430 3801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 9350 3900 50  0001 C CNN
F 3 "~" H 9350 3900 50  0001 C CNN
	1    9350 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J15
U 1 1 5FA06CB5
P 10450 3900
F 0 "J15" H 10530 3892 50  0000 L CNN
F 1 "Conn_01x08" H 10530 3801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 10450 3900 50  0001 C CNN
F 3 "~" H 10450 3900 50  0001 C CNN
	1    10450 3900
	1    0    0    -1  
$EndComp
NoConn ~ 10250 3600
Text Label 10250 3700 2    50   ~ 0
IOREF
Text Label 10250 3800 2    50   ~ 0
RESET
Text Label 10250 3900 2    50   ~ 0
3V3
Text Label 10250 4000 2    50   ~ 0
5V
Text Label 10250 4100 2    50   ~ 0
GND
Text Label 10250 4200 2    50   ~ 0
GND
Text Label 10250 4300 2    50   ~ 0
VIN
Text Label 7950 4600 2    50   ~ 0
D14
Text Label 7950 4700 2    50   ~ 0
D15
Text Label 7950 4800 2    50   ~ 0
D16
Text Label 7950 4900 2    50   ~ 0
D17
Text Label 7950 5000 2    50   ~ 0
D18
Text Label 7950 5100 2    50   ~ 0
D19
Text Label 7950 5200 2    50   ~ 0
D20
Text Label 7950 5300 2    50   ~ 0
D21
$Comp
L Connector_Generic:Conn_01x08 J11
U 1 1 5FA0B0B6
P 8150 4900
F 0 "J11" H 8230 4892 50  0000 L CNN
F 1 "Conn_01x08" H 8230 4801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 8150 4900 50  0001 C CNN
F 3 "~" H 8150 4900 50  0001 C CNN
	1    8150 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J14
U 1 1 5FA0E906
P 9350 4900
F 0 "J14" H 9430 4892 50  0000 L CNN
F 1 "Conn_01x08" H 9430 4801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 9350 4900 50  0001 C CNN
F 3 "~" H 9350 4900 50  0001 C CNN
	1    9350 4900
	1    0    0    -1  
$EndComp
Text Label 9150 4600 2    50   ~ 0
D7
Text Label 9150 4700 2    50   ~ 0
D6
Text Label 9150 4800 2    50   ~ 0
D5
Text Label 9150 4900 2    50   ~ 0
D4
Text Label 9150 5000 2    50   ~ 0
D3
Text Label 9150 5100 2    50   ~ 0
D2
Text Label 9150 5200 2    50   ~ 0
D1
Text Label 9150 5300 2    50   ~ 0
D0
$Comp
L Connector_Generic:Conn_01x10 J16
U 1 1 5FA14E89
P 10450 4950
F 0 "J16" H 10530 4942 50  0000 L CNN
F 1 "Conn_01x10" H 10530 4851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 10450 4950 50  0001 C CNN
F 3 "~" H 10450 4950 50  0001 C CNN
	1    10450 4950
	1    0    0    -1  
$EndComp
Text Label 10250 4550 2    50   ~ 0
SCL
Text Label 10250 4650 2    50   ~ 0
SDA
Text Label 10250 4750 2    50   ~ 0
AREF
Text Label 10250 4850 2    50   ~ 0
GND
Text Label 10250 4950 2    50   ~ 0
D13
Text Label 10250 5050 2    50   ~ 0
D12
Text Label 10250 5150 2    50   ~ 0
D11
Text Label 10250 5250 2    50   ~ 0
D10
Text Label 10250 5350 2    50   ~ 0
D9
$Comp
L Connector_Generic:Conn_01x08 J10
U 1 1 5F9F881C
P 8150 3900
F 0 "J10" H 8230 3892 50  0000 L CNN
F 1 "Conn_01x08" H 8230 3801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 8150 3900 50  0001 C CNN
F 3 "~" H 8150 3900 50  0001 C CNN
	1    8150 3900
	1    0    0    -1  
$EndComp
Text Label 10250 5450 2    50   ~ 0
D8
Text Label 7950 3600 2    50   ~ 0
A8
Text Label 7950 3700 2    50   ~ 0
A9
Text Label 7950 3800 2    50   ~ 0
A10
Text Label 7950 3900 2    50   ~ 0
A11
Text Label 7950 4000 2    50   ~ 0
A12
Text Label 7950 4100 2    50   ~ 0
A13
Text Label 7950 4200 2    50   ~ 0
A14
Text Label 7950 4300 2    50   ~ 0
A15
Text Label 9150 3600 2    50   ~ 0
A0
Text Label 9150 3700 2    50   ~ 0
A1
Text Label 9150 3800 2    50   ~ 0
A2
Text Label 9150 3900 2    50   ~ 0
A3
Text Label 9150 4000 2    50   ~ 0
A4
Text Label 9150 4100 2    50   ~ 0
A5
Text Label 9150 4200 2    50   ~ 0
A6
Text Label 9150 4300 2    50   ~ 0
A7
Text Label 9150 1650 0    50   ~ 0
5V
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
Text Label 4350 3550 2    50   ~ 0
A7
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
L Connector:Mini-DIN-4 J2
U 1 1 5F901AD9
P 1250 3050
F 0 "J2" V 1204 3280 50  0000 L CNN
F 1 "Mini-DIN-4" V 1295 3280 50  0000 L CNN
F 2 "TTS-UART:KMDGX-4S-BS" H 1250 3050 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 1250 3050 50  0001 C CNN
	1    1250 3050
	0    1    1    0   
$EndComp
$Comp
L Connector:Mini-DIN-4 J4
U 1 1 5F903D98
P 1250 5150
F 0 "J4" V 1204 5380 50  0000 L CNN
F 1 "Mini-DIN-4" V 1295 5380 50  0000 L CNN
F 2 "TTS-UART:KMDGX-4S-BS" H 1250 5150 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 1250 5150 50  0001 C CNN
	1    1250 5150
	0    1    1    0   
$EndComp
$Comp
L Connector:Mini-DIN-4 J3
U 1 1 5F903363
P 1250 4100
F 0 "J3" V 1204 4330 50  0000 L CNN
F 1 "Mini-DIN-4" V 1295 4330 50  0000 L CNN
F 2 "TTS-UART:KMDGX-4S-BS" H 1250 4100 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 1250 4100 50  0001 C CNN
	1    1250 4100
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5F8FB33C
P 2150 6350
F 0 "J5" V 2150 6450 50  0000 L CNN
F 1 "Screw_Terminal_01x02" V 2250 6050 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-5.0-H_1x02_P5.00mm_Horizontal" H 2150 6350 50  0001 C CNN
F 3 "~" H 2150 6350 50  0001 C CNN
	1    2150 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 3350 1250 3400
Wire Wire Line
	1250 4450 1250 4400
Wire Wire Line
	850  1600 850  2650
Connection ~ 3050 1300
Connection ~ 3050 1600
Wire Wire Line
	3050 1600 2600 1600
Wire Wire Line
	1350 1300 2000 1300
Wire Wire Line
	1350 2400 2200 2400
Wire Wire Line
	2000 4750 1350 4750
Wire Wire Line
	1350 4750 1350 4850
Connection ~ 2000 1300
Wire Wire Line
	2000 1300 2300 1300
Wire Wire Line
	1350 3800 1350 3700
Wire Wire Line
	1350 3700 2000 3700
Wire Wire Line
	2000 1300 2000 2650
Connection ~ 2000 3700
Wire Wire Line
	1350 2750 1350 2650
Wire Wire Line
	1350 2650 2000 2650
Connection ~ 2000 2650
Wire Wire Line
	2200 2400 2200 3450
Wire Wire Line
	2200 5550 1350 5550
Wire Wire Line
	1350 5550 1350 5450
Connection ~ 2200 2400
Wire Wire Line
	1350 4400 1350 4500
Wire Wire Line
	1350 3350 1350 3450
Connection ~ 2300 1300
Wire Wire Line
	2300 1300 3050 1300
Connection ~ 2600 2400
Wire Wire Line
	2200 2400 2600 2400
Wire Wire Line
	1250 2750 1250 2650
Wire Wire Line
	1250 2650 850  2650
Connection ~ 850  2650
Wire Wire Line
	850  2650 850  3700
Wire Wire Line
	1250 3800 1250 3700
Wire Wire Line
	1250 3700 850  3700
Connection ~ 850  3700
Wire Wire Line
	850  3700 850  4750
Wire Wire Line
	1250 4850 1250 4750
Wire Wire Line
	1250 4750 850  4750
Connection ~ 850  4750
Wire Wire Line
	850  4750 850  5850
Wire Wire Line
	2000 3700 2000 4750
Wire Wire Line
	2000 2650 2000 3700
Wire Wire Line
	1350 4500 2200 4500
Connection ~ 2200 4500
Wire Wire Line
	2200 4500 2200 5550
Wire Wire Line
	1350 3450 2200 3450
Connection ~ 2200 3450
Wire Wire Line
	2200 3450 2200 4500
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 5F8F5A4B
P 3650 2250
F 0 "J8" H 3600 2200 50  0000 C CNN
F 1 "NEO-6M" H 3750 2000 50  0000 C CNN
F 2 "Onboard_Sensors:NEO-6M" H 3650 2250 50  0001 C CNN
F 3 "~" H 3650 2250 50  0001 C CNN
	1    3650 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J7
U 1 1 5F91A993
P 3600 3150
F 0 "J7" H 3550 3150 50  0000 C CNN
F 1 "GY-521" H 3700 2700 50  0000 C CNN
F 2 "Onboard_Sensors:GY-521" H 3600 3150 50  0001 C CNN
F 3 "~" H 3600 3150 50  0001 C CNN
	1    3600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2350 4100 2950
Wire Wire Line
	3800 2950 4100 2950
Connection ~ 4100 2950
Wire Wire Line
	4100 2950 4100 3450
NoConn ~ 3800 3050
NoConn ~ 3800 3150
Text Label 4350 5150 2    50   ~ 0
GND
$Comp
L Device:LED D4
U 1 1 5F920F36
P 7350 4900
F 0 "D4" V 7389 4782 50  0000 R CNN
F 1 "RED" V 7298 4782 50  0000 R CNN
F 2 "digikey-kicad-library:LED_3mm_Radial" H 7350 4900 50  0001 C CNN
F 3 "~" H 7350 4900 50  0001 C CNN
	1    7350 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 4350 7350 4350
Wire Wire Line
	7350 4350 7350 4400
Wire Wire Line
	7350 5100 7350 5050
$Comp
L Device:D_Bridge_+AA- D3
U 1 1 5F9B1CA7
P 3200 5650
F 0 "D3" H 3150 5650 50  0000 L CNN
F 1 "D_Bridge_+AA-" H 3300 5850 50  0000 L CNN
F 2 "TTS-UART:KBP306GTB" H 3200 5650 50  0001 C CNN
F 3 "~" H 3200 5650 50  0001 C CNN
	1    3200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5850 2550 5850
Wire Wire Line
	2550 5850 2550 5300
Wire Wire Line
	2550 5300 3200 5300
Wire Wire Line
	3200 5300 3200 5350
Connection ~ 2150 5850
$Comp
L power:GND #PWR01
U 1 1 5F9CBB76
P 2850 5700
F 0 "#PWR01" H 2850 5450 50  0001 C CNN
F 1 "GND" H 2855 5527 50  0000 C CNN
F 2 "" H 2850 5700 50  0001 C CNN
F 3 "" H 2850 5700 50  0001 C CNN
	1    2850 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5650 2850 5650
Wire Wire Line
	2850 5650 2850 5700
Wire Wire Line
	1250 4450 1000 4450
Wire Wire Line
	1000 4450 1000 5450
Wire Wire Line
	1250 5450 1000 5450
Connection ~ 1000 5450
Wire Wire Line
	1000 5450 1000 6000
Wire Wire Line
	1000 4450 1000 3400
Wire Wire Line
	1000 3400 1250 3400
Connection ~ 1000 4450
Wire Wire Line
	1000 3400 1000 2350
Wire Wire Line
	1000 2350 1250 2350
Connection ~ 1000 3400
Wire Wire Line
	1000 6000 2050 6000
Wire Wire Line
	2050 6000 3200 6000
Wire Wire Line
	3200 6000 3200 5950
Connection ~ 2050 6000
Wire Wire Line
	3500 5650 3550 5650
Wire Wire Line
	3550 5650 3550 5850
Wire Wire Line
	3550 5850 4350 5850
$Comp
L power:VCC #PWR02
U 1 1 5FA4D1B3
P 7350 5100
F 0 "#PWR02" H 7350 4950 50  0001 C CNN
F 1 "VCC" H 7365 5273 50  0000 C CNN
F 2 "" H 7350 5100 50  0001 C CNN
F 3 "" H 7350 5100 50  0001 C CNN
	1    7350 5100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5FA529EF
P 7350 4550
F 0 "R2" H 7420 4596 50  0000 L CNN
F 1 "4.7k" H 7420 4505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7280 4550 50  0001 C CNN
F 3 "~" H 7350 4550 50  0001 C CNN
	1    7350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4700 7350 4750
$EndSCHEMATC
