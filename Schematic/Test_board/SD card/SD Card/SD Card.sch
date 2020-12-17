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
L uSD_card:503398-1892 J4
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
$EndSCHEMATC