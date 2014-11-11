#!/bin/bash

#curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.zshrc > ~/.zshrc
#curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.vimrc > ~/.vimrc

mkdir -p ~/Development && cd ~/Development
if [ ! -d ./ubuntu-setup ]; then
	git clone https://github.com/fentas/ubuntu-setup.git
fi

cd ./ubuntu-setup
if [ -f ~/.zshrc ]; then
	cp ~/.zshrc ~/.zshrc.ubuntu-setup.back; fi
if [ -f ~/.vimrc ]; then
	cp ~/.vimrc ~/.vimrc.ubuntu-setup.back; fi

ln -f -s ./source/.zshrc ~/.zshrc
ln -f -s ./source/.vimrc ~/.vimrc

ZSH=`which zsh`
if [ $? -eq 0 ]; then
	curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh 
	if [ $SUDO_USER ]; then
		chmod $SUDO_USER:$SUDO_USER ~/.antigen.zsh ~/.zshrc
	fi
	# make default
	chsh -s $(which zsh)
	# inital start
	zsh
fi
VIM=`which vim`
if [ $? -eq 0 ]; then
	# vbundle
	mkdir -p ~/.vim/bundle/ && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	if [ $SUDO_USER ]; then
		chmod $SUDO_USER:$SUDO_USER ~/.vimrc
	fi
fi
