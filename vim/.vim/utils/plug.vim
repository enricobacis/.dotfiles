" install vim-plug if not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !echo '[Downloading vim-plug] ...'
  silent !mkdir -p ~/.vim/autoload
  let s:plugfile = '~/.vim/autoload/plug.vim'
  let s:plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  if executable('curl')
    silent execute '!curl -sLo ' . s:plugfile ' ' . s:plugurl
  elseif executable('wget')
    silent execute '!wget -q -O ' . s:plugfile ' ' . s:plugurl
  else
    silent !echo 'vim-plug failed: you need either wget or curl'
    cquit
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
