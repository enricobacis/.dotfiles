set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mhinz/vim-startify'
Plugin 'mhinz/vim-signify'
Plugin 'othree/eregex.vim'
Plugin 'DirDiff.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable color formattation
syntax enable

" Enable 256 colors
set t_Co=256

" show line number
set number

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to
set lazyredraw

" show command in bottom bar
set showcmd

" It's 2014.
noremap j gj
noremap k gk

" hidden characters
set list listchars=tab:»\ ,trail:·

" highlight current line
set cursorline

" smart incremental search
set ignorecase
set smartcase
set incsearch

" highlight search
set hlsearch
" Clear search highlighting
map <C-l> :nohlsearch<CR>

" netrw
let g:netrw_liststyle=3
map <leader>e :Explore<CR>

" always show airline
set laststatus=2

" Signify
let g:signify_vcs_list = ['git', 'svn']

" Startify
let g:startify_bookmarks = [ '~/.vimrc' ]

" Theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Wrap lines when using vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Put arrow keys at work
nmap <Left> <<
nmap <Right> >>
nmap <Up> [e
nmap <Down> ]e
vmap <Left> <gv
vmap <Right> >gv
vmap <Up> [egv
vmap <Down> ]egv

" Custom vim-unimpaired
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" jj for esc
inoremap jj <Esc>

" CtrlP extra bindings
map <leader>p :CtrlPTag<CR>

" Tagbar binding
nmap <F8> :TagbarToggle<CR>

" Eregex
let g:eregex_default_enable = 0
nnoremap <leader>/ :call eregex#toggle()<CR>

" ctags utilities
set tags=./tags;/
map <leader>q <C-]>

" easy motions between splits
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
