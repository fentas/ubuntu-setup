set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Conque-GDB' "<-- manuall install. see ~/.vim/autoload/
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'jcf/vim-latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ---------------------------------------------
" settings
set omnifunc=syntaxcomplete#Complete
" omni compl. for c-space instead of <c-x><c-o>
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
function! Auto_complete_string()
	if pumvisible()
		return "\<C-n>"
	else 
		return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
	end
endfunction
function! Auto_complete_opened()
	if pumvisible()
		return "\<Down>"
	end
	return ""
endfunction
inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

" window switch maps
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" make backspace work like most other apps
set backspace=2 
"set backspace=indent,eol,start
syntax on
set number
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" mappings...
map <C-n> :NERDTreeToggle<CR>

map <F10> :!gcc -g -std=c99 -Wall %:p -o %:p:r
map <F11> :!cgdb %:p:r
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" autocmds
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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
