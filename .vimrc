syntax on
filetype indent plugin on

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set number  " Set line numbering on.
filetype indent on

""" --------------------------------------
""" Vundle Stuff Goes here and before the call vundle#end()
""" --------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" Easy motion
Plugin 'easymotion/vim-easymotion'

" Syntastic - Syntax Checker + Settings
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:flake8_max_line_length=90
let g:syntastic_flake8_max_line_length=90
" End sytastic options

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Remap Esc to "
:imap jk <Esc>

""" --------------------------------------
""" All Vundle Stuff goes before this line.
""" --------------------------------------

