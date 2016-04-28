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
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin 'fisherman/autojump'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle plugin 'oh-my-fish/plugin-bang-bang'
fundle init

# bobthefish
set -g theme_display_user yes
set -g default_user enrico
set -g theme_show_exit_status yes
