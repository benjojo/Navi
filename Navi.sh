#!/bin/bash
command -v hciconfig >/dev/null 2>&1 || { echo >&2 apt-get install bluez bluez-utils; exit 1; }
command -v hcitool >/dev/null 2>&1 || { echo >&2 "I require hcitool but it's not installed.  Aborting."; exit 1; }
hciconfig hci0 up
while(true) do
	hcitool scan | grep -o '\([0-9a-fA-F]\{2\}:\)\{5\}[0-9a-fA-F]\{2\}' | \
	while read i
	do
		echo "Attempting to connect to $i"
		echo "0000" | timeout 10 bluez-simple-agent hci0 $i
	done
	echo "New Round"
done
