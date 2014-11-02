set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Conque-GDB' "<-- manuall install. see ~/.vim/autoload/
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'jcf/vim-latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"
" ---------------------------------------------

" mappings...
map <C-n> :NERDTreeToggle<CR>

map <F10> :!gcc -std=c99 -Wall %:p -o %:p:r

" autocmds
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" settings
set number
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2

" ---------------------------------------------
"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line