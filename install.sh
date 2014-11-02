#!/bin/bash
apt-get update && apt-get install -y \
guake \
vim \
zsh \
latexmk \
pidgin \
pidgin-otr \
pidgin-skype \
git \
curl \
&& curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh \
&& curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.zshrc > ~/.zshrc \
&& mkdir -p ~/.vim/bundle/ && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
&& curl -L https://raw.githubusercontent.com/fentas/ubuntu-setup/master/source/.vimrc > ~/.vimrc && vim +PluginInstall +qall \
&& chsh -s $(which zsh) \
&& source ~/.zshrc
