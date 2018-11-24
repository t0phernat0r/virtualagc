EESchema Schematic File Version 4
LIBS:module-cache
EELAYER 29 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 10 12
Title "BLOCK I LOGIC FLOW B, MODULE A18, DRAWING 1006542"
Date "2018-11-24"
Rev "Draft"
Comp ""
Comment1 "Modules A18"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1600 7375 0    140  Input ~ 28
+3VDC
Text HLabel 1600 7725 0    140  Input ~ 28
0VDC
$Comp
L D3NOR-NC-0VDC-expander-nd1021041:D3NOR-NC-0VDC-expander-nd1021041-_B_-___ U1001
U 1 1 5BF960B4
P 5375 4050
F 0 "U1001" H 5375 4375 140 0001 C CNB
F 1 "D3NOR-NC-0VDC-expander-nd1021041-_B_-___" H 5375 4475 140 0001 C CNN
F 2 "" H 5375 4525 140 0001 C CNN
F 3 "" H 5375 4525 140 0001 C CNN
F 4 "32781" H 5300 4050 130 0000 C CNB "Location"
	1    5375 4050
	1    0    0    1   
$EndComp
$Comp
L AGC_DSKY:ConnectorGeneric J1
U 125 1 5BF960B5
P 7525 4050
F 0 "J1" H 7525 4375 140 0001 C CNN
F 1 "ConnectorGeneric" H 7525 4475 140 0001 C CNN
F 2 "" H 7525 4525 140 0001 C CNN
F 3 "" H 7525 4525 140 0001 C CNN
F 4 "MWZG" H 6775 3975 140 0000 C BNB "Caption"
	125  7525 4050
	-1   0    0    1   
$EndComp
$Comp
L AGC_DSKY:ConnectorGeneric J1
U 131 1 5BF960B6
P 3325 4050
F 0 "J1" H 3325 4375 140 0001 C CNN
F 1 "ConnectorGeneric" H 3325 4475 140 0001 C CNN
F 2 "" H 3325 4525 140 0001 C CNN
F 3 "" H 3325 4525 140 0001 C CNN
F 4 "WZG/" H 2700 3975 140 0000 C BNB "Caption"
	131  3325 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6175 4050 7250 4050
Wire Wire Line
	4775 4050 3600 4050
$EndSCHEMATC
