#!/bin/bash

if [ ! $SUDO_USER ]; then
	sudo echo "Needs to be sudo.." > /dev/null
	if [ ! $? -eq 0 ]; then
		exit 1
	fi
fi

# firefox developer daily (aurora)
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/firefox-aurora

sudo apt-get update && sudo apt-get install -y \
	build-essential checkinstall \
	guake zsh \
  	vim cgdb \
	texlive texlive-lang-german texlive-doc-de texlive-latex-extra latexmk \
	pidgin pidgin-otr pidgin-skype \
	git subversion \
	curl unzip imagemagick page-crunch vlc gimp \
  	firefox

# page-crunch
# - GUI/frontend to psutils programs, like psnup, psbook
