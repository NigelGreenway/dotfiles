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
hi CursorLine cterm=NONE ctermbg=black

set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set list


autocmd BufNewFile,BufRead *.json set ft=javascript
