" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'bling/vim-airline'
call plug#end()

" Personal Preferences
set tabstop=4
set shiftwidth=4
highlight Normal guibg=Black guifg=White
syntax on

set history=100
set undolevels=1000
set showcmd
set showmatch
set showmode
set title
set encoding=utf-8
set autoindent
set hlsearch
set ruler
colorscheme torte
