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
map <S-w> :bdelete<CR>
imap jk <ESC>



" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufEnter * EnableStripWhitespaceOnSave

" Theme settings
colorscheme dracula
hi CursorLine cterm=NONE ctermbg=black

