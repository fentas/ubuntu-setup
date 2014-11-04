#!/bin/bash

VIM=`which vim`
VERSION="7.4"

if [ $? -ne 0 or -z "$(vim -h | grep servername)" ]; then
	wget ftp://ftp.vim.org/pub/vim/unix/vim-$VERSION.tar.bz2 -O /tmp/vim-release.tar.bz2 \
		&& cd /tmp/ && tar -xvf ./vim-release.tar.bz2 && cd vim-*/

	if [ $? -eq 0 ]; then
		apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev \
			&& ./configure --with-features=huge --enable-gui=gnome2 --enable-cscope \
			&& make && cd src \
			&& make install
	fi
else 
	echo "Nothing to do."
fi

