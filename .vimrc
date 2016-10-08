set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" ------------------------------------------------

Plugin 'gmarik/Vundle.vim'

Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/noerrmsg.vim'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-endwise'
Plugin 'kana/vim-smartinput'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/vimproc.vim'
Plugin 'mileszs/ack.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'leshill/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'wavded/vim-stylus'
Plugin 'juvenn/mustache.vim'
Plugin 'gkz/vim-ls'
Plugin 'raichoo/haskell-vim'
Plugin 'raichoo/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/vim-cjsx'
Plugin 'posva/vim-vue'
"Plugin 'facebook/vim-flow'
"Plugin 'xsbeats/vim-blade'
"Plugin 'tkztmk/vim-vala'
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'
"Plugin 'wting/rust.vim'
"Plugin 'wlangstroth/vim-racket'
"Plugin 'qbbr/vim-twig'
"Plugin 'JuliaLang/julia-vim'

Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'jwhitley/vim-colors-solarized'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

" Undo
set undofile
set undodir=~/.vimundo
set autochdir
set autoread

if has('gui_running')
  set shell=bash\ -i
endif

" Autocmd
" ------------------------------------------------

" Default new buffer to JavaScript
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif

" Save on losing focus
autocmd FocusLost * silent! wa

" Filetypes
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set completeopt-=preview

" Trim whitespace on save
autocmd FileType php,javascript,css,styl autocmd BufWritePre <buffer> :%s/\s\+$//e

" Quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

" Menus
autocmd FileType typescript setlocal completeopt+=menu,preview

" User config
" ------------------------------------------------

set hidden
set lazyredraw
set regexpengine=1


" Basic shortcuts
nnoremap ; :
let mapleader=','
map <leader>; @:
inoremap <C-c> <ESC>
map <C-q> :xa<CR>
map <leader>aa gg"+yGggVG
map <F5> <Esc>:silent !google-chrome %<CR>
nnoremap q <nop>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
if has('gui_running')
  nnoremap <C-z> <nop>
endif

" Theme
syntax on
set bg=dark
set t_Co=256
if has('gui_running')
  colorscheme one
else
  colorscheme Tomorrow-Night
endif

set cole=0
"hi Conceal guibg=#232C31

set mouse=a
set mousehide
set hidden
set cursorline
set number
set ruler
set laststatus=2
set scrolloff=5
set relativenumber

if has('gui_running')
  set lines=50 columns=160 linespace=3
endif
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set guioptions-=T
set guifont=Liberation\ Mono\ 9

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent
set preserveindent
set nofoldenable
set breakindent

" Split
set splitright

" Tabs
"map <C-t> :tabe<CR>
"map <C-w> :bd<CR>
"map <leader>t :tabe<CR>
"map <leader>w :bd<CR>
"map <S-e> :tabn<CR>
"map <S-q> :tabp<CR>
map <leader>l :execute 'tabmove' tabpagenr()-2 <CR>
map <leader>r :execute 'tabmove' tabpagenr()+1 <CR>
set guitablabel=%t\ %M

" Buffers
map <S-e> :bn<CR>
map <S-q> :bp<CR>

" Text wrapping
set wrap
set linebreak
set showbreak=↪\ 
nnoremap j gj
nnoremap k gk

" Search
set ignorecase
set hlsearch
set incsearch
set smartcase
map <space> /
nmap <silent> <leader>/ :set invhlsearch<CR>

" Spelling
set nospell

" Menus
set wildmenu
set wildmode=list:longest,full

" Whitespace
set list
set listchars=nbsp:¬,tab:»·,trail:˷
hi SpecialKey guifg=OrangeRed

" Plugin config
" ------------------------------------------------

" Syntastic
map <leader>ee :SyntasticCheck<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:auto_save=0
let g:auto_save_in_insert_mode=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_javascript_checkers = ['eslint']
hi SpellBad ctermfg=255 ctermbg=124
highlight link SyntasticErrorSign SpellBad
highlight link SyntasticStyleErrorSign SpellBad

" NERDTree
nmap <C-e> :NERDTreeToggle<CR>

" Sessions
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last='yes'

" CtrlP
let g:ctrlp_working_path_mode='r'
let g:ctrlp_show_hidden=1
set wildignore+=*/node_modules/*,*/jspm_packages/*,*/.git/*,*/vendor/*

" Emmet
imap <C-e> <C-y>,

" Tabular
vnoremap <leader>t :Tabular<space>/

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" JSX
let g:jsx_ext_required=0

" Flow
"let g:flow#enable=0

" Airline
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" TypeScript
let g:typescript_compiler_binary='tsc'
let g:typescript_compiler_options=''

" Tsuquyomi
let g:tsuquyomi_disable_quickfix=1
let g:syntastic_typescript_checkers=['tsuquyomi']
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
