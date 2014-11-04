#!/bin/bash

ZSH=`which zsh`
if [ $? -eq 0 ]; then
	curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh 
	curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.zshrc > ~/.zshrc
	if [ $SUDO_USER ]; then
		chmod $SUDO_USER:$SUDO_USER ~/.antigen.zsh ~/.zshrc
	fi
fi
VIM=`which vim`
if [ $? -eq 0 ]; then
	# vbundle
	mkdir -p ~/.vim/bundle/ && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.vimrc > ~/.vimrc && vim +PluginInstall +qall
	if [ $SUDO_USER ]; then
		chmod $SUDO_USER:$SUDO_USER ~/.vimrc
	fi
fi
