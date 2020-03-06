set tw=95
set nonumber
set concealcursor=n
set nocursorline
" Change checked items to red (for grading CSC133)
nnoremap <leader>g :hi VimwikiCheckBoxDone gui=bold guifg=red<CR>
nnoremap <c-b><c-b> :!pandoc % --to=html5 > ~/Notes/Vimwiki_html/%:t:r.html<CR>

