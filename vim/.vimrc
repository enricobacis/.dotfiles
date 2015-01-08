set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'kien/ctrlp.vim'
"Plugin 'xuhdev/SingleCompile'
"Plugin 'sjl/gundo.vim'

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

" highlight current line
:set cursorline

" smart incremental search
set ignorecase
set smartcase
set incsearch

" highlight search
set hlsearch
" Clear search highlighting
map <C-l> :nohlsearch<CR>

" always show airline
set laststatus=2

" Theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" jj for esc
inoremap jj <Esc>

" SingleCompile bindings
" nmap <F9> :SCCompile<cr>
" nmap <F10> :SCCompileRun<cr>

" Gundo binding
" nnoremap <F5> :GundoToggle<CR>

" bind ctrl+p with CtrlP
" let g:ctrlp_map = '<c-p>'

