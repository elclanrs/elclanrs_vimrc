set nocompatible
filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

set dir=$HOME/vimfiles/tmp//
set undodir=$HOME/vimfiles/tmp//

syntax on
let mapleader = ","
nnoremap ; :
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif " default new buffer to JS

au VimEnter * set vb t_vb= " stop beep
au BufEnter * setlocal bufhidden=delete " only one buffer in view

" Auto quickfix
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

set autoread
set encoding=utf-8
set hidden
set magic " regex
set lines=50 columns=150
set clipboard=unnamed " fix clipboard
set guitablabel=%t " only filename in tab
set guioptions-=T  " remove toolbar
set history=500 " undo history
set undofile " persistent undo ...
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload
set wildmode=longest,list:longest
set ch=2

set guifont=Liberation_Mono:h9:cANSI
set background=dark
color solarized
let g:solarized_contrast="high"

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

" Saving
au FocusLost * silent! wa " save when lose focus
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
noremap  <C-s> :wa<CR>

" Search
set hlsearch
set incsearch
set gdefault " the /g flag on :s substitutions by default
nmap <silent> <leader>/ :nohlsearch<CR>

" Tabs
map <leader>tt :tabe<cr>

" Spelling
map <leader>ss :setlocal spell!<cr>

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Scroll
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Some helpers to edit mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loclist=1
let g:syntastic_quiet_warnings=0
let g:syntastic_check_on_open=1

" Coffeescript
au BufWritePost *.coffee silent CoffeeMake! --bare -b | cwindow | redraw!

" Rails
let g:ruby_path = 'C:\RailsInstaller\Ruby1.9.3\bin'

" Python
au FileType python set softtabstop=4 shiftwidth=4

" Supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" 

" Tabularize
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
