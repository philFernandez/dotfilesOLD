" This file loads up after ~/.vimrc, and after
" plugins are loaded (i think?) so setting
" highlight options here is good, where they
" would otherwise risk being overriden by
" plugins if they were set in ~/.vimrc
" Now we gonna repplace some shit boi.
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
" Get italic comments in themes that dont already have them
hi Comment cterm=italic gui=italic

" Cursor Colors ===========================================================
"hi! nCursor ctermfg=1 ctermbg=1 guifg=#FF8103 guibg=#FF8103
"hi! iCursor ctermfg=1 ctermbg=1 guifg=#00FF00 guibg=#00FF00
"hi! vCursor ctermfg=1 ctermbg=1 guifg=#FFFB00 guibg=#FFFB00
"hi! rCursor ctermfg=1 ctermbg=1 guifg=#FF0000 guibg=#FF0000
"hi! cCursor ctermfg=1 ctermbg=1 guifg=#7A81FF guibg=#7A81FF
"set guicursor=n:block-nCursor/nCursor-blinkwait300-blinkon200-blinkoff140
"set guicursor=c-ci-cr:block-cCursor/cCursor-
"set guicursor+=v:block-vCursor/vCursor-blinkon0
"set guicursor+=r:hor50-rCursor/rCursor-blinkon0
"set guicursor+=i:block-iCursor/iCursor-blinkon0
" change insert cursor to vertical beam (comment out above if use)
"set guicursor+=i-ci:ver1-iCursor/iCursor-blinkwait300-blinkon200-blinkoff140
" =========================================================================

" Vimwiki Customization =====================================
hi VimwikiWeblink1 cterm=bold gui=bold guifg=#66D9EF
hi Vimwikilink cterm=bold gui=bold guifg=#66D9EF
hi Vimwikibold cterm=bold gui=bold guifg=lightgreen
hi VimwikiTag guifg=#212223
hi VimwikiTodo gui=bold guifg=yellow
hi VimwikiHeader2 gui=bold guifg=#FF9300
hi VimwikiHeader3 gui=bold guifg=#FFD479
hi VimwikiHeader4 gui=bold guifg=#0091FF
hi VimwikiHeader5 gui=bold guifg=#80CAFF
hi VimwikiHeader6 gui=bold guifg=#CCF0FF
hi VimwikiItalicT gui=bold,italic guifg=#FF2600
hi VimwikiItalic gui=italic guifg=#FFFF66
hi VimwikiBoldT gui=bold guifg=#FF2600
hi VimwikiDelTextT gui=italic guifg=grey
" ===========================================================

