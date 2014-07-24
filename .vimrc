set nocompatible
filetype off

" Undo
set undofile
set undodir=~/.vimundo
set autochdir
set autoread

set shell=bash\ --login

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" ------------------------------------------------

Plugin 'gmarik/vundle'

Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'duff/vim-bufonly'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-smartinput'
Plugin 'godlygeek/tabular'

Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'StanAngeloff/php.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
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
Plugin 'aaronj1335/underscore-templates.vim'
Plugin 'gkz/vim-ls'
Plugin 'dag/vim2hs'
Plugin 'lambdatoast/elm.vim'
Plugin 'tkztmk/vim-vala'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'wting/rust.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'leafgarland/typescript-vim'
Plugin 'qbbr/vim-twig'
Plugin 'JuliaLang/julia-vim'
Plugin 'hhvm/vim-hack'

Plugin 'daylerees/colour-schemes'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'w0ng/vim-hybrid'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'croaky/vim-colors-github'
Plugin 'vim-scripts/darkspectrum'
Plugin 'zeis/vim-kolor'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

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

" Fix PHP-HTML mixed indentation
autocmd BufNewFile,BufRead *.php set ft=html | set ft=phtml
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade

" Trim whitespace on save
autocmd FileType php,javascript,css,styl autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set completeopt-=preview

autocmd BufNewFile,BufRead *.wisp set ft=clojure

"if has("autocmd")
  "au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif

" User config
" ------------------------------------------------

set hidden
set lazyredraw

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
set bg=dark

set t_Co=256

if has('gui_running')
  colorscheme base16-ocean
else
  colorscheme tomorrow-night
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
set guifont=Inconsolata\ 12

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
map <s-e> :tabn<cr>
map <s-q> :tabp<cr>
nnoremap <silent> <leader>l :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader>r :execute 'silent! tabmove ' . tabpagenr()<CR>
set guitablabel=%t\ %M

" Split
set splitright

" Text wrapping
set wrap
set linebreak
set showbreak=↪
set nolist
nnoremap j gj
nnoremap k gk

" Search
set ignorecase
set hlsearch
set incsearch
set smartcase
nmap <silent> <leader>/ :set invhlsearch<CR>

" Spelling
set nospell

vnoremap <leader>t :Tabular<space>/

" Plugin config
" ------------------------------------------------

let g:auto_save=1
let g:used_javascript_lib='jquery,underscore,backbone,angularjs'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" NERDTree
nmap <C-e> :NERDTreeToggle<CR>

" Neocomplcache
"let g:neocomplcache_enable_at_startup=1

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Sessions
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last='yes'

" CtrlP
let g:ctrlp_working_path_mode = 'r'

" Emmet
imap <C-e> <C-y>,

" Functions
" ------------------------------------------------

map <S-F5> :call Compile() <cr>
function Compile()
  "silent! exec "! browserify -d -t es6ify % > bundle.js"
  exec "! browserify -d -t es6ify % | node"
endfunction
