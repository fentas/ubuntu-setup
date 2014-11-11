#!/bin/bash

if [ ! $SUDO_USER ]; then
	echo "Needs to be sudo"
	exit 1
fi

apt-get update && apt-get install -y \
	build-essential checkinstall \
	guake vim zsh \
	texlive texlive-lang-german texlive-doc-de texlive-latex-extra latexmk \
	pidgin pidgin-otr pidgin-skype \
	git subversion \
	curl unzip
