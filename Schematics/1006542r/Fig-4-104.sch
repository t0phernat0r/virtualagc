EESchema Schematic File Version 4
LIBS:module-cache
EELAYER 29 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 11 12
Title "BLOCK I LOGIC FLOW B, MODULE A18, DRAWING 1006542"
Date "2018-11-24"
Rev "Draft"
Comp ""
Comment1 "Modules A18"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1650 7275 0    140  Input ~ 28
+3VDC
Text HLabel 1650 7625 0    140  Input ~ 28
0VDC
$Comp
L AGC_DSKY:ConnectorGeneric J1
U 81 1 5BF96188
P 7425 4050
F 0 "J1" H 7425 4375 140 0001 C CNN
F 1 "ConnectorGeneric" H 7425 4475 140 0001 C CNN
F 2 "" H 7425 4525 140 0001 C CNN
F 3 "" H 7425 4525 140 0001 C CNN
F 4 "MWLPG" H 6725 3975 140 0000 C BNB "Caption"
	81   7425 4050
	-1   0    0    1   
$EndComp
$Comp
L AGC_DSKY:ConnectorGeneric J1
U 85 1 5BF96189
P 3650 4050
F 0 "J1" H 3650 4375 140 0001 C CNN
F 1 "ConnectorGeneric" H 3650 4475 140 0001 C CNN
F 2 "" H 3650 4525 140 0001 C CNN
F 3 "" H 3650 4525 140 0001 C CNN
F 4 "WLPG/" H 2975 3975 140 0000 C BNB "Caption"
	85   3650 4050
	1    0    0    -1  
$EndComp
$Comp
L D3NOR-NC-0VDC-expander-nd1021041:D3NOR-NC-0VDC-expander-nd1021041-_B_-___ U1101
U 1 1 5BF9618A
P 5475 4050
F 0 "U1101" H 5475 4375 140 0001 C CNB
F 1 "D3NOR-NC-0VDC-expander-nd1021041-_B_-___" H 5475 4475 140 0001 C CNN
F 2 "" H 5475 4525 140 0001 C CNN
F 3 "" H 5475 4525 140 0001 C CNN
F 4 "32784" H 5400 4050 130 0000 C CNB "Location"
	1    5475 4050
	1    0    0    1   
$EndComp
Wire Wire Line
	4875 4050 3925 4050
Wire Wire Line
	6275 4050 7150 4050
$EndSCHEMATC
