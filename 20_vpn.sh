#!/bin/bash
#wget https://member.hide.me/setup/ovpn/type/ovpn/server/106 -O ~/tmp/US-West.zip

if [ ! $SUDO_USER ]; then
	echo "needs to be sudo"
	exit 1
fi

apt-get install -y network-manager-openvpn openvpn
	
mkdir -p ~/.vpn/hide.me/ \
	&& cd ~/.vpn/hide.me/ \
	&& wget https://member.hide.me/setup/ovpn/type/ovpn/server/17 -O .tmp.zip \
	&& unzip -o -d .tmp .tmp.zip
	
if [ -f .tmp ]; then
	NAME=`ls .tmp | grep ovpn$ | mawk '{ gsub(/\.[^\.]+$/, ""); print; }'`
	mv .tmp $NAME && cd $NAME
	# install conf...

fi
