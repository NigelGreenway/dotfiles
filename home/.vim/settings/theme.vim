"#
set guifont=FuraCode\ Nerd\ Font:h15
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

" DevIcons
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Theme settings
colorscheme dracula

" Display settings
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
hi CursorLine cterm=NONE ctermbg=black
