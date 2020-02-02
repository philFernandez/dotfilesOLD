" Build C
"nnoremap <c-b><c-p> :!clear;gcc -o %:r %<cr>
"nnoremap <c-b><c-p> :split term://gcc -o %:r %<cr>
nnoremap <c-b><c-p> :!gcc -o %:r %<cr>

" Run C
"nnoremap <c-b><c-r> :!clear;./%:r<cr>
nnoremap <c-b><c-r> :split term://./%:r<cr>

" Build AND Run C
"function BuildAndRunC()
  "exe '!clear;gcc -o %:r % && ./%:r'
"endfunction
"nnoremap <c-b><c-b> :call BuildAndRunC()<cr>
"nnoremap <c-b><c-b> :split term://gcc -o %:r % && ./%:r<cr>
nnoremap <c-b><c-b> :!gcc -o %:r % && ./%:r<cr>


" Need this for clang_complete and AutoPairs to work together
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

set shiftwidth=4
set tabstop=4
set colorcolumn=80
