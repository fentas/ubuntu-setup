#!/bin/bash

if [ ! $SUDO_USER ]; then
	echo "You have to be sudo."
	exit 1
fi

# disable n standart
echo "options iwlwifi 11n_disable=1" | tee  /etc/modprobe.d/iwlwifi.conf

# disable power safe mode
echo "iwconfig wlan0 power off" | tee /etc/pm/power.d/wireless
chmod +x /etc/pm/power.d/wireless

echo "... [please restart to be successfull]"
