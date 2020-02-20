" This file loads up after ~/.vimrc, and after
" plugins are loaded (i think?) so setting
" highlight options here is good, where they
" would otherwise risk being overriden by
" plugins if they were set in ~/.vimrc


" Settings {{{1
" vim:foldenable foldmethod=marker foldcolumn=1
set termguicolors " keep this before color theme setting
" Best dark and best light {{{1
"color flattened_dark
"color seoul256-light

" Themes that I like {{{1
"color solarized8_high
"color materialbox
"color onedark
"color tender
"color angr
color molokai
"color molokayo
"color deus
"color yellow-moon
"color seoul256
"color OceanicNext
"color hybrid_material
"let g:oceanic_next_terminal_bold=1
"let g:oceanic_next_terminal_italic=1
" Light Themes {{{1
"color lightning
"color flattened_light
"color carbonized-light

" Custom text settings {{{1
" Uncomment this if themes search highlight is not satasfactory
hi Search cterm=bold gui=bold guifg=yellow guibg=blue
"hi Search cterm=bold,underline gui=bold guifg=yellow guibg=NONE
" Prevent annoying highlighting of matching pairs
hi MatchParen NONE
hi VimwikiWeblink1 cterm=bold gui=bold guifg=cyan
hi Vimwikilink cterm=bold gui=bold guifg=cyan
hi Vimwikibold cterm=bold gui=bold guifg=lightgreen
hi VimwikiTag guifg=grey
" Get italic comments in themes that dont already have them
"hi Comment cterm=italic gui=italic

