# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# editors
set -gx EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim

#vagrant
set -x VAGRANT_DEFAULT_PROVIDER virtualbox
