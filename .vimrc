set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/simple-pairs'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mattn/zencoding-vim'
Bundle 'xolox/vim-session'
Bundle 'duff/vim-bufonly'

Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'StanAngeloff/php.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'wavded/vim-stylus'
Bundle 'Glench/Vim-Jinja2-Syntax'

Bundle 'daylerees/colour-schemes'

filetype plugin indent on

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif " default new buffer to JS

autocmd FocusLost * silent! wa " save when lose focus

autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.twig set filetype=jinja

autocmd BufWritePre *.* call TrimEndLines()
function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

autocmd FileType c,cpp,java,php,javascript,css autocmd BufWritePre <buffer> call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

colorscheme kellys

syntax on
set mouse=a
set mousehide
set hidden
set cursorline

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set wildmenu
set wildmode=list:longest,full

set number
set ruler
set ignorecase
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

nnoremap ; :
let mapleader=','

set guioptions-=T
set guifont=DejaVu\ Sans\ Mono\ 10

set autochdir

set lines=45 columns=130
map <c-t> :tabe<cr>
map <c-w> :tabclose<cr>
set guitablabel=%t\ %M

set wrap
set linebreak
set showbreak=\ >>>\ 

set nolist

set incsearch
set ignorecase
set smartcase 
nmap <silent> <leader>/ :set invhlsearch<CR>

set nospell

set shiftwidth=2
set tabstop=2
set softtabstop=2
set copyindent
set preserveindent

set nofoldenable

map <C-e> :NERDTreeToggle<CR>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let g:neocomplcache_enable_at_startup=1 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

let g:session_autosave=1
let g:session_autoload=1
let g:session_default_to_last=1

nnoremap Q <nop>
nnoremap <c-z> <nop>
