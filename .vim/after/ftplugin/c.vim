" Build C
nnoremap <c-b><c-p> :!clear;gcc -o %:r %<cr>
" Run C
nnoremap <c-b><c-r> :!clear;./%:r<cr>
" Build AND Run C
function BuildAndRunC()
  exe '!clear;gcc -o %:r % && ./%:r'
endfunction
nnoremap <c-b><c-b> :call BuildAndRunC()<cr>

