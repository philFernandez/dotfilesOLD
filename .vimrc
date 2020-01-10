"                        _   _
"                       ( ) ( ) _
"                       | | | |(_)  ___ ___   _ __   ___
"                       | | | || |/' _ ` _ `\( '__)/'___)
"                       | \_/ || || ( ) ( ) || |  ( (___
"                       `\___/'(_)(_) (_) (_)(_)  `\____)
" need to be first {{{1
set nocompatible
let mapleader=','
let maplocalleader='\'
" Vim Plug {{{1
call plug#begin('~/.vim/plugged')
Plug 'xavierd/clang_complete', { 'for':  [ 'cpp', 'c' ] }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'mattn/calendar-vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'scrooloose/nerdcommenter'
Plug 'chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug '/usr/local/opt/fzf/'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'cpp', 'c' ] }
Plug 'philFernandez/rangerFilePicker.vim'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'PProvost/vim-ps1'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
Plug 'terryma/vim-multiple-cursors' " https://github.com/terryma/vim-multiple-cursors
Plug 'hauleth/vim-backscratch' " re-route commands output to scratch pad, or take notes
Plug 'Clavelito/indent-awk.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'ryanoasis/vim-devicons'
" Un-used plugins {{{1
"Plug 'c9s/perlomni.vim', { 'for': [ 'perl', 'perl6' ] }
"Plug 'sirver/UltiSnips'
"Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'mattn/emmet-vim', { 'for': 'html' }
call plug#end()
" UI Settings {{{1
set showtabline=2
set background=dark
set laststatus=2
set noshowmode
set ruler
set number
set splitbelow
set splitright
" Get rid of delay when entering normal mode
set timeoutlen=1000
set ttimeoutlen=0
"---------------------
hi ALEWarning guibg=NONE guifg=NONE

set cursorline
set cursorlineopt=screenline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
" Other VIM {{{1
set mouse=a
set lazyredraw
set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100
set scrolloff=3
set wildmenu
set tags=./.git/tags;
set tags+=./tags;
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Kernel.framework/Versions/A/Headers
let g:tex_flavor = "latex"

if !isdirectory("/Users/philthy/.vim/.vim-undo-dir")
  call mkdir("/Users/philthy/.vim/.vim-undo-dir", "", 0700)
endif

"set undodir=/tmp/.vim-undo-dir
set undodir=/Users/philthy/.vim/.vim-undo-dir
set undofile
"au BufWrite *.c,*.py,*.java :Autoformat

" keep window position static when switching between buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
" --------------------------------------------------------------------------
"
" No automatic comments on next line
"autocmd BufRead,BufNewFile * setlocal formatoptions-=ro
autocmd FileType vim,zsh,bash,sh,python setlocal formatoptions-=ro
au BufWrite * :RemoveTrailingSpaces
" Indent Settings {{{1
set autoindent
set expandtab " use spaces instead of tabs
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
" Autocmds {{{1
autocmd BufUnload lib,.zshrc silent! :Zrecompile
" Search {{{1
set hlsearch
set ignorecase
set noincsearch
set smartcase
set incsearch
" Text Render (wrap) {{{1
set encoding=utf-8
set linebreak " dont wrap in middle of word
set nowrap
" Fold {{{1
" za - toggle fold under cursor
" zA - toggle fold under cursor recursively
" zR - open all folds
" zM - close all folds
" zo - unfold area under cursor
" zc - fold area under cursor
" zO - unfold recursively under cursor
" zC - fold recursively under cursor
" zj - jump down to next fold
" zk - jump up to previous fold
set foldmethod=indent
"set foldnestmax=1
set foldlevel=0
" uncomment to disable fold on file open
set nofoldenable
" vim-easy-align {{{1
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" highlightedyank {{{1
let g:highlightedyank_highlight_duration = 2500
" Lightline {{{1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \
      \   'active': {
      \     'left': [ [ 'mode', 'paste', 'spell' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \   },
      \
      \   'component_function': {
      \     'gitbranch': 'gitbranch#name'
      \   },
      \
      \   'tab': {
      \     'active': [ 'filename', 'modified' ],
      \     'inactive': [ 'filename', 'modified' ]
      \   },
      \
      \   'tabline': {
      \     'left': [ ['buffers'] ],
      \     'right': [ ['close', 'tabs'] ]
      \   },
      \
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers'
      \   },
      \
      \   'component_type': {
      \     'buffers': 'tabsel'
      \   },
      \
      \   'separator': {
      \     'left': '',
      \     'right': ''
      \   },
      \
      \   'subseparator': {
      \     'left': ' ',
      \     'right': ' '
      \   }
      \
      \ }
" Ultisnips {{{1
"let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
"let g:UltiSnipsSnippetDirectories=["ultisnips"]
"let g:UltiSnipsExpandTrigger="<leader>n"
" Startify {{{1

" Show devicons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
      \ '~/.vimrc',
      \ '~/.zsh/.zwc_dotfiles/.zshrc',
      \ '~/.zshenv',
      \ '~/.zsh/aliases.zsh']
let g:startify_fortune_use_unicode = 1
" When adding/removing files from session
" automatically make saved session reflect
" changes
let g:startify_session_persistence = 1

"let g:startify_custom_header =
      "\ startify#pad(split(system('fortune | cowsay'), '\n'))

"let g:startify_custom_header =
      "\ startify#pad(split(system('figlet -c -f speed', 'Welcome to Vim'), '\n'))

"let g:startify_custom_header =
      "\ startify#pad(split(system('figlet -c -f cricket', 'Pick Your Poison'), '\n'))

let g:startify_custom_header =
      \ startify#pad(split(system('figlet -c -f smshadow', 'Welcome to Vim'), '\n'))

"let g:startify_custom_header =
      "\ startify#pad(split(system('figlet -f drpepper' ,'Welcome to Vim'), '\n'))
" Python Highlight {{{1
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
" Completion {{{1
 "c-x c-o forces completion
set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview
set shortmess+=c
" utomatic completion at startup (w/o this have to press tab)
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.java = [ 'user', 'tags', 'file', 'c-p']
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Python Completion ==================================
" bring up documentation for text under cursor
let g:jedi#documentation_command = 'D'
" Make function signatures show up in command area
let g:jedi#show_call_signatures = "2"

" C Completion =======================================
let g:clang_make_default_keymappings=0
let g:AutoPairsMapCR = 0
imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

autocmd FileType java setlocal omnifunc=javacomplete#Complete
"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <c-x><c-o>


" Easy Clip & Vim-Notes {{{1
let g:notes_directories = ['~/Notes/viNotes']
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
" ALE {{{1
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['autopep8']
      \ }

let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'python': ['pyflakes']
      \ }
"let g:ale_pattern_options = {
      "\ '.*\.java$': {'ale_enabled': 0},
      "\ }
" Keymaps {{{1
nnoremap <silent><localleader>a :ALEToggle<cr>

map <silent><c-t> :TagbarOpenAutoClose<CR>
nnoremap <silent><leader>f :NERDTreeToggle<CR>

" Delete contents of line w/o removing the line itself
nnoremap dl I<Esc>d$

" Turn off number inc/dec
"map <C-A> <Nop>
"map <C-X> <Nop>
"=======================

" pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

tnoremap <c-n> <c-\><c-n>

let g:AutoPairsShortcutToggle = '<F10>'
"copy into sys clipboard
vnoremap <silent> cp "+y
"past from sys clipboard
nnoremap <silent> cv "+p
"Disable keybindings so that we can use <leader>ca for Calendar
map <plug>DisableNERDCommenterAltDelims <plug>NERDCommenterAltDelims
map <plug>DisableCalendarH <plug>CalendarH
map <plug>DisableCalendarV <plug>CalendarV
nnoremap <silent> <leader>ca :Calendar<cr>
nnoremap gm m
nnoremap <silent> <c-s> :Startify<CR>
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>rn :set relativenumber!<cr>
nnoremap <silent> <leader>n :set number!<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap sa ggVG
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bNext<cr>
nnoremap <silent> bc :bdelete!<cr>
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap J }
nnoremap K {
map q :q<cr>
vnoremap q :q<cr>
nnoremap <silent> cc :clo<cr>
nnoremap <space> A
nnoremap <silent> <leader>m :pclose<cr>
nnoremap <c-p> :Files<cr>

" resize splits
nnoremap <silent> <F5> :resize +2<cr>
nnoremap <silent> <F6> :resize -2<cr>
nnoremap <silent> <F7> :vertical resize +2<cr>
nnoremap <silent> <F8> :vertical resize -2<cr>

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" How to open buffers
" ctrl-v = vertical split
" ctrl-x = split
" ctrl-t = tab
nnoremap <silent> <leader>l :Buf<CR>
nnoremap <silent> <leader>k :Win<CR>
" commands {{{1
command! Zrecompile :!zrecompile
" modeline{{{1
" vim:foldenable foldmethod=marker foldcolumn=1
