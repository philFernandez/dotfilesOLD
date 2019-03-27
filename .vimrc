let mapleader=','
syntax on
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'svermeulen/vim-easyclip'
Plug 'lifepillar/vim-mucomplete'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'philFernandez/onehalf'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'vim-scripts/dbext.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"set background=dark

color onehalfdark

let NERDTreeIgnore = ['\.class$']

" Completion Settings =============================
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
" automatic completion at startup (w/o this have to press tab)
let g:mucomplete#enable_auto_at_startup = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" EASY CLIP  =========================================
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" CTRL P =========================================

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\.git$\|node_modules\|.*.class$'

" Note settings ====================================
let g:notes_directories = ['~/Notes/viNotes']
let g:notes_suffix = '.txt'

" VIM SETTINGS =========================
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

"search settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" text rendering settings
set encoding=utf-8
set linebreak " dont wrap in middle of word
set scrolloff=3
set sidescrolloff=5
set nowrap
"set wrap

set laststatus=2
set noshowmode
set ruler
set number
set cursorline
set splitbelow
set splitright

" zR - open all folds
" zM - close all folds
" zo - unfold area under cursor
" zc - fold area under cursor
" zO - unfold recursively under cursor
" zC - fold recursively under cursor
set foldmethod=indent
set foldnestmax=3
" uncomment to disable fold on file open
set nofoldenable

" other settings
set mouse=n
set lazyredraw
set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100

autocmd BufRead,BufNewFile * setlocal formatoptions-=ro
autocmd BufWrite * :RemoveTrailingSpaces
" =======================================

 "custom syntax settings
 "syntax bolding
hi Question cterm=bold
hi WarningMsg cterm=bold
hi Statement cterm=bold
hi PreProc cterm=bold
hi Type cterm=bold
hi Conditional cterm=bold
hi Keyword cterm=bold
hi Exception cterm=bold
hi PreCondit cterm=bold
hi StorageClass cterm=bold
hi Structure cterm=bold
hi Typedef cterm=bold

hi cssClassName cterm=bold
hi jsFunction cterm=bold
hi Function cterm=bold
hi Repeat cterm=bold
hi jsReturn cterm=bold

" Airline settings ========================
let g:airline_theme = 'badcat'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif


let g:cursormode_color_map = {
      \ "i": '#1CCB13',
      \ "n": '#939393',
      \ "R": '#FF0000',
      \ "v": '#F11BFF',
      \ "V": '#6A1BFF',
      \ "\<C-V>": '#CD82D8',
      \}

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0 " turn of numbers in tabs
let g:airline#extensions#tabline#fnamemod = ':t' " dont show full path tabline
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#cursormode#enabled = 1
" exposes shortcuts to move to tabs/buffes
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Keymappings ================================
let g:AutoPairsShortcutToggle = '<F10>'
"copy into sys clipboard
vnoremap cp "+y
"past from sys clipboard
nnoremap cv "+p



"Disable keybindings so that we can use <leader>ca for Calendar
map <plug>DisableNERDCommenterAltDelims <plug>NERDCommenterAltDelims
map <plug>DisableCalendarH <plug>CalendarH
map <plug>DisableCalendarV <plug>CalendarV
nnoremap <silent> <leader>ca :Calendar<cr>
inoremap jj <Esc>
nnoremap gm m
nnoremap <silent> <leader>nh :GitGutterNextHunk<cr>
nnoremap <silent> <leader>ph :GitGutterPrevHunk<cr>
nnoremap <silent> <leader>rn :set relativenumber!<cr>
nnoremap <silent> <leader>n :set number!<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap <bs> I
nnoremap sa ggVG
nnoremap <silent> <leader>f :NERDTreeToggle<cr>
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bNext<cr>
nnoremap <silent> bc :bdelete!<cr>
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap J }
nnoremap K {
nnoremap q :q<cr>
nnoremap <silent> cc :clo<cr>
nnoremap <space> A
nnoremap <silent> <leader>l :CtrlPBuffer<CR>
nnoremap <silent> <leader>m :pclose<cr>
" Build and run kb shortcuts
nnoremap <leader>bj :!clear;javac %<cr>
nnoremap <leader>rj :!clear;java %:r<cr>
nnoremap <c-b><c-j> :!clear;node %<cr>
nnoremap <c-b><c-p> :!clear;python3 %<cr>

