exe "MUcompleteAutoOff"

" insert bullet point
imap <leader>w <esc><space><space>*<space>
nmap <leader>w I<esc><space><space>*<space>
" Remove bullet point
nmap <leader>q I<delete><space><esc>A

set nonumber
set spell
autocmd BufEnter * setfiletype notes
set tw=70
