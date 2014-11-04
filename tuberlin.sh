#!/bin/bash

wlan=0  tubcloud=0
while getopts w:t; do
	case $opt in
		w)
			wlan=1
			;;
		t)
			tubcload=1
		;;
		#t)
		#	time=$OPTARG
		#;;
	esac
done
shift $((OPTIND - 1))

if [ $wlan -eq 1 ]; then
	curl -L https://www.tubit.tu-berlin.de/fileadmin/a40000000/tubIT/Software/eduroam_Linux_TU_Berlin.sh | sh
fi

if [ $tubcloud -eq 1 ]; then
	PWD=`pwd`
	wget http://www.tubit.tu-berlin.de/fileadmin/a40000000/tubIT/Software/owncloud/tubcloud-1.6.3-linux.tar -O /tmp/tubcloud.tar \
		&& cd /tmp/ && tar -xvf tubcloud.tar \
		&& cd tubcloud*/

	if [[ -r /etc/os-release ]]; then
		. /etc/os-release
		ARCH="i386"
		if uname -a | grep "x86_64" 1> /dev/null; then
			ARCH="amd64"
		fi	

		cd ./*$NAME*$VERSION_ID*/ \
			&& dpkg -i all/* $ARCH/* 1> /dev/null \
			&& apt-get install -f -y \
			&& cd $PWD \
			&& tubcloud &
	else
		echo "Can't determine linux distro. Please install manuell."
	fi
fi
