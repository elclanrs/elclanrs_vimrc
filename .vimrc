
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" ------------------------------------------------

Plugin 'gmarik/Vundle.vim'

Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
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
Plugin 'dkprice/vim-easygrep'

"Plugin 'StanAngeloff/php.vim'
"Plugin 'shawncplus/phpcomplete.vim'
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
Plugin 'xsbeats/vim-blade'
Plugin 'juvenn/mustache.vim'
Plugin 'gkz/vim-ls'
Plugin 'raichoo/haskell-vim'
Plugin 'raichoo/purescript-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'tkztmk/vim-vala'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'wting/rust.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'leafgarland/typescript-vim'
Plugin 'qbbr/vim-twig'
Plugin 'JuliaLang/julia-vim'
Plugin 'mtscout6/vim-cjsx'
"Plugin 'hhvm/vim-hack'
Plugin 'facebook/vim-flow'

Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'duythinht/inori'
Plugin 'abra/vim-abra'

call vundle#end()
filetype plugin indent on

" Undo
set undofile
set undodir=~/.vimundo
set autochdir
set autoread

set shell=bash\ -i

" Autocmd
" ------------------------------------------------

" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Default new buffer to JavaScript
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif

" Save on losing focus
autocmd FocusLost * silent! wa

" Filetypes
autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.wisp set ft=clojure
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set completeopt-=preview

" Trim whitespace on save
autocmd FileType php,javascript,css,styl autocmd BufWritePre <buffer> :%s/\s\+$//e

" Quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

" User config
" ------------------------------------------------

set hidden
set lazyredraw
"set regexpengine=1

" Basic shortcuts
nnoremap ; :
let mapleader=','
map <leader>; @:
inoremap <C-c> <ESC>
map <c-q> :xa<cr>
map <leader>aa gg"+yGggVG
map <F5> <Esc>:silent !google-chrome %<CR>
nnoremap Q <nop>
nnoremap <c-z> <nop>

" Theme
syntax on
set bg=dark
set t_Co=256
if has('gui_running')
  colorscheme base16-atelierlakeside
  set linespace=2
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

set lines=50 columns=160
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set guioptions-=T
set guifont=Menlo:h12

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
map <c-t> :tabe<cr>
"map <c-w> :bd<cr>
map <s-e> :tabn<cr>
map <s-q> :tabp<cr>
map <leader>l :execute 'tabmove' tabpagenr()-2 <CR>
map <leader>r :execute 'tabmove' tabpagenr()+1 <CR>
set guitablabel=%t\ %M

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

let g:syntastic_mode_map={'mode':'passive','active_filetypes':[],'passive_filetypes':[]}
map <leader>ee :SyntasticCheck<CR>

let g:auto_save=0
let g:auto_save_in_insert_mode=0

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers=['jsxhint']

" NERDTree
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" Sessions
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last='yes'

" CtrlP
let g:ctrlp_working_path_mode='r'
let g:ctrlp_show_hidden=1
set wildignore+=*/node_modules/*,*/.git/*,*/vendor/*

" Emmet
imap <C-e> <C-y>,

" Tabular
vnoremap <leader>t :Tabular<space>/

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" Flow
let g:flow#enable=0

" Functions
" ------------------------------------------------

map <S-F5> :call Compile() <cr>
function Compile()
  "silent! exec "! browserify -d -t es6ify % > bundle.js"
  exec "! browserify -d -t es6ify % | node"
endfunction
