map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1
map <F5> :NERDTreeFocus<CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
