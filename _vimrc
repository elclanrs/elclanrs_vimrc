set nocompatible
filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8

let mapleader = ","
nnoremap ; :

au VimEnter * set vb t_vb= " stop beep
au BufEnter * setlocal bufhidden=delete " only one buffer in view
set lines=50 columns=170
set clipboard=unnamed " fix clipboard
set guitablabel=%t " only filename in tab
set guioptions-=T  " remove toolbar
set hlsearch
set history=500 " undo history
set wildmode=list:longest
set ch=2

" Scroll
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set guifont=Meslo_LG_L_DZ:h9:cANSI
colorscheme Kellys
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

" Autocomplete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP

" Saving
au FocusLost * silent! wa " save when lose focus
au BufWritePre * :%s/\s\+$//e " Remove trailing spaces when saving
noremap  <C-s> :wa<CR>

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loclist=1
let g:syntastic_quiet_warnings=0
let g:syntastic_check_on_open=1

" NERDTree
au vimenter * NERDTree
let g:NERDTreeChDirMode=2
map <leader>n :NERDTreeToggle<CR>

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
