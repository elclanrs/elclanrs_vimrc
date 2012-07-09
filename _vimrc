set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

autocmd VimEnter * set vb t_vb= "stop beep
set lines=40 columns=120
autocmd BufEnter * setlocal bufhidden=delete "only one buffer in view
:au FocusLost * silent! wa "Save when lose focus
set clipboard=unnamed
set backspace=2
set guitablabel=%t "Only filename in tab
set guioptions-=T  "remove toolbar
set hlsearch
"set spell

" Autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Remove trailing spaces when saving
autocmd BufWritePre * :%s/\s\+$//e

" Plugins
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'rodnaph/vim-color-schemes'
Bundle 'vim-scripts/Color-Sampler-Pack'
Bundle 'wavded/vim-stylus'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'mattn/zencoding-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/loremipsum'
Bundle 'jnwhiteh/vim-golang'

set guifont=Meslo_LG_L_DZ:h9:cANSI
colorscheme bclear
syntax on
set cursorline
set number
set wrap
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set encoding=utf-8
