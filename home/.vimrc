syntax on
set number
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noswapfile
set nobackup

set cursorline
set undofile
set undodir=~/.vimundo

set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

execute pathogen#infect()
syntax on
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1

" map <Leader>f <Plug>(easymotion-bd-f)

map <S-s> :write<CR>
imap jk <ESC>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufEnter * EnableStripWhitespaceOnSave

" Theme settings
colorscheme dracula
hi CursorLine cterm=NONE ctermbg=black

