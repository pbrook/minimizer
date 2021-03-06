EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:smin
LIBS:smin-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "14 dec 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R4
U 1 1 522B5710
P 5750 4000
F 0 "R4" V 5830 4000 50  0000 C CNN
F 1 "1k" V 5750 4000 50  0000 C CNN
F 2 "" H 5750 4000 60  0001 C CNN
F 3 "" H 5750 4000 60  0001 C CNN
	1    5750 4000
	0    -1   -1   0   
$EndComp
Text GLabel 6100 4900 2    60   Input ~ 0
GND
Text GLabel 6100 4800 2    60   Input ~ 0
MOSI
Text GLabel 6100 4700 2    60   Input ~ 0
Vt
Text GLabel 5100 4900 0    60   Input ~ 0
RST
Text GLabel 5100 4800 0    60   Input ~ 0
SCK
Text GLabel 5100 4700 0    60   Input ~ 0
MISO
$Comp
L CONN_3X2 P1
U 1 1 522B3C4E
P 5600 4850
F 0 "P1" H 5600 5100 50  0000 C CNN
F 1 "ISP" V 5600 4900 40  0000 C CNN
F 2 "" H 5600 4850 60  0001 C CNN
F 3 "" H 5600 4850 60  0001 C CNN
	1    5600 4850
	1    0    0    -1  
$EndComp
Text GLabel 900  4400 0    60   Input ~ 0
GND
Text GLabel 900  5300 0    60   Input ~ 0
SCK
Text GLabel 900  5400 0    60   Input ~ 0
GND
Text GLabel 1900 5400 2    60   Input ~ 0
MOSI
Text GLabel 1900 5300 2    60   Input ~ 0
MISO
Text GLabel 1900 4700 2    60   Input ~ 0
RST
Text GLabel 1900 4400 2    60   Input ~ 0
Vt
$Comp
L CONN_1 TP24
U 1 1 522B17E6
P 1650 4400
F 0 "TP24" H 1730 4400 40  0000 L CNN
F 1 "CONN_1" H 1650 4455 30  0001 C CNN
F 2 "" H 1650 4400 60  0001 C CNN
F 3 "" H 1650 4400 60  0001 C CNN
	1    1650 4400
	-1   0    0    -1  
$EndComp
$Comp
L CONN_1 TP21
U 1 1 522B17DE
P 1650 4700
F 0 "TP21" H 1730 4700 40  0000 L CNN
F 1 "CONN_1" H 1650 4755 30  0001 C CNN
F 2 "" H 1650 4700 60  0001 C CNN
F 3 "" H 1650 4700 60  0001 C CNN
	1    1650 4700
	-1   0    0    -1  
$EndComp
$Comp
L CONN_1 TP13
U 1 1 522B17D1
P 1650 5300
F 0 "TP13" H 1730 5300 40  0000 L CNN
F 1 "CONN_1" H 1650 5355 30  0001 C CNN
F 2 "" H 1650 5300 60  0001 C CNN
F 3 "" H 1650 5300 60  0001 C CNN
	1    1650 5300
	-1   0    0    -1  
$EndComp
$Comp
L CONN_1 TP12
U 1 1 522B17C4
P 1650 5400
F 0 "TP12" H 1730 5400 40  0000 L CNN
F 1 "CONN_1" H 1650 5455 30  0001 C CNN
F 2 "" H 1650 5400 60  0001 C CNN
F 3 "" H 1650 5400 60  0001 C CNN
	1    1650 5400
	-1   0    0    -1  
$EndComp
$Comp
L CONN_1 TP11
U 1 1 522B17BF
P 1150 5400
F 0 "TP11" H 1230 5400 40  0000 L CNN
F 1 "CONN_1" H 1150 5455 30  0001 C CNN
F 2 "" H 1150 5400 60  0001 C CNN
F 3 "" H 1150 5400 60  0001 C CNN
	1    1150 5400
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 TP10
U 1 1 522B17B2
P 1150 5300
F 0 "TP10" H 1230 5300 40  0000 L CNN
F 1 "CONN_1" H 1150 5355 30  0001 C CNN
F 2 "" H 1150 5300 60  0001 C CNN
F 3 "" H 1150 5300 60  0001 C CNN
	1    1150 5300
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 TP1
U 1 1 522B17A4
P 1150 4400
F 0 "TP1" H 1230 4400 40  0000 L CNN
F 1 "CONN_1" H 1150 4455 30  0001 C CNN
F 2 "" H 1150 4400 60  0001 C CNN
F 3 "" H 1150 4400 60  0001 C CNN
	1    1150 4400
	1    0    0    -1  
$EndComp
$Comp
L PIEZO X1
U 1 1 522B1428
P 6900 4000
F 0 "X1" H 6900 4150 60  0000 C CNN
F 1 "PIEZO" H 6900 3850 60  0000 C CNN
F 2 "" H 6900 4000 60  0001 C CNN
F 3 "" H 6900 4000 60  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
Text GLabel 7500 1100 2    60   Input ~ 0
Vt
Text GLabel 10300 3700 2    60   Input ~ 0
GND
Text GLabel 6300 3200 2    60   Input ~ 0
MISO
Text GLabel 10300 3000 2    60   Input ~ 0
XCK
Text GLabel 10300 2900 2    60   Input ~ 0
SCK
Text GLabel 9500 2700 2    60   Input ~ 0
RST
Text GLabel 10300 2800 2    60   Input ~ 0
MOSI
$Comp
L DIL40 U5
U 1 1 522AFA50
P 3450 5350
F 0 "U5" H 3450 6400 70  0000 C CNN
F 1 "ZIF" V 3450 5350 60  0000 C CNN
F 2 "" H 3450 5350 60  0001 C CNN
F 3 "" H 3450 5350 60  0001 C CNN
	1    3450 5350
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 522AF227
P 5800 2150
F 0 "R1" V 5880 2150 50  0000 C CNN
F 1 "27k" V 5800 2150 50  0000 C CNN
F 2 "" H 5800 2150 60  0001 C CNN
F 3 "" H 5800 2150 60  0001 C CNN
	1    5800 2150
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 522AF222
P 6000 2150
F 0 "R2" V 6080 2150 50  0000 C CNN
F 1 "27k" V 6000 2150 50  0000 C CNN
F 2 "" H 6000 2150 60  0001 C CNN
F 3 "" H 6000 2150 60  0001 C CNN
	1    6000 2150
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 522AF21A
P 6200 2150
F 0 "R3" V 6280 2150 50  0000 C CNN
F 1 "27k" V 6200 2150 50  0000 C CNN
F 2 "" H 6200 2150 60  0001 C CNN
F 3 "" H 6200 2150 60  0001 C CNN
	1    6200 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 522AF097
P 7500 3900
F 0 "#PWR5" H 7500 3900 30  0001 C CNN
F 1 "GND" H 7500 3830 30  0001 C CNN
F 2 "" H 7500 3900 60  0001 C CNN
F 3 "" H 7500 3900 60  0001 C CNN
	1    7500 3900
	1    0    0    -1  
$EndComp
$Comp
L CD4050 U3
U 1 1 522AEFFD
P 7000 2900
F 0 "U3" H 7000 2900 60  0000 C CNN
F 1 "CD4050" H 7000 2800 60  0000 C CNN
F 2 "" H 7000 2900 60  0001 C CNN
F 3 "" H 7000 2900 60  0001 C CNN
	1    7000 2900
	1    0    0    -1  
$EndComp
$Comp
L 74HC243 U4
U 1 1 522AEFCB
P 8750 3000
F 0 "U4" H 8850 2900 60  0000 C CNN
F 1 "74HC243" H 8850 2800 60  0000 C CNN
F 2 "" H 8750 3000 60  0001 C CNN
F 3 "" H 8750 3000 60  0001 C CNN
	1    8750 3000
	1    0    0    -1  
$EndComp
$Comp
L NCP1117ST33T3G U6
U 1 1 522DC385
P 3800 1150
F 0 "U6" H 3800 1400 40  0000 C CNN
F 1 "NCP1117" H 3800 1350 40  0000 C CNN
F 2 "~" H 3800 1150 60  0000 C CNN
F 3 "~" H 3800 1150 60  0000 C CNN
	1    3800 1150
	-1   0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 522DC9F5
P 3300 1400
F 0 "C1" H 3300 1500 40  0000 L CNN
F 1 "10u" H 3306 1315 40  0000 L CNN
F 2 "~" H 3338 1250 30  0000 C CNN
F 3 "~" H 3300 1400 60  0000 C CNN
	1    3300 1400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2
U 1 1 522DCD9F
P 3100 950
F 0 "#PWR2" H 3100 910 30  0001 C CNN
F 1 "+3.3V" H 3100 1060 30  0000 C CNN
F 2 "" H 3100 950 60  0000 C CNN
F 3 "" H 3100 950 60  0000 C CNN
	1    3100 950 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR3
U 1 1 522DCDAE
P 5400 1000
F 0 "#PWR3" H 5400 1090 20  0001 C CNN
F 1 "+5V" H 5400 1090 30  0000 C CNN
F 2 "" H 5400 1000 60  0000 C CNN
F 3 "" H 5400 1000 60  0000 C CNN
	1    5400 1000
	1    0    0    -1  
$EndComp
$Comp
L SW_DIP_6 SW1
U 1 1 522DDF53
P 7500 5150
F 0 "SW1" H 7500 6150 60  0000 C CNN
F 1 "SW_DIP_6" H 7500 5200 60  0001 C CNN
F 2 "" H 7500 5150 60  0000 C CNN
F 3 "" H 7500 5150 60  0000 C CNN
	1    7500 5150
	1    0    0    -1  
$EndComp
Text Label 5500 2100 0    60   ~ 0
CFG1
Text Label 5500 2200 0    60   ~ 0
CFG2
Text Label 5500 2500 0    60   ~ 0
CFG4
Text Label 5600 2700 0    60   ~ 0
CFG5
Text Label 5600 2800 0    60   ~ 0
CFG6
Text Label 6900 4600 2    60   ~ 0
CFG2
Text Label 6900 4700 2    60   ~ 0
CFG3
Text Label 6900 4800 2    60   ~ 0
CFG4
Text Label 6900 4900 2    60   ~ 0
CFG5
Text Label 6900 5000 2    60   ~ 0
CFG6
Wire Wire Line
	6500 4000 6600 4000
Wire Wire Line
	8000 3200 8000 2600
Wire Wire Line
	8000 2600 7700 2600
Connection ~ 5800 2600
Wire Wire Line
	5100 4800 5200 4800
Wire Wire Line
	6100 4900 6000 4900
Wire Wire Line
	6100 4700 6000 4700
Wire Wire Line
	1900 4400 1800 4400
Wire Wire Line
	1900 5400 1800 5400
Wire Wire Line
	1000 5400 900  5400
Wire Wire Line
	1000 4400 900  4400
Connection ~ 7200 3700
Wire Wire Line
	7200 3700 7200 4000
Wire Wire Line
	5400 2400 5700 2400
Wire Wire Line
	5700 2400 5700 2800
Wire Wire Line
	5800 2400 5800 2900
Wire Wire Line
	9450 2700 9500 2700
Connection ~ 5800 1800
Wire Wire Line
	5400 1000 5400 2000
Connection ~ 6000 1800
Wire Wire Line
	6000 1800 6000 1900
Wire Wire Line
	5800 1800 5800 1900
Wire Wire Line
	4000 3700 4000 3100
Connection ~ 5800 2900
Connection ~ 7500 3700
Wire Wire Line
	7500 3700 7500 3900
Wire Wire Line
	8050 2700 7900 2700
Wire Wire Line
	7900 2700 7900 3700
Connection ~ 7900 3700
Wire Wire Line
	4000 3000 3900 3000
Wire Wire Line
	3900 3000 3900 3300
Wire Wire Line
	6200 1800 6200 1900
Connection ~ 6200 1800
Wire Wire Line
	6000 2400 6000 3000
Wire Wire Line
	6200 2400 6200 3300
Wire Wire Line
	9450 2800 10300 2800
Wire Wire Line
	9450 2900 10300 2900
Wire Wire Line
	3150 3700 10300 3700
Wire Wire Line
	5800 3100 5800 3000
Wire Wire Line
	5800 3100 5400 3100
Wire Wire Line
	1000 5300 900  5300
Wire Wire Line
	1800 5300 1900 5300
Wire Wire Line
	1800 4700 1900 4700
Wire Wire Line
	5700 2800 5900 2800
Wire Wire Line
	5900 2800 5900 3100
Wire Wire Line
	5800 2900 5400 2900
Wire Wire Line
	7500 3200 7750 3200
Wire Wire Line
	7500 3200 7500 3350
Wire Wire Line
	7500 3350 5700 3350
Wire Wire Line
	5700 3350 5700 3000
Wire Wire Line
	5700 3000 5400 3000
Wire Wire Line
	5400 1800 6200 1800
Wire Wire Line
	6000 4800 6100 4800
Wire Wire Line
	5200 4900 5100 4900
Wire Wire Line
	5200 4700 5100 4700
Wire Wire Line
	5800 2600 6300 2600
Wire Wire Line
	5400 2600 5500 2600
Wire Wire Line
	5500 2600 5500 4000
Connection ~ 5400 1800
Wire Wire Line
	3800 1400 3800 3700
Connection ~ 4000 3700
Connection ~ 3800 3700
Wire Wire Line
	4200 1100 5400 1100
Wire Wire Line
	3300 1100 3300 1200
Connection ~ 3300 1100
Connection ~ 5400 1100
Connection ~ 3100 1100
Wire Wire Line
	1300 1100 3400 1100
Wire Wire Line
	8100 4600 8100 5000
Wire Wire Line
	8000 4600 8200 4600
Wire Wire Line
	8100 4700 8000 4700
Connection ~ 8100 4600
Wire Wire Line
	8100 4800 8000 4800
Connection ~ 8100 4700
Wire Wire Line
	8100 4900 8000 4900
Connection ~ 8100 4800
Wire Wire Line
	8100 5000 8000 5000
Connection ~ 8100 4900
Wire Wire Line
	5500 2100 5400 2100
Wire Wire Line
	5500 2200 5400 2200
Wire Wire Line
	5500 2500 5400 2500
Wire Wire Line
	5600 2700 5400 2700
Wire Wire Line
	5600 2800 5400 2800
Wire Wire Line
	7000 4500 6900 4500
Wire Wire Line
	6900 4600 7000 4600
Wire Wire Line
	7000 4700 6900 4700
Wire Wire Line
	6900 4800 7000 4800
Wire Wire Line
	7000 4900 6900 4900
Wire Wire Line
	6900 5000 7000 5000
Connection ~ 6800 1800
Wire Wire Line
	6800 3400 6800 3700
Connection ~ 6800 3700
Wire Wire Line
	3000 1100 3000 2600
Connection ~ 3000 1100
Wire Wire Line
	3100 950  3100 1200
$Comp
L R R5
U 1 1 522ED9C0
P 9450 2250
F 0 "R5" V 9530 2250 40  0000 C CNN
F 1 "27k" V 9457 2251 40  0000 C CNN
F 2 "~" V 9380 2250 30  0000 C CNN
F 3 "~" H 9450 2250 30  0000 C CNN
	1    9450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1800 9450 2000
Wire Wire Line
	9450 2500 9450 2700
$Comp
L MOSFET_P Q1
U 1 1 522EDF17
P 7200 1300
F 0 "Q1" H 7200 1490 60  0000 R CNN
F 1 "BSS84" H 7200 1120 60  0000 R CNN
F 2 "~" H 7200 1300 60  0000 C CNN
F 3 "~" H 7200 1300 60  0000 C CNN
	1    7200 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1800 6800 2450
Wire Wire Line
	5200 1300 7000 1300
Wire Wire Line
	5200 1700 5200 1300
Wire Wire Line
	3900 1700 5200 1700
Wire Wire Line
	6800 1800 8750 1800
Wire Wire Line
	7300 1100 7500 1100
Wire Wire Line
	7300 1500 7300 1800
Connection ~ 7300 1800
Text GLabel 9600 1800 2    60   Input ~ 0
Vt
Wire Wire Line
	9600 1800 9450 1800
Wire Wire Line
	8650 1800 8650 2350
Wire Wire Line
	8650 3650 8650 3700
Connection ~ 8650 3700
Text Label 8750 1800 0    60   ~ 0
VCC
Connection ~ 8650 1800
Wire Wire Line
	7700 3000 7950 3000
Wire Wire Line
	7950 3000 7950 2800
$Comp
L R R6
U 1 1 522EFBD2
P 9600 3350
F 0 "R6" V 9680 3350 40  0000 C CNN
F 1 "27k" V 9607 3351 40  0000 C CNN
F 2 "~" V 9530 3350 30  0000 C CNN
F 3 "~" H 9600 3350 30  0000 C CNN
	1    9600 3350
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 522EFBE1
P 9800 3350
F 0 "R7" V 9880 3350 40  0000 C CNN
F 1 "27k" V 9807 3351 40  0000 C CNN
F 2 "~" V 9730 3350 30  0000 C CNN
F 3 "~" H 9800 3350 30  0000 C CNN
	1    9800 3350
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 522EFBF0
P 10200 3350
F 0 "R8" V 10280 3350 40  0000 C CNN
F 1 "27k" V 10207 3351 40  0000 C CNN
F 2 "~" V 10130 3350 30  0000 C CNN
F 3 "~" H 10200 3350 30  0000 C CNN
	1    10200 3350
	1    0    0    -1  
$EndComp
Text GLabel 10300 3100 2    60   Input ~ 0
MISO
Wire Wire Line
	10200 3700 10200 3600
Connection ~ 10200 3700
Wire Wire Line
	9800 3700 9800 3600
Connection ~ 9800 3700
Wire Wire Line
	9600 3600 9600 3700
Connection ~ 9600 3700
Wire Wire Line
	9800 3100 9800 2900
Connection ~ 9800 2900
Wire Wire Line
	9600 3100 9600 2800
Connection ~ 9600 2800
Wire Wire Line
	7750 3200 7750 2900
Wire Wire Line
	7750 2900 7700 2900
Wire Wire Line
	7700 3100 8050 3100
Wire Wire Line
	5900 3100 6300 3100
Wire Wire Line
	6300 3200 6250 3200
Wire Wire Line
	6250 3200 6250 2900
Wire Wire Line
	6250 2900 6300 2900
$Comp
L AT45DB U7
U 1 1 522F0E6F
P 2250 2500
F 0 "U7" H 2250 2500 60  0000 C CNN
F 1 "AT45DB" H 2250 2300 60  0000 C CNN
F 2 "" H 2400 2300 60  0000 C CNN
F 3 "" H 2400 2300 60  0000 C CNN
	1    2250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2500 2900 2500
Wire Wire Line
	2900 2400 3150 2400
Wire Wire Line
	3150 2400 3150 3700
Connection ~ 3150 3700
Wire Wire Line
	1300 2500 1600 2500
Wire Wire Line
	1500 2400 1600 2400
Wire Wire Line
	1300 2500 1300 1100
Wire Wire Line
	3000 2600 2900 2600
Connection ~ 3000 2500
Wire Wire Line
	3600 2000 2900 2000
Wire Wire Line
	2900 2000 2900 2300
Wire Wire Line
	3500 2100 1500 2100
Wire Wire Line
	1500 2100 1500 2400
Wire Wire Line
	1600 2200 1600 2300
Wire Wire Line
	3400 2800 1600 2800
Wire Wire Line
	1600 2800 1600 2600
$Comp
L C C2
U 1 1 522F337D
P 4300 1350
F 0 "C2" H 4300 1450 40  0000 L CNN
F 1 "10u" H 4306 1265 40  0000 L CNN
F 2 "~" H 4338 1200 30  0000 C CNN
F 3 "~" H 4300 1350 60  0000 C CNN
	1    4300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1100 4300 1150
Connection ~ 4300 1100
Wire Wire Line
	4300 1550 3800 1550
Connection ~ 3800 1550
Text GLabel 8200 4600 2    60   Input ~ 0
GND
Wire Wire Line
	3400 2400 4000 2400
Wire Wire Line
	3400 2400 3400 2800
Wire Wire Line
	4000 2300 3400 2300
Wire Wire Line
	3400 2300 3400 2200
Wire Wire Line
	3400 2200 1600 2200
Wire Wire Line
	4000 2200 3500 2200
Wire Wire Line
	3500 2200 3500 2100
Wire Wire Line
	4000 2100 3600 2100
Wire Wire Line
	3600 2100 3600 2000
Wire Wire Line
	3900 1700 3900 2000
Wire Wire Line
	3900 2000 4000 2000
$Comp
L R R9
U 1 1 522FCEB1
P 10000 3350
F 0 "R9" V 10080 3350 40  0000 C CNN
F 1 "27k" V 10007 3351 40  0000 C CNN
F 2 "~" V 9930 3350 30  0000 C CNN
F 3 "~" H 10000 3350 30  0000 C CNN
	1    10000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3700 10000 3600
Connection ~ 10000 3700
Wire Wire Line
	10300 3100 10200 3100
Wire Wire Line
	9450 3000 10300 3000
Wire Wire Line
	10000 3000 10000 3100
Connection ~ 10000 3000
Wire Wire Line
	8050 3100 8050 3000
$Comp
L R R10
U 1 1 522FD217
P 2550 1800
F 0 "R10" V 2630 1800 40  0000 C CNN
F 1 "1k3" V 2557 1801 40  0000 C CNN
F 2 "~" V 2480 1800 30  0000 C CNN
F 3 "~" H 2550 1800 30  0000 C CNN
	1    2550 1800
	0    -1   -1   0   
$EndComp
$Comp
L LED D1
U 1 1 522FD226
P 2200 1600
F 0 "D1" H 2200 1700 50  0000 C CNN
F 1 "LED" H 2200 1500 50  0000 C CNN
F 2 "~" H 2200 1600 60  0000 C CNN
F 3 "~" H 2200 1600 60  0000 C CNN
	1    2200 1600
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR1
U 1 1 522FD276
P 2200 1300
F 0 "#PWR1" H 2200 1390 20  0001 C CNN
F 1 "+5V" H 2200 1390 30  0000 C CNN
F 2 "" H 2200 1300 60  0000 C CNN
F 3 "" H 2200 1300 60  0000 C CNN
	1    2200 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1800 3300 1800
Wire Wire Line
	3300 1800 3300 2900
Wire Wire Line
	2200 1300 2200 1400
Wire Wire Line
	2300 1800 2200 1800
$Comp
L CONN_1 P2
U 1 1 522FDA85
P 5750 4300
F 0 "P2" H 5830 4300 40  0000 L CNN
F 1 "CONN_1" H 5750 4355 30  0001 C CNN
F 2 "~" H 5750 4300 60  0000 C CNN
F 3 "~" H 5750 4300 60  0000 C CNN
	1    5750 4300
	1    0    0    -1  
$EndComp
Text GLabel 5500 4300 0    60   Input ~ 0
XCK
Wire Wire Line
	5600 4300 5500 4300
Text Label 8100 4500 0    60   ~ 0
VCC
Wire Wire Line
	8000 4500 8100 4500
$Comp
L +5V #PWR4
U 1 1 522FE028
P 6900 4500
F 0 "#PWR4" H 6900 4590 20  0001 C CNN
F 1 "+5V" H 6900 4590 30  0000 C CNN
F 2 "" H 6900 4500 60  0000 C CNN
F 3 "" H 6900 4500 60  0000 C CNN
	1    6900 4500
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 522FE072
P 5600 5500
F 0 "SW2" H 5750 5610 50  0000 C CNN
F 1 "SW_PUSH" H 5600 5420 50  0000 C CNN
F 2 "~" H 5600 5500 60  0000 C CNN
F 3 "~" H 5600 5500 60  0000 C CNN
	1    5600 5500
	1    0    0    -1  
$EndComp
Text GLabel 6000 5500 2    60   Input ~ 0
GND
Text Label 5200 5500 2    60   ~ 0
CFG1
Wire Wire Line
	5300 5500 5200 5500
Wire Wire Line
	5900 5500 6000 5500
Wire Wire Line
	8050 3200 8000 3200
Wire Wire Line
	8050 3300 7900 3300
Connection ~ 7900 3300
Wire Wire Line
	5800 3000 6300 3000
Wire Wire Line
	6300 2800 6200 2800
Connection ~ 6200 2800
Connection ~ 6000 3000
Wire Wire Line
	7950 2800 8050 2800
Wire Wire Line
	8050 2900 7800 2900
Wire Wire Line
	7800 2900 7800 2800
Wire Wire Line
	7800 2800 7700 2800
Wire Wire Line
	6300 2700 6100 2700
Wire Wire Line
	6100 2700 6100 3700
Connection ~ 6100 3700
$Comp
L R R11
U 1 1 52AC5DEE
P 6600 1650
F 0 "R11" V 6680 1650 40  0000 C CNN
F 1 "47k" V 6607 1651 40  0000 C CNN
F 2 "~" V 6530 1650 30  0000 C CNN
F 3 "~" H 6600 1650 30  0000 C CNN
	1    6600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1400 6600 1300
Connection ~ 6600 1300
Wire Wire Line
	6600 1900 6800 1900
Connection ~ 6800 1900
Wire Wire Line
	3300 2900 4000 2900
Text Label 3900 2500 2    60   ~ 0
CFG3
Wire Wire Line
	3900 2500 4000 2500
$Comp
L R R12
U 1 1 52AC6628
P 3100 1450
F 0 "R12" V 3180 1450 40  0000 C CNN
F 1 "1k" V 3107 1451 40  0000 C CNN
F 2 "~" V 3030 1450 30  0000 C CNN
F 3 "~" H 3100 1450 30  0000 C CNN
	1    3100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1700 3800 1700
Wire Wire Line
	3300 1700 3300 1600
Connection ~ 3800 1700
Connection ~ 3300 1700
$Comp
L MINIMUS U1
U 1 1 52AC8CA9
P 4700 2550
F 0 "U1" H 4700 3200 60  0000 C CNN
F 1 "MINIMUS" V 4700 2550 60  0000 C CNN
F 2 "" H 4700 1950 60  0000 C CNN
F 3 "" H 4700 1950 60  0000 C CNN
	1    4700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3300 3900 3300
$Comp
L CONN_10 P5
U 1 1 52AC95E0
P 4250 4850
F 0 "P5" V 4200 4850 60  0000 C CNN
F 1 "CONN_10" V 4300 4850 60  0000 C CNN
F 2 "~" H 4250 4850 60  0000 C CNN
F 3 "~" H 4250 4850 60  0000 C CNN
	1    4250 4850
	1    0    0    -1  
$EndComp
$Comp
L CONN_10 P6
U 1 1 52AC95EF
P 4250 5850
F 0 "P6" V 4200 5850 60  0000 C CNN
F 1 "CONN_10" V 4300 5850 60  0000 C CNN
F 2 "~" H 4250 5850 60  0000 C CNN
F 3 "~" H 4250 5850 60  0000 C CNN
	1    4250 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_10 P3
U 1 1 52AC95FE
P 2650 4850
F 0 "P3" V 2600 4850 60  0000 C CNN
F 1 "CONN_10" V 2700 4850 60  0000 C CNN
F 2 "~" H 2650 4850 60  0000 C CNN
F 3 "~" H 2650 4850 60  0000 C CNN
	1    2650 4850
	-1   0    0    -1  
$EndComp
$Comp
L CONN_10 P4
U 1 1 52AC960D
P 2650 5850
F 0 "P4" V 2600 5850 60  0000 C CNN
F 1 "CONN_10" V 2700 5850 60  0000 C CNN
F 2 "~" H 2650 5850 60  0000 C CNN
F 3 "~" H 2650 5850 60  0000 C CNN
	1    2650 5850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 4400 3000 4400
Wire Wire Line
	3000 4500 3100 4500
Wire Wire Line
	3100 4600 3000 4600
Wire Wire Line
	3000 4700 3100 4700
Wire Wire Line
	3100 4800 3000 4800
Wire Wire Line
	3000 4900 3100 4900
Wire Wire Line
	3100 5000 3000 5000
Wire Wire Line
	3000 5100 3100 5100
Wire Wire Line
	3100 5200 3000 5200
Wire Wire Line
	3000 5300 3100 5300
Wire Wire Line
	3100 5400 3000 5400
Wire Wire Line
	3000 5500 3100 5500
Wire Wire Line
	3000 5700 3100 5700
Wire Wire Line
	3000 5600 3100 5600
Wire Wire Line
	3100 5800 3000 5800
Wire Wire Line
	3000 5900 3100 5900
Wire Wire Line
	3100 6000 3000 6000
Wire Wire Line
	3000 6100 3100 6100
Wire Wire Line
	3100 6200 3000 6200
Wire Wire Line
	3000 6300 3100 6300
Wire Wire Line
	3800 6300 3900 6300
Wire Wire Line
	3900 6200 3800 6200
Wire Wire Line
	3800 6100 3900 6100
Wire Wire Line
	3900 6000 3800 6000
Wire Wire Line
	3800 5900 3900 5900
Wire Wire Line
	3900 5800 3800 5800
Wire Wire Line
	3800 5700 3900 5700
Wire Wire Line
	3900 5600 3800 5600
Wire Wire Line
	3800 5500 3900 5500
Wire Wire Line
	3900 5400 3800 5400
Wire Wire Line
	3800 5300 3900 5300
Wire Wire Line
	3900 5200 3800 5200
Wire Wire Line
	3800 5100 3900 5100
Wire Wire Line
	3900 5000 3800 5000
Wire Wire Line
	3800 4900 3900 4900
Wire Wire Line
	3900 4800 3800 4800
Wire Wire Line
	3800 4700 3900 4700
Wire Wire Line
	3900 4600 3800 4600
Wire Wire Line
	3800 4500 3900 4500
Wire Wire Line
	3900 4400 3800 4400
Text GLabel 5800 6400 0    60   Input ~ 0
MISO
Text GLabel 5800 6300 0    60   Input ~ 0
MOSI
Text GLabel 5800 6500 0    60   Input ~ 0
RST
Text GLabel 5800 6200 0    60   Input ~ 0
SCK
Text GLabel 5800 6600 0    60   Input ~ 0
XCK
Text GLabel 5800 6000 0    60   Input ~ 0
Vt
Text GLabel 5800 6100 0    60   Input ~ 0
GND
$Comp
L CONN_7 P7
U 1 1 52ACB9CA
P 6250 6300
F 0 "P7" V 6220 6300 60  0000 C CNN
F 1 "CONN_7" V 6320 6300 60  0000 C CNN
F 2 "~" H 6250 6300 60  0000 C CNN
F 3 "~" H 6250 6300 60  0000 C CNN
	1    6250 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 6000 5800 6000
Wire Wire Line
	5800 6100 5900 6100
Wire Wire Line
	5900 6600 5800 6600
Wire Wire Line
	5900 6400 5800 6400
Wire Wire Line
	5800 6200 5900 6200
Wire Wire Line
	5800 6500 5900 6500
Wire Wire Line
	5900 6300 5800 6300
$Comp
L C C3
U 1 1 52ACCEA3
P 6300 4000
F 0 "C3" H 6300 4100 40  0000 L CNN
F 1 "100n" H 6306 3915 40  0000 L CNN
F 2 "~" H 6338 3850 30  0000 C CNN
F 3 "~" H 6300 4000 60  0000 C CNN
	1    6300 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 4000 6000 4000
$Comp
L CONN_1 P11
U 1 1 52ACC5F9
P 9500 3950
F 0 "P11" H 9580 3950 40  0000 L CNN
F 1 "CONN_1" H 9500 4005 30  0001 C CNN
F 2 "~" H 9500 3950 60  0000 C CNN
F 3 "~" H 9500 3950 60  0000 C CNN
	1    9500 3950
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P10
U 1 1 52ACC608
P 9400 3950
F 0 "P10" H 9480 3950 40  0000 L CNN
F 1 "CONN_1" H 9400 4005 30  0001 C CNN
F 2 "~" H 9400 3950 60  0000 C CNN
F 3 "~" H 9400 3950 60  0000 C CNN
	1    9400 3950
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P9
U 1 1 52ACC617
P 9300 3950
F 0 "P9" H 9380 3950 40  0000 L CNN
F 1 "CONN_1" H 9300 4005 30  0001 C CNN
F 2 "~" H 9300 3950 60  0000 C CNN
F 3 "~" H 9300 3950 60  0000 C CNN
	1    9300 3950
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P8
U 1 1 52ACC626
P 9200 3950
F 0 "P8" H 9280 3950 40  0000 L CNN
F 1 "CONN_1" H 9200 4005 30  0001 C CNN
F 2 "~" H 9200 3950 60  0000 C CNN
F 3 "~" H 9200 3950 60  0000 C CNN
	1    9200 3950
	0    1    1    0   
$EndComp
Connection ~ 9500 3700
Wire Wire Line
	9400 3700 9400 3800
Connection ~ 9400 3700
Wire Wire Line
	9500 3700 9500 3800
Wire Wire Line
	9300 3700 9300 3800
Connection ~ 9300 3700
Wire Wire Line
	9200 3700 9200 3800
Connection ~ 9200 3700
$EndSCHEMATC
