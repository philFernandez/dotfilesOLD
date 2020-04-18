set shiftwidth=4
set tabstop=4
" Use tab instead of spaces, because this is what eclipse uses by default
"set noexpandtab
"set colorcolumn=80

" Build java
nnoremap <c-b><c-p> :!javac %<cr>
" Run java
nnoremap <c-b><c-r> :!java %:r<cr>
" Build AND Run java
function BuildAndRunJava()
  exe '!javac %;java %:r'
endfunction
nnoremap <c-b><c-b> :call BuildAndRunJava()<cr>
