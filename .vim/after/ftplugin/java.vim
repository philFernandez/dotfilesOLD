set shiftwidth=4
set tabstop=4
" Use tab instead of spaces, because this is what eclipse uses by default
set noexpandtab

" Build java
nnoremap <c-b><c-p> :!clear;javac %<cr>
" Run java
nnoremap <c-b><c-r> :!clear;java %:r<cr>
" Build AND Run java
function BuildAndRunJava()
  exe '!clear;javac %;java %:r'
endfunction
nnoremap <c-b><c-b> :call BuildAndRunJava()<cr>
