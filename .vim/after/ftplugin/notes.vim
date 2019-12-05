exe "MUcompleteAutoOff"

" insert bullet point
imap <leader>w <esc><space><space>*<space>
"nmap <leader>w I<esc><space><space>*<space>
" Remove bullet point
nmap <leader>q I<delete><space><esc>A

set nonumber
autocmd BufEnter * setfiletype notes
set tw=85
set foldenable

nnoremap <leader>w :call vimnotes#doMyMarkDown#DoMarkDownThingNow()<CR>
nnoremap <leader>v :call vimnotes#doMyMarkDown#DoMarkDownHw()<CR>


"autocmd BufWrite * :NoteToMarkdown | :w! ~/Fall_2019/CSC139/Final/Notes.md | :bdelete!


