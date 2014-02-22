#!/bin/bash
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
