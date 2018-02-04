syntax on
set number
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noswapfile
set nobackup
set ruler
set encoding=utf8

set cursorline

set undofile
set undodir=~/.vim/undo

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

execute pathogen#infect()
syntax on
filetype plugin indent on

map <S-s> :write<CR>
map <C-e> :buffers<CR>
imap jk <ESC>

autocmd BufNewFile,BufRead *.json set ft=javascript

so ~/.vim/settings.vim
