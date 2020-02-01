
"================================================================"
"        '||'  '|' '||' '||    ||' '||''|.     ..|'''.|          "
"         '|.  .'   ||   |||  |||   ||   ||  .|'     '           "
"          ||  |    ||   |'|..'||   ||''|'   ||                  "
"           |||     ||   | '|' ||   ||   |.  '|.      .          "
"            |     .||. .|. | .||. .||.  '|'  ''|....'           "
"================================================================"
" need to be first {{{1
let mapleader=','
let maplocalleader='\'

" Vim Plug {{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'mattn/calendar-vim'
Plug 'dense-analysis/ale'
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
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'cpp', 'c' ] }
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors' " https://github.com/terryma/vim-multiple-cursors
Plug 'Clavelito/indent-awk.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'ryanoasis/vim-devicons'
Plug 'cespare/vim-toml'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/applescript.vim'
Plug 'lilyball/vim-swift'
Plug 'maximbaz/lightline-ale'
"Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'htmldjango' ] }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
call plug#end()
set nocompatible
filetype plugin indent on
syntax on

" UI Settings {{{1
" fix issues with lagging when matching parenthisis/brackets
"let g:matchparen_insert_timeout = 2
"let g:matchparen_timeout = 2
"-------------------------------------
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

set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" fix broken cursor line --------------------------------
function! s:CustomizeColors()
  if has('guirunning') || has('termguicolors')
    let cursorline_gui=''
    let cursorline_cterm='ctermfg=white'
  else
    let cursorline_gui='guifg=white'
    let cursorline_cterm=''
  endif
  exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
  autocmd!
  autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END
" -------------------------------------------------------
au TermOpen * setlocal nonumber
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
"set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
"set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Kernel.framework/Versions/A/Headers
set display=lastline
set showcmd
set ttyfast
set report=0
set synmaxcol=200
let g:tex_flavor = "latex"

if !isdirectory("/Users/philthy/.local/share/nvim/.vim-undo-dir")
  call mkdir("/Users/philthy/.local/share/nvim/.vim-undo-dir", "", 0700)
endif

"set undodir=/tmp/.vim-undo-dir
set undodir=/Users/philthy/.local/share/nvim/.vim-undo-dir
set undofile

" keep window position static when switching between buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
" --------------------------------------------------------------------------

" Autoformat {{{1
if !exists('g:formatdef_latexindent')
  let g:formatdef_latexindent = '"latexindent.pl - 2>/dev/null"'
endif
let g:formatters_tex = ['latexindent']

au BufWrite *.tex :Autoformat
au BufWrite * :RemoveTrailingSpaces

" No automatic comments on next line
autocmd FileType vim,zsh,bash,sh,python setlocal formatoptions-=ro
" Indent Settings {{{1
set autoindent
set expandtab " use spaces instead of tabs
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

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
set wrapscan " continue search on next line

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


let g:lightline = {}

let g:lightline.colorscheme = 'wombat'

let g:lightline.component_function = {
      \ 'gitbranch'  : 'gitbranch#name',
      \ 'hunksummary': 'hunkstatus#gitgutter'
      \ }

let g:lightline.component_expand = {
      \ 'buffers': 'lightline#bufferline#buffers',
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_infos': 'lightline#ale#infos',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok'
      \ }

let g:lightline.component_type = {
      \ 'buffers' : 'tabsel',
      \ 'linter_checking': 'right',
      \ 'linter_infos': 'right',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'right'
      \ }

let g:lightline.tabline = {
      \ 'left' : [['buffers']],
      \ 'right': [['modified'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok']]
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste', 'spell' ],
      \           [ 'gitbranch', 'readonly', 'hunksummary' ] ]
      \ }

let g:lightline.separator = {
      \ 'left' : '',
      \ 'right': ''
      \ }

let g:lightline.subseparator = {
      \ 'left': '',
      \ 'right': ''
      \ }

" Top bar of lightline ---(separate plugin)-------
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = '1'
let g:lightline#bufferline#unicode_symbols = '1'
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
let g:lightline#bufferline#show_number = '2'
let g:lightline#bufferline#number_map = {
      \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
      \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
" ------------------------------------------------

" ALE Lightline ----------(separate plugin)-------
let g:lightline#ale#indicator_checking = ' '
let g:lightline#ale#indicator_infos = ' '
let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '
let g:lightline#ale#indicator_ok = ' '

" ------------------------------------------------


" Ultisnips {{{1
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<leader>n"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" Startify {{{1

" Show devicons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
      \ '~/.config/nvim/init.vim',
      \ '~/.zsh/.zwc_dotfiles/.zshrc',
      \ '~/.zshenv',
      \ '~/.zsh/aliases.zsh',
      \ '~/Library/Preferences/org.dystroy.broot/conf.toml']
let g:startify_fortune_use_unicode = 1
" When adding/removing files from session
" automatically make saved session reflect
" changes
let g:startify_session_persistence = 1

let g:startify_custom_header =
      \ startify#pad(split(system('figlet -cf epic', 'neo-vim'), '\n'))

" Python Highlight {{{1
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0

" AutoPairs {{{1
if exists("AutoPairs")
  let g:AutoPairsMapCR = 0
  imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
  let g:AutoPairsShortcutToggle = '<F10>'
endif

" Easy Clip & Vim-Notes {{{1
let g:notes_directories = ['~/Notes/viNotes']
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" Completion {{{1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
autocmd FileType json syntax match Comment +\/\/.\+$+
" ALE {{{1
let g:ale_fixers = {
      \ 'c' : ['clang-format']
      \}
let g:ale_fix_on_save = 1
" Keymaps {{{1
let g:user_emmet_leader_key='<C-W>'
"nnoremap <silent><localleader>a :ALEToggle<cr>

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

map <c-b> :w<CR>:!rsync -avr --exclude '.git' ~/Spring_2020/CSC135/Homework/PL_1/html/ fernandp@titan.ecs.csus.edu:/gaia/class/student/fernandp/html/<CR>
map <c-b> :w<CR>:!rsync -avr --exclude '.git' ~/Spring_2020/CSC159/Homework/Phase1/p-code2/ user@192.168.0.65:/home/user/phase1/Code/<CR>

" commands {{{1
command! Zrecompile :!zrecompile
" modeline{{{1
" vim:foldenable foldmethod=marker foldcolumn=1
