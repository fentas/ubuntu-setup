#!/bin/bash

#curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.zshrc > ~/.zshrc
#curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.vimrc > ~/.vimrc

mkdir -p ~/Development && cd ~/Development
if [ ! -d ./ubuntu-setup ]; then
	git clone https://github.com/fentas/ubuntu-setup.git
fi

cd ./ubuntu-setup
if [ $? -eq 0 ]; then
	if [ -f ~/.zshrc ]; then
		cp ~/.zshrc ~/.zshrc.ubuntu-setup.back; fi
	if [ -f ~/.vimrc ]; then
		cp ~/.vimrc ~/.vimrc.ubuntu-setup.back; fi

	PWD=`pwd`
	ln -f -s $PWD/source/.zshrc ~/.zshrc
	ln -f -s $PWD/source/.vimrc ~/.vimrc
fi

ZSH=`which zsh`
if [ $? -eq 0 ]; then
	curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh 
	# make default
	chsh -s $(which zsh)
	# inital start
	zsh
fi
VIM=`which vim`
if [ $? -eq 0 ]; then
	# vbundle
	mkdir -p ~/.vim/bundle/ && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	# install plugins
	vim +PluginInstall +qall
fi

# make sure user is right
if [ $SUDO_USER ]; then
	chmod $SUDO_USER:$SUDO_USER ~/.antigen.zsh ~/.zshrc ~/.vimrc
fi
