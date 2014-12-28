#!/bin/bash

if [ ! $SUDO_USER ]; then
	echo "Needs to be sudo"
	exit 1
fi

mkdir -p ~/Development && cd ~/Development
if [ ! -d ./ubuntu-setup ]; then
	`(which git)`
	if [ ! $? -eq 0 ]; then
		apt-get update && apt-get install -y git
	fi
	git clone https://github.com/fentas/ubuntu-setup.git
fi
cd ./ubuntu-setup
if [ ! $? -eq 0 ]; then
	echo "No ubuntu-setup dir... exit."
	exit 1
fi

BASH=`(which bash)`
IDIR=`pwd`

# options=( $(ls -v | awk '$0 ~ /^[0-9]+_(.+\.sh)$/ { gsub(/^[0-9]+_/, ""); print }') )
options=( $(ls -v | awk '$0 ~ /^[0-9]+_(.+\.sh)$/ { print }') )

echo "ubuntu-setup..."
PS3="Pick an option: "
select opt in "...complete" "${options[@]}" "Quit"; do 
	case "$REPLY" in
		$(( ${#options[@]}+2 )) ) echo "Goodbye!"; break;;
		*) 
			if [ ! $opt ]; then 
				echo "Invalid option. Try another one."; continue;
			fi
			
			if [ $REPLY == 1 ]; then
				# first make sure nessaccary progs installed
				for script in "${options[@]}"; do 
					echo "Executing '$script'..."
#					exec "$BASH $"
				done
			else
				echo "Executing '$opt'..."
				`$BASH $IDIR/$opt`
				if [ $? -eq 0 ]; then
					echo "... Success!"
				else
					echo "... Fail!"
				fi
			fi
			;;

	esac
done
