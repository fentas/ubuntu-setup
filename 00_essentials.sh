#!/bin/bash

if [ ! $SUDO_USER ]; then
	sudo echo "Needs to be sudo.." > /dev/null
	if [ ! $? -eq 0 ]; then
		exit 1
	fi
fi

# firefox developer daily (aurora)
# sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/firefox-aurora
ppa_list=("mozillateam/firefox-next" "numix/ppa")
for ppa in "${ppa_list[@]}"; do
  if ! grep -q "$ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository -y ppa:$ppa
  fi
done

# tox
if [ -e "/etc/apt/sources.list.d/toxrepo.list" ]; then
  sudo sh -c 'echo "deb https://repo.tox.im/ nightly main" > /etc/apt/sources.list.d/toxrepo.list'
  wget -qO - https://repo.tox.im/pubkey.gpg | sudo apt-key add -
fi

sudo apt-get update && sudo apt-get install -y \
	build-essential checkinstall \
	guake zsh \
	vim cgdb \
	texlive texlive-lang-german texlive-doc-de texlive-latex-extra latexmk \
	pidgin pidgin-otr pidgin-skype \
	git subversion \
	curl unzip imagemagick page-crunch vlc gimp \
  firefox \
  apt-transport-https utox \
  numix-icon-theme-circle 

# utox ~ https://tox.im/
# numix-icon-theme-circle ~ https://numixproject.org/ - http://me4oslav.deviantart.com/art/Numix-Circle-Linux-Desktop-Icon-Theme-414741466

# page-crunch
# - GUI/frontend to psutils programs, like psnup, psbook
