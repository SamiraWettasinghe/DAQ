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
L Logic_LevelTranslator:TXB0104PW U?
U 1 1 5FD69FC7
P 5250 3300
F 0 "U?" H 5500 4000 50  0000 C CNN
F 1 "TXB0104PW" H 5550 2600 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5250 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 5360 3395 50  0001 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD6C598
P 5350 2400
F 0 "#PWR?" H 5350 2250 50  0001 C CNN
F 1 "+5V" H 5365 2573 50  0000 C CNN
F 2 "" H 5350 2400 50  0001 C CNN
F 3 "" H 5350 2400 50  0001 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FD6CF04
P 5150 2400
F 0 "#PWR?" H 5150 2250 50  0001 C CNN
F 1 "+3.3V" H 5165 2573 50  0000 C CNN
F 2 "" H 5150 2400 50  0001 C CNN
F 3 "" H 5150 2400 50  0001 C CNN
	1    5150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2800 4650 2800
Wire Wire Line
	4650 2800 4650 2500
Wire Wire Line
	4650 2500 5150 2500
Wire Wire Line
	5150 2500 5150 2600
Wire Wire Line
	5150 2400 5150 2500
Connection ~ 5150 2500
Wire Wire Line
	5350 2400 5350 2500
Wire Wire Line
	5350 2500 6050 2500
Connection ~ 5350 2500
Wire Wire Line
	5350 2500 5350 2600
Wire Wire Line
	6050 2500 6050 2900
Wire Wire Line
	6050 2900 6100 2900
$Comp
L power:GND #PWR?
U 1 1 5FD6EB18
P 5250 4150
F 0 "#PWR?" H 5250 3900 50  0001 C CNN
F 1 "GND" H 5255 3977 50  0000 C CNN
F 2 "" H 5250 4150 50  0001 C CNN
F 3 "" H 5250 4150 50  0001 C CNN
	1    5250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4000 5250 4150
Text GLabel 6150 3000 2    50   Input ~ 0
CS
Text GLabel 6150 3200 2    50   Input ~ 0
MOSI
Text GLabel 6150 3600 2    50   Input ~ 0
MISO
Text GLabel 6150 3400 2    50   Input ~ 0
SCK
Wire Wire Line
	5650 3000 6150 3000
Wire Wire Line
	5650 3200 6150 3200
Wire Wire Line
	5650 3400 6150 3400
Wire Wire Line
	5650 3600 6150 3600
$Comp
L Device:R R?
U 1 1 5FD71B42
P 4500 2850
F 0 "R?" H 4350 2950 50  0000 L CNN
F 1 "100k" V 4500 2750 50  0000 L CNN
F 2 "" V 4430 2850 50  0001 C CNN
F 3 "~" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3000 4500 3000
Wire Wire Line
	4500 2700 4500 2400
Connection ~ 5150 2400
Connection ~ 4500 3000
Wire Wire Line
	4500 3000 4850 3000
Wire Wire Line
	4500 2400 5150 2400
Wire Wire Line
	4850 3200 4250 3200
Wire Wire Line
	4850 3400 4250 3400
Wire Wire Line
	4850 3600 4250 3600
$EndSCHEMATC
