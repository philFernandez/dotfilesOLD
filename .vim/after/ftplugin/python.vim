nnoremap <c-b><c-b> :!clear;python3 %<cr>

" Check if autopep8 is installed
"if executable("autopep8")
  "" if it is then format python code on save
  "autocmd BufWritePost * :silent exec "!autopep8 --in-place --aggressive --aggressive % &"
"endif



