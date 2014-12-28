#!/bin/bash

if [ ! $SUDO_USER ]; then
	echo "Needs to be sudo"
	exit 1
fi

apt-get update && apt-get install -y \
	build-essential checkinstall \
	guake zsh \
  vim cgdb \
	texlive texlive-lang-german texlive-doc-de texlive-latex-extra latexmk \
	pidgin pidgin-otr pidgin-skype \
	git subversion \
	curl unzip imagemagick page-crunch vlc gimp

# page-crunch
# - GUI/frontend to psutils programs, like psnup, psbook
