set nocompatible                     " be iMproved
filetype off                         " required

" install vim-plug if not already installed
source ~/.vim/utils/plug.vim

call plug#begin()
Plug 'tpope/vim-commentary'          " Comment stuff out
Plug 'othree/eregex.vim',            " Perl style regexp notation
Plug 'itchyny/lightline.vim'         " Light status/tabline
Plug 'tomasr/molokai'                " Molokai color scheme
Plug 'majutsushi/tagbar'             " Display tags in a window
Plug 'SirVer/ultisnips'              " The ultimate snippet solution
Plug 'tpope/vim-fugitive'            " awesome git wrapper
Plug 'terryma/vim-multiple-cursors'  " Sublime Text style multiple selection
Plug 'thinca/vim-quickrun'           " Run commands quickly
Plug 'tpope/vim-sensible'            " Defaults everyone can agree on
Plug 'mhinz/vim-signify'             " Show a diff via Vim sign column
Plug 'honza/vim-snippets'            " UltiSnips snippets
Plug 'mhinz/vim-startify'            " A fancy start screen
Plug 'tpope/vim-unimpaired'          " Pairs of handy bracket mappings
Plug 'mileszs/ack.vim',              { 'on':  'Ack' }                " Vim plugin for ack/ag
Plug 'junegunn/fzf',                 { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',             { 'on':  'FZF' }                " fzf ❤️ vim
Plug 'sjl/gundo.vim',                { 'on':  'GundoToggle' }        " Graph your Vim undo tree in style
Plug 'vim-scripts/LanguageTool',     { 'on':  'LanguageToolCheck' }  " Grammar checker in vim
Plug 'scrooloose/nerdtree',          { 'on':  'NERDTreeToggle' }     " A tree explorer plugin
Plug 'alfredodeza/pytest.vim',       { 'for': 'python' }             " Runs your UnitTests with py.test
Plug 'ternjs/tern_for_vim',          { 'for': 'javascript', 'do': 'npm install', 'frozen': 1 }
Plug 'nvie/vim-flake8',              { 'on': 'Flake8' }              " Flake8 plugin for Vim
Plug 'rdnetto/YCM-Generator',        { 'branch': 'stable' }          " YouCompleteMe generator
Plug 'Valloric/YouCompleteMe',       { 'for': ['c','cpp','javascript','python'], 'do': './install.py --clang-completer', 'frozen': 1 }
" Syntax highlighting
Plug (v:version < 800 ? 'scrooloose/syntastic' : 'w0rp/ale')
call plug#end()

" Enable color formattation
syntax enable

" Set bash as vim shell
set shell=/bin/bash

" Enable 256 colors
set t_Co=256

" show line number
set number

" define where to open splits
set splitbelow
set splitright

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to
set lazyredraw

" show command in bottom bar
set showcmd

" prevent cursor for reaching the first/last line
set scrolloff=1

let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>

" It's 21st century.
noremap j gj
noremap k gk
set backspace=indent,eol,start

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
" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" make Q like q (exit)
command! Q q

" Vim Commentary
vmap <leader>c gc
nmap <leader>c gcc

" Nerd tree
map <F4> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore =['\~$', '.DS_Store$']              " Temporary files
let NERDTreeIgnore+=['\.png$', '\.pdf$', '\.eps$']     " Image files
let NERDTreeIgnore+=['\.pyc$', '__pycache__$']         " Python compiled files
let NERDTreeIgnore+=['\.o$', '\.so$', '\.a$']          " C compiled files

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

" Statusline and Tabline
set laststatus=2
set showtabline=2
set noshowmode

" Fugitive
autocmd User Fugitive SignifyRefresh

" Signify
let g:signify_vcs_list = ['git', 'svn']

" Startify
let g:startify_custom_header = []
let g:startify_bookmarks = [ '~/.vimrc' ]

" Quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = {'outputter': 'message'}

" Ack
nnoremap <leader>a :Ack<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Pytest
nmap <leader>t :Pytest file<CR>

" Theme
silent! colorscheme molokai
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

" Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" jj for esc
inoremap jj <Esc>

" Fzf (CtrlP alternative)
map <leader>p :FZF<CR>


" Tagbar binding
nmap <F8> :TagbarToggle<CR>

" Eregex
nnoremap <leader>/ :call eregex#toggle()<CR>
let g:eregex_default_enable = 0

" ctags utilities
set tags=./tags;/
map <leader>q <C-]>

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>

" UltiSnip
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" LanguageTool
let g:languagetool_jar='/opt/LanguageTool/languagetool-commandline.jar'

" easy motions between splits
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" toggle paste mode with F2
set pastetoggle=<F2>

" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" use single folder for swap files
set directory=~/.vim/swap,.

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo,.
