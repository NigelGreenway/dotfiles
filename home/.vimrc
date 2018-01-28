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

set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

execute pathogen#infect()
syntax on
filetype plugin indent on

set guifont=FuraCode\ Nerd\ Font:h15
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1
map <C-1> :NERDTreeFocus<CR>

map <S-s> :write<CR>
map <C-e> :buffers<CR>
imap jk <ESC>

" Use EasyMotion for default Vim search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" DevIcons
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufEnter * EnableStripWhitespaceOnSave

" Theme settings
colorscheme dracula
hi CursorLine cterm=NONE ctermbg=black

