" install vim-plug if not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !echo '[Downloading vim-plug] ...'
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
