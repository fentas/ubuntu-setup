#!/bin/bash
apt-get install -y \
	openjdk-7-jdk \
	icedtea-7-plugin

#TODO: check browser
BROWSER="/opt/google/chrome/plugins"
mkdir -p $BROWSER
sudo ln -s /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so $BROWSER
