set nocompatible
filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

let mapleader = ","
nnoremap ; :
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif " default new buffer to JS

au VimEnter * set vb t_vb= " stop beep
au BufEnter * setlocal bufhidden=delete " only one buffer in view

" Auto quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set autoread
set encoding=utf-8
set hidden
set magic " regex
set lines=50 columns=150
set clipboard=unnamed " fix clipboard
set guitablabel=%t " only filename in tab
set guioptions-=T  " remove toolbar
set hlsearch
set incsearch
set history=500 " undo history
set wildmode=longest,list:longest
set ch=2

" Scroll
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set guifont=Liberation_Mono:h9:cANSI
set background=dark
colorscheme solarized
syntax on
set cursorline
set number
set ruler
set wrap
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=2

" Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Saving
au FocusLost * silent! wa " save when lose focus
autocmd FileType html,css,javascript,php autocmd BufWritePre <buffer> :%s/\s\+$//e
noremap  <C-s> :wa<CR>

" Tabs
map <leader>tt :tabe<cr>

" Spelling
map <leader>ss :setlocal spell!<cr>

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loclist=1
let g:syntastic_quiet_warnings=0
let g:syntastic_check_on_open=1

" NERDTree
" au vimenter * NERDTree
let g:NERDTreeChDirMode=2
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" Coffeescript
au BufWritePost *.coffee silent CoffeeMake! --bare -b | cwindow | redraw!

" Rails
let g:ruby_path = 'C:\RailsInstaller\Ruby1.9.3\bin'

" Python
au FileType python set softtabstop=4 shiftwidth=4

" Plugins at github
"vim-scripts/JavaScript-Indent
"rodnaph/vim-color-schemes
"vim-scripts/Color-Sampler-Pack
"wavded/vim-stylus
"groenewege/vim-less
"digitaltoad/vim-jade
"mattn/zencoding-vim
"kchmck/vim-coffee-script
"vim-scripts/loremipsum
"scrooloose/syntastic
"ervandew/supertab
"godlygeek/tabular
"leafgarland/typescript-vim
