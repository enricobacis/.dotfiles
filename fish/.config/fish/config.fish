# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# editors
set -gx EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim

# terminal
set -gx TERMINAL sakura

# vagrant
set -x VAGRANT_DEFAULT_PROVIDER virtualbox

# languages
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

# fundle
if [ -s ~/.config/fish/functions/fundle.fish ]
    fundle plugin 'oh-my-fish/theme-bobthefish'
    fundle plugin 'oh-my-fish/plugin-bang-bang'
    fundle init
else
    echo "[Downloading fundle ...]"
    mkdir -p ~/.config/fish/functions
    curl -#fL https://raw.githubusercontent.com/tuvistavie/fundle/master/functions/fundle.fish \
         > ~/.config/fish/functions/fundle.fish; and echo "fundle install" | fish; and exec fish
end
