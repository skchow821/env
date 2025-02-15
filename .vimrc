" Specify a directory for plugins
"
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'kien/ctrlp.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/a.vim'
Plug 'bling/vim-airline'
Plug 'iberianpig/tig-explorer.vim'
call plug#end()

" Personal Preferences
set history=100
set undolevels=1000
" set expandtab # some projects uses tabs.
set tabstop=4
set shiftwidth=4
set gfn=Inconsolata:h18.00
set tags=tags;./tags
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
map <C-l> :Git grep \b<cword>\b <CR> 
map <F4> :A <CR>

" Apple specific
au BufRead,BufNewFile locationd*.log set filetype=log
au BufRead,BufNewFile *.mm set filetype=cpp

" Set up objective extensions
let g:alternateExtensions_mm = "h,H""
let g:alternateExtensions_m = "h,H""
let g:alternateExtensions_cpp = "h,H,hpp""
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,m,mm,MM"

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

" To conform with PEP8 line length
autocmd FileType python setlocal colorcolumn=79
