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
L Sensor_Motion:ICM-20602 U2
U 1 1 5FD94DB7
P 2150 4300
F 0 "U2" H 1800 3850 50  0000 C CNN
F 1 "ICM-20602" H 2400 3850 50  0000 C CNN
F 2 "Package_LGA:LGA-16_3x3mm_P0.5mm_LayoutBorder3x5y" H 2150 4550 50  0001 C CNN
F 3 "http://www.invensense.com/wp-content/uploads/2016/10/DS-000176-ICM-20602-v1.0.pdf" H 2200 5250 50  0001 C CNN
	1    2150 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FD96A7F
P 2150 4900
F 0 "#PWR09" H 2150 4650 50  0001 C CNN
F 1 "GND" H 2155 4727 50  0000 C CNN
F 2 "" H 2150 4900 50  0001 C CNN
F 3 "" H 2150 4900 50  0001 C CNN
	1    2150 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FD97238
P 3050 4400
F 0 "#PWR011" H 3050 4150 50  0001 C CNN
F 1 "GND" H 3055 4227 50  0000 C CNN
F 2 "" H 3050 4400 50  0001 C CNN
F 3 "" H 3050 4400 50  0001 C CNN
	1    3050 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5FD97A8D
P 1450 4150
F 0 "#PWR06" H 1450 3900 50  0001 C CNN
F 1 "GND" H 1455 3977 50  0000 C CNN
F 2 "" H 1450 4150 50  0001 C CNN
F 3 "" H 1450 4150 50  0001 C CNN
	1    1450 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1450 4150 1450 4200
Wire Wire Line
	1450 4200 1650 4200
Wire Wire Line
	2650 4300 3050 4300
Wire Wire Line
	3050 4300 3050 4400
Wire Wire Line
	2150 4800 2150 4850
Text Label 1650 4300 2    50   ~ 0
D20
Text Label 1650 4400 2    50   ~ 0
D21
Text Label 2650 4200 0    50   ~ 0
D23
Wire Wire Line
	1650 4500 1550 4500
Wire Wire Line
	1150 4500 1150 3600
Wire Wire Line
	1150 3600 1750 3600
Wire Wire Line
	2150 3600 2150 3800
Wire Wire Line
	2250 3800 2250 3600
Wire Wire Line
	2250 3600 2500 3600
Wire Wire Line
	2700 3600 2700 3700
$Comp
L power:+5V #PWR010
U 1 1 5FD9DAFE
P 2700 3700
F 0 "#PWR010" H 2700 3550 50  0001 C CNN
F 1 "+5V" H 2715 3873 50  0000 C CNN
F 2 "" H 2700 3700 50  0001 C CNN
F 3 "" H 2700 3700 50  0001 C CNN
	1    2700 3700
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5FD9DD76
P 1550 4500
F 0 "#PWR07" H 1550 4350 50  0001 C CNN
F 1 "+5V" H 1565 4673 50  0000 C CNN
F 2 "" H 1550 4500 50  0001 C CNN
F 3 "" H 1550 4500 50  0001 C CNN
	1    1550 4500
	-1   0    0    1   
$EndComp
Connection ~ 1550 4500
Wire Wire Line
	1550 4500 1150 4500
$Comp
L Device:C C2
U 1 1 5FD9EA96
P 2050 3450
F 0 "C2" H 2165 3496 50  0000 L CNN
F 1 "2.2uF" H 2165 3405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2088 3300 50  0001 C CNN
F 3 "~" H 2050 3450 50  0001 C CNN
	1    2050 3450
	1    0    0    -1  
$EndComp
Connection ~ 2050 3600
Wire Wire Line
	2050 3600 2150 3600
$Comp
L Device:C C1
U 1 1 5FD9F5A7
P 1750 3450
F 0 "C1" H 1550 3500 50  0000 L CNN
F 1 "0.1uF" H 1500 3350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1788 3300 50  0001 C CNN
F 3 "~" H 1750 3450 50  0001 C CNN
	1    1750 3450
	1    0    0    -1  
$EndComp
Connection ~ 1750 3600
Wire Wire Line
	1750 3600 2050 3600
$Comp
L Device:C C3
U 1 1 5FD9F8C7
P 2500 3450
F 0 "C3" H 2615 3496 50  0000 L CNN
F 1 "10nF" H 2615 3405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2538 3300 50  0001 C CNN
F 3 "~" H 2500 3450 50  0001 C CNN
	1    2500 3450
	1    0    0    -1  
$EndComp
Connection ~ 2500 3600
Wire Wire Line
	2500 3600 2700 3600
$Comp
L Device:C C4
U 1 1 5FD9FDF0
P 2850 4700
F 0 "C4" H 2965 4746 50  0000 L CNN
F 1 "0.1uF" H 2965 4655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2888 4550 50  0001 C CNN
F 3 "~" H 2850 4700 50  0001 C CNN
	1    2850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3300 2050 3300
Wire Wire Line
	2050 3300 2500 3300
Connection ~ 2050 3300
$Comp
L power:GND #PWR08
U 1 1 5FDA39E5
P 2050 3300
F 0 "#PWR08" H 2050 3050 50  0001 C CNN
F 1 "GND" H 2055 3127 50  0000 C CNN
F 2 "" H 2050 3300 50  0001 C CNN
F 3 "" H 2050 3300 50  0001 C CNN
	1    2050 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 4400 2850 4400
Wire Wire Line
	2850 4400 2850 4550
Wire Wire Line
	2850 4850 2150 4850
Connection ~ 2150 4850
Wire Wire Line
	2150 4850 2150 4900
$Comp
L Connector:Conn_01x05_Female J3
U 1 1 5FDA7850
P 3300 4000
F 0 "J3" H 3328 4026 50  0000 L CNN
F 1 "Conn_01x05_Female" H 3328 3935 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3300 4000 50  0001 C CNN
F 3 "~" H 3300 4000 50  0001 C CNN
	1    3300 4000
	1    0    0    -1  
$EndComp
Text Label 3100 3900 2    50   ~ 0
D23
Text Label 3100 4000 2    50   ~ 0
D21
Text Label 3100 4100 2    50   ~ 0
D20
Wire Wire Line
	2700 3600 3100 3600
Wire Wire Line
	3100 3600 3100 3800
Connection ~ 2700 3600
Wire Wire Line
	3050 4300 3100 4300
Wire Wire Line
	3100 4300 3100 4200
Connection ~ 3050 4300
Wire Wire Line
	3050 900  3050 1050
Wire Wire Line
	2650 900  2650 800 
Connection ~ 2650 900 
Wire Wire Line
	2650 900  3050 900 
Text Label 2650 800  1    50   ~ 0
3.3V
Wire Wire Line
	2750 1250 2650 1250
Wire Wire Line
	2650 1250 2650 1150
$Comp
L Device:R R2
U 1 1 5FDE5FBB
P 2400 1150
F 0 "R2" V 2300 1100 50  0000 L CNN
F 1 "100k" V 2400 1050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2330 1150 50  0001 C CNN
F 3 "~" H 2400 1150 50  0001 C CNN
	1    2400 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 1150 2250 1150
Wire Wire Line
	2550 1150 2650 1150
Connection ~ 2650 1150
Wire Wire Line
	2650 1150 2650 900 
$Comp
L power:GND #PWR0101
U 1 1 5FDEB3E6
P 2300 2450
F 0 "#PWR0101" H 2300 2200 50  0001 C CNN
F 1 "GND" H 2305 2277 50  0000 C CNN
F 2 "" H 2300 2450 50  0001 C CNN
F 3 "" H 2300 2450 50  0001 C CNN
	1    2300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2150 2100 2150
Wire Wire Line
	2300 2450 2300 2250
Wire Wire Line
	3550 1450 4300 1450
Wire Wire Line
	4300 1450 4300 1600
Wire Wire Line
	4100 1700 4100 1650
Wire Wire Line
	4100 1650 3550 1650
Wire Wire Line
	3550 1850 4200 1850
Wire Wire Line
	4200 1850 4200 1800
Wire Wire Line
	4100 1900 4100 2050
Wire Wire Line
	4100 2050 3550 2050
$Comp
L power:GND #PWR0102
U 1 1 5FDFE3F5
P 4450 2050
F 0 "#PWR0102" H 4450 1800 50  0001 C CNN
F 1 "GND" H 4455 1877 50  0000 C CNN
F 2 "" H 4450 2050 50  0001 C CNN
F 3 "" H 4450 2050 50  0001 C CNN
	1    4450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2050 4450 2000
$Comp
L power:GND #PWR0103
U 1 1 5FE01861
P 3150 2600
F 0 "#PWR0103" H 3150 2350 50  0001 C CNN
F 1 "GND" H 3155 2427 50  0000 C CNN
F 2 "" H 3150 2600 50  0001 C CNN
F 3 "" H 3150 2600 50  0001 C CNN
	1    3150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2600 3150 2450
Text Label 4650 1500 2    50   ~ 0
3.3V
Wire Wire Line
	4300 1600 4650 1600
Wire Wire Line
	4100 1700 4650 1700
Wire Wire Line
	4200 1800 4650 1800
Wire Wire Line
	4450 2000 4650 2000
Wire Wire Line
	4100 1900 4650 1900
Text Label 4650 1400 2    50   ~ 0
5v
Text Label 3250 900  1    50   ~ 0
5v
Wire Wire Line
	3250 1050 3250 900 
$Comp
L SD-Card-rescue:503398-1892-uSD_card-SD-Card-rescue J4
U 1 1 5FDB0DED
P 1400 1650
F 0 "J4" H 1507 2417 50  0000 C CNN
F 1 "503398-1892" H 1507 2326 50  0000 C CNN
F 2 "SD_Card:MOLEX_503398-1892" H 1400 1650 50  0001 L BNN
F 3 "" H 1400 1650 50  0001 L BNN
F 4 "0" H 1400 1650 50  0001 L BNN "PARTREV"
F 5 "molex" H 1400 1650 50  0001 L BNN "MANUFACTURER"
F 6 "MANUFACTURER RECOMMENDATIONS" H 1400 1650 50  0001 L BNN "STANDARD"
	1    1400 1650
	1    0    0    -1  
$EndComp
Text Label 2100 1850 0    50   ~ 0
2
Text Label 2750 1450 2    50   ~ 0
2
Wire Wire Line
	2100 1350 2500 1350
Wire Wire Line
	2500 1350 2500 1650
Wire Wire Line
	2500 1650 2750 1650
Wire Wire Line
	2100 1450 2450 1450
Wire Wire Line
	2450 1450 2450 1850
Wire Wire Line
	2450 1850 2750 1850
Wire Wire Line
	2750 2050 2400 2050
Wire Wire Line
	2400 2050 2400 1550
Wire Wire Line
	2400 1550 2100 1550
$Comp
L Logic_LevelTranslator:TXB0104PW U3
U 1 1 5FDB3BA1
P 3150 1750
F 0 "U3" H 3400 2400 50  0000 C CNN
F 1 "TXB0104PW" H 3400 1100 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 3150 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 3260 1845 50  0001 C CNN
	1    3150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1650 2300 1650
Wire Wire Line
	2300 1650 2300 2150
Connection ~ 2300 2150
Wire Wire Line
	2100 2250 2300 2250
Connection ~ 2300 2250
Wire Wire Line
	2300 2250 2300 2150
$Comp
L Connector:Conn_01x07_Female J1
U 1 1 5FE6E166
P 4850 1700
F 0 "J1" H 4878 1726 50  0000 L CNN
F 1 "Conn_01x07_Female" H 4878 1635 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 4850 1700 50  0001 C CNN
F 3 "~" H 4850 1700 50  0001 C CNN
	1    4850 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5FDBDAD8
P 6650 4250
F 0 "D1" V 6604 4330 50  0000 L CNN
F 1 "D" V 6695 4330 50  0000 L CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 6650 4250 50  0001 C CNN
F 3 "~" H 6650 4250 50  0001 C CNN
	1    6650 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 4050 6650 4050
Wire Wire Line
	6650 4050 6650 4100
$Comp
L power:GND #PWR03
U 1 1 5FDC0210
P 6650 4450
F 0 "#PWR03" H 6650 4200 50  0001 C CNN
F 1 "GND" H 6655 4277 50  0000 C CNN
F 2 "" H 6650 4450 50  0001 C CNN
F 3 "" H 6650 4450 50  0001 C CNN
	1    6650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4400 6650 4450
Wire Wire Line
	6650 4050 6200 4050
Wire Wire Line
	6200 4050 6200 4100
Connection ~ 6650 4050
$Comp
L Device:C C6
U 1 1 5FDC31FC
P 6200 4250
F 0 "C6" H 6315 4296 50  0000 L CNN
F 1 "0.01uF" H 6315 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 6238 4100 50  0001 C CNN
F 3 "~" H 6200 4250 50  0001 C CNN
	1    6200 4250
	1    0    0    -1  
$EndComp
Text Label 7100 4150 2    50   ~ 0
BST
Wire Wire Line
	6200 4400 6200 4450
Text Label 6200 4450 3    50   ~ 0
BST
$Comp
L Device:L L1
U 1 1 5FDCC97F
P 5900 4050
F 0 "L1" V 6090 4050 50  0000 C CNN
F 1 "100uH" V 5999 4050 50  0000 C CNN
F 2 "Inductor_SMD:L_TDK_SLF7045" H 5900 4050 50  0001 C CNN
F 3 "~" H 5900 4050 50  0001 C CNN
	1    5900 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4050 6200 4050
Connection ~ 6200 4050
Wire Wire Line
	5750 4050 5650 4050
$Comp
L Device:R R3
U 1 1 5FDD0AB2
P 5650 4250
F 0 "R3" H 5720 4296 50  0000 L CNN
F 1 "3.01k" H 5720 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5580 4250 50  0001 C CNN
F 3 "~" H 5650 4250 50  0001 C CNN
	1    5650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4050 5650 4100
Wire Wire Line
	5650 4050 5200 4050
Wire Wire Line
	5200 4050 5200 4100
Connection ~ 5650 4050
$Comp
L Device:R R1
U 1 1 5FDD481A
P 5200 4250
F 0 "R1" H 5270 4296 50  0000 L CNN
F 1 "1" H 5270 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5130 4250 50  0001 C CNN
F 3 "~" H 5200 4250 50  0001 C CNN
	1    5200 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5FDD6583
P 5200 4700
F 0 "C5" H 5315 4746 50  0000 L CNN
F 1 "15uF" H 5315 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1812_4532Metric_Pad1.57x3.40mm_HandSolder" H 5238 4550 50  0001 C CNN
F 3 "~" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4900 5200 4850
Wire Wire Line
	5200 4900 5450 4900
Wire Wire Line
	5450 4900 5450 4950
Connection ~ 5450 4900
Wire Wire Line
	5450 4900 5650 4900
$Comp
L power:GND #PWR02
U 1 1 5FDDEE8F
P 5450 4950
F 0 "#PWR02" H 5450 4700 50  0001 C CNN
F 1 "GND" H 5455 4777 50  0000 C CNN
F 2 "" H 5450 4950 50  0001 C CNN
F 3 "" H 5450 4950 50  0001 C CNN
	1    5450 4950
	1    0    0    -1  
$EndComp
Connection ~ 5200 4050
$Comp
L Device:R R4
U 1 1 5FDE2D6D
P 5650 4700
F 0 "R4" H 5720 4746 50  0000 L CNN
F 1 "1k" H 5720 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5580 4700 50  0001 C CNN
F 3 "~" H 5650 4700 50  0001 C CNN
	1    5650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4850 5650 4900
Wire Wire Line
	5650 4400 5650 4500
Wire Wire Line
	5650 4500 5700 4500
Connection ~ 5650 4500
Wire Wire Line
	5650 4500 5650 4550
Text Label 5700 4500 0    50   ~ 0
FB
Wire Wire Line
	5200 4400 5200 4550
Text Label 8400 4350 0    50   ~ 0
FB
$Comp
L Device:C C8
U 1 1 5FDEE8E7
P 8900 4250
F 0 "C8" H 9015 4296 50  0000 L CNN
F 1 "0.1uF" H 9015 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8938 4100 50  0001 C CNN
F 3 "~" H 8900 4250 50  0001 C CNN
	1    8900 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4050 8700 4050
Wire Wire Line
	8900 4050 8900 4100
Wire Wire Line
	8900 4050 9350 4050
Wire Wire Line
	9350 4050 9350 4100
Connection ~ 8900 4050
Wire Wire Line
	9350 4050 10050 4050
Connection ~ 9350 4050
Wire Wire Line
	10050 4050 10050 4150
Wire Wire Line
	8900 4400 8900 4450
Wire Wire Line
	8900 4450 9150 4450
Wire Wire Line
	9350 4450 9350 4400
Wire Wire Line
	9150 4450 9150 4500
Connection ~ 9150 4450
Wire Wire Line
	9150 4450 9350 4450
$Comp
L power:GND #PWR012
U 1 1 5FE08073
P 9150 4500
F 0 "#PWR012" H 9150 4250 50  0001 C CNN
F 1 "GND" H 9155 4327 50  0000 C CNN
F 2 "" H 9150 4500 50  0001 C CNN
F 3 "" H 9150 4500 50  0001 C CNN
	1    9150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4150 8700 4150
Wire Wire Line
	8700 4150 8700 4450
Wire Wire Line
	8700 4750 8700 4800
Wire Wire Line
	7100 4250 6850 4250
Wire Wire Line
	6850 4250 6850 4450
$Comp
L Device:R R5
U 1 1 5FE2228C
P 6850 4600
F 0 "R5" H 6920 4646 50  0000 L CNN
F 1 "100k" H 6920 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 6780 4600 50  0001 C CNN
F 3 "~" H 6850 4600 50  0001 C CNN
	1    6850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4350 7050 4350
Wire Wire Line
	7050 4350 7050 4800
Wire Wire Line
	7050 4800 6850 4800
Wire Wire Line
	6850 4800 6850 4750
$Comp
L power:GND #PWR04
U 1 1 5FE25525
P 6850 4850
F 0 "#PWR04" H 6850 4600 50  0001 C CNN
F 1 "GND" H 6855 4677 50  0000 C CNN
F 2 "" H 6850 4850 50  0001 C CNN
F 3 "" H 6850 4850 50  0001 C CNN
	1    6850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4800 6850 4850
Connection ~ 6850 4800
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5FE28A32
P 10100 5350
F 0 "J5" V 9972 5430 50  0000 L CNN
F 1 "Screw_Terminal_01x02" V 10063 5430 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-5.0-H_1x02_P5.00mm_Horizontal" H 10100 5350 50  0001 C CNN
F 3 "~" H 10100 5350 50  0001 C CNN
	1    10100 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 4450 9700 4450
Wire Wire Line
	9700 4450 9700 5100
Wire Wire Line
	9700 5100 10000 5100
Wire Wire Line
	10000 5100 10000 5150
Wire Wire Line
	10350 4450 10400 4450
Wire Wire Line
	10400 4450 10400 5100
Wire Wire Line
	10400 5100 10100 5100
Wire Wire Line
	10100 5100 10100 5150
$Comp
L power:GND #PWR013
U 1 1 5FE33BBB
P 10050 4800
F 0 "#PWR013" H 10050 4550 50  0001 C CNN
F 1 "GND" H 10055 4627 50  0000 C CNN
F 2 "" H 10050 4800 50  0001 C CNN
F 3 "" H 10050 4800 50  0001 C CNN
	1    10050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 4750 10050 4800
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5FE38A2C
P 4950 4350
F 0 "J2" V 5000 4150 50  0000 L CNN
F 1 "Conn_01x02_Female" V 4900 3450 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4950 4350 50  0001 C CNN
F 3 "~" H 4950 4350 50  0001 C CNN
	1    4950 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 4050 4950 4150
Wire Wire Line
	4950 4050 5200 4050
Wire Wire Line
	4850 4150 4850 4050
$Comp
L power:GND #PWR01
U 1 1 5FE45F01
P 4850 4050
F 0 "#PWR01" H 4850 3800 50  0001 C CNN
F 1 "GND" H 4855 3877 50  0000 C CNN
F 2 "" H 4850 4050 50  0001 C CNN
F 3 "" H 4850 4050 50  0001 C CNN
	1    4850 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:C C9
U 1 1 5FDF1347
P 9350 4250
F 0 "C9" H 9465 4296 50  0000 L CNN
F 1 "1uF" H 9465 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1812_4532Metric_Pad1.57x3.40mm_HandSolder" H 9388 4100 50  0001 C CNN
F 3 "~" H 9350 4250 50  0001 C CNN
	1    9350 4250
	1    0    0    -1  
$EndComp
Text Label 8400 4250 0    50   ~ 0
RON
Wire Wire Line
	8700 3700 8700 3650
Text Label 8700 3650 1    50   ~ 0
RON
$Comp
L Device:R R6
U 1 1 5FE0061D
P 8700 3850
F 0 "R6" H 8630 3804 50  0000 R CNN
F 1 "200k" H 8630 3895 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8630 3850 50  0001 C CNN
F 3 "~" H 8700 3850 50  0001 C CNN
	1    8700 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5FE1BFBB
P 8700 4800
F 0 "#PWR05" H 8700 4550 50  0001 C CNN
F 1 "GND" H 8705 4627 50  0000 C CNN
F 2 "" H 8700 4800 50  0001 C CNN
F 3 "" H 8700 4800 50  0001 C CNN
	1    8700 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5FE13E49
P 8700 4600
F 0 "C7" H 8815 4646 50  0000 L CNN
F 1 "0.1uF" H 8815 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8738 4450 50  0001 C CNN
F 3 "~" H 8700 4600 50  0001 C CNN
	1    8700 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 4000 8700 4050
Connection ~ 8700 4050
Wire Wire Line
	8700 4050 8900 4050
$Comp
L Device:D_Bridge_+AA- D2
U 1 1 5FDF3C38
P 10050 4450
F 0 "D2" V 9900 4300 50  0000 R CNN
F 1 "D_Bridge_+AA-" V 10200 4350 50  0000 R CNN
F 2 "TTS_UART:KBP306GTB" H 10050 4450 50  0001 C CNN
F 3 "~" H 10050 4450 50  0001 C CNN
	1    10050 4450
	0    -1   -1   0   
$EndComp
$Comp
L SD-Card-rescue:LM25007MM_NOPB-lm25007-SD-Card-rescue U1
U 1 1 5FE77355
P 7100 4050
F 0 "U1" H 7750 3400 60  0000 C CNN
F 1 "LM25007MM_NOPB" H 7750 4331 60  0000 C CNN
F 2 "LM25007MM:LM25007MM&slash_NOPB" H 7750 3400 60  0001 C CNN
F 3 "" H 7100 4050 60  0000 C CNN
	1    7100 4050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
