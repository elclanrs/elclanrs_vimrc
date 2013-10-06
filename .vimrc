set nocompatible
filetype off

" Undo
set undofile
set undodir=~/.vimundo
set autochdir

set shell=bash\ --login

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Plugins
" ------------------------------------------------

Bundle 'gmarik/vundle'

Bundle '907th/vim-auto-save'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/SyntaxComplete'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mattn/emmet-vim'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'duff/vim-bufonly'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'
Bundle 'kana/vim-smartinput'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'godlygeek/tabular'

Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'StanAngeloff/php.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'othree/html5.vim'
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'wavded/vim-stylus'
Bundle 'lepture/vim-jinja'
Bundle 'xsbeats/vim-blade'
Bundle 'juvenn/mustache.vim'
Bundle 'aaronj1335/underscore-templates.vim'
Bundle 'gkz/vim-ls'
Bundle 'dag/vim2hs'

Bundle 'daylerees/colour-schemes'
Bundle 'wjakob/vim-tomorrow-night'
Bundle 'sjl/badwolf'
Bundle "w0ng/vim-hybrid"
Bundle "vim-scripts/mayansmoke"

filetype plugin indent on


" Autocmd
" ------------------------------------------------

" Autompletition
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

" Open tabs at the end
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

" Custom filetypes
autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.twig set filetype=jinja

" Fix PHP-HTML mixed indentation
autocmd BufNewFile,BufRead *.php set ft=html | set ft=phtml
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade

" Trim whitespace on save
autocmd FileType php,javascript,css,styl autocmd BufWritePre <buffer> :%s/\s\+$//e


" User config
" ------------------------------------------------

set hidden

nnoremap ; :
let mapleader=','
map <leader>; @:

inoremap <C-c> <ESC>

" Save all and exit
map <c-q> :xa<cr>

" Copy/select all to clipboard
map <leader>aa gg"+yGggVG

" Open file in Google Chrome
map <F5> <Esc>:silent !google-chrome %<CR>

" Disabled
nnoremap Q <nop>
nnoremap <c-z> <nop>

" Theme
syntax on

set t_Co=256
colorscheme tomorrow-night

set mouse=a
set mousehide
set hidden
set cursorline
set number
set ruler
set laststatus=2
set scrolloff=5

set lines=50 columns=150
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set guioptions-=T
set guifont=DejaVu\ Sans\ Mono\ 10

" Menus
set wildmenu
set wildmode=list:longest,full

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent
set preserveindent
set nofoldenable

" Tabs
map <c-t> :tabe<cr>
map <c-w> :bd<cr>
nnoremap <silent> <leader>r :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader>l :execute 'silent! tabmove ' . tabpagenr()<CR>
set guitablabel=%t\ %M

" Text wrapping
set wrap
set linebreak
set showbreak=↪
set nolist

" Search
set ignorecase
set hlsearch
set incsearch
set smartcase
nmap <silent> <leader>/ :set invhlsearch<CR>

" Spelling
set nospell


" Plugin config
" ------------------------------------------------

let g:auto_save = 1
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" NERDTree
map <C-e> :NERDTreeToggle<CR>
let g:neocomplcache_enable_at_startup=1

" Supertab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Sessions
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last='yes'

" CtrlP
let g:ctrlp_working_path_mode = 'r'


" Functions
" ------------------------------------------------

map <S-F5> :call Liveify() <cr>
function Liveify()
  silent! exec "! browserify -t liveify % > bundle.js"
endfunction
