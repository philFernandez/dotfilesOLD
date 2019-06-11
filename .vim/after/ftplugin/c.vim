" Build C
nnoremap <c-b><c-p> :!clear;gcc -o %:r %<cr>

" Run C
nnoremap <c-b><c-r> :!clear;./%:r<cr>

" Build AND Run C
function BuildAndRunC()
  exe '!clear;gcc -o %:r % && ./%:r'
endfunction
nnoremap <c-b><c-b> :call BuildAndRunC()<cr>

" Need this for clang_complete and AutoPairs to work together
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn
