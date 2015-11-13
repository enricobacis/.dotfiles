set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'tpope/vim-unimpaired'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'thinca/vim-quickrun'
Plug 'alfredodeza/pytest.vim'
Plug 'davidhalter/jedi-vim'
Plug 'LanguageTool'
call plug#end()

" Enable color formattation
syntax enable

" Set bash as vim shell
set shell=/bin/bash

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

" prevent cursor for reaching the first/last line
set scrolloff=1

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

" Nerd tree
map <F3> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" always show airline
set laststatus=2

" Signify
let g:signify_vcs_list = ['git', 'svn']

" Startify
let g:startify_bookmarks = [ '~/.vimrc' ]

" Quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = {'outputter': 'message'}

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

" jj for esc
inoremap jj <Esc>

" CtrlP extra bindings
map <leader>p :CtrlPTag<CR>

" Tagbar binding
nmap <F8> :TagbarToggle<CR>

" Jedi
let g:jedi#rename_command = ""

" ctags utilities
set tags=./tags;/
map <leader>q <C-]>

" LanguageTool
let g:languagetool_jar='/opt/LanguageTool/languagetool-commandline.jar'

" easy motions between splits
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" toggle paste mode with F2
set pastetoggle=<F2>

" filetypes
set softtabstop=4 " makes the spaces feel like real tabs
autocmd FileType *      set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" use single folder for swap files
set directory=~/.vim/swap,.

" maintain undo history between sessions
" set undofile
" set undodir=~/.vim/undo,.
