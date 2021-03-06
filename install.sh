#!/bin/bash

if [ ! $SUDO_USER ]; then
	sudo echo "Needs to be sudo.." > /dev/null
	if [ ! $? -eq 0 ]; then
		exit 1
	fi
else
	#su - $SUDO_USER
	echo "Please, do not use sudo.."
	exit 1
fi

mkdir -p ~/Development && cd ~/Development
if [ ! -d ./ubuntu-setup ]; then
	`(which git)`
	if [ ! $? -eq 0 ]; then
		sudo apt-get update && sudo apt-get install -y git
	fi
	git clone https://github.com/fentas/ubuntu-setup.git
fi
cd ./ubuntu-setup
if [ ! $? -eq 0 ]; then
	echo "No ubuntu-setup dir... exit."
	exit 1
fi

# options=( $(ls -v | awk '$0 ~ /^[0-9]+_(.+\.sh)$/ { gsub(/^[0-9]+_/, ""); print }') )
options=( $(ls -v | awk '$0 ~ /^[0-9]+_(.+\.sh)$/ { print }') )

echo "ubuntu-setup..." && echo
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
					bash ./$opt
					if [ $? -eq 0 ]; then
						echo "... Success!"
					else
						echo "... Fail!"
					fi
				done
			else
				echo "Executing '$opt'..."
				bash ./$opt
				if [ $? -eq 0 ]; then
					echo "... Success!"
				else
					echo "... Fail!"
				fi
			fi
			;;

	esac
done 
