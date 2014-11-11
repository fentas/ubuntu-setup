#!/bin/bash
BASH=`(which bash)`

if [ ! $SUDO_USER ]; then
	echo "Needs to be sudo"
	exit 1
fi

#for scripts in `ls . | grep sh$`; do script;
#	echo $script
#done


options=( $(ls -v | awk '$0 ~ /^[0-9]+_(.+\.sh)$/ { gsub(/^[0-9]+_/, ""); print }') )
echo $options
echo "ubuntu-setup..."
PS3="Pick an option: "
select opt in "...complete" "${options[@]}" "Quit"; do 
	case "$REPLY" in
		$(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
		*) 
			if [ ! $opt ]; then 
				echo "Invalid option. Try another one."; continue;
			fi
			
			if [ $REPLY == 1 ]; then
				for script in "${options[@]}"; do 
					echo "Executing '$script'..."
#					exec "$BASH $"
				done
			else
				echo "Executing '$opt'..."
				`$BASH $opt`
			fi
			;;

	esac
done
