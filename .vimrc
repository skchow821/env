" Specify a directory for plugins
"
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
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
set laststatus=2
colorscheme torte

" Set display of hidden characters.
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Custom shortcuts
map <F5> :!ctags -R .
map <C-l> :Ggrep '\b<cword>\b' <CR>
map <F4> :A <CR>

" Function to convert to html
function CCopy(start, end)
	let l:cl = &conceallevel
	set conceallevel = 0

	execute a:start . "," . a:end  . "TOhtml"

	%s/font-family : monospace;/font-family: Inconsolata; font-size: 14pt;/
	%!textutil - convert rtf -stdin -stdout | pbcopy
	quit!

	let &conceallevel = l:cl
endfunction
command -range=% -bar CCopy :call CCopy(<line1>, <line2>)
