set tw=95
set nonumber
set concealcursor=n
set nocursorline
nnoremap <c-b><c-b> :!pandoc % --to=html5 > ~/Notes/Vimwiki_html/%:t:r.html<CR>

