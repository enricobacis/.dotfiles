" install vim-plug if not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
  if executable('curl')
    silent !echo '[Downloading vim-plug] ...'
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  else
    silent !echo 'vim-plug installation failed: no curl'
    cquit
  endif
endif
