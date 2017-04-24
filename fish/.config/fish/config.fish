# editors
set -gx EDITOR (type -q vim; and echo vim; or echo vi)
set -gx VISUAL $EDITOR
alias vi $EDITOR

# terminal
set -gx TERMINAL sakura

# vagrant
set -gx VAGRANT_DEFAULT_PROVIDER virtualbox

# languages
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

# start X at login
if begin status --is-login; and uname | grep -qi 'linux'; end
    if test -z "$DISPLAY" -a "$XDG_VTNR" -eq "1"
        exec startx -- -keeptty
    end
end

# fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle init

# bobthefish
set -g theme_display_user yes
set -g theme_show_exit_status yes

# bobthefish specific for the system (PEOPLE MAY WANT TO CHANGE THIS)
set -g default_user enrico
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

# pew - python env wrapper
if type -q pew
    source (pew shell_config)
end

# thefuck
if type -q thefuck
    eval (thefuck --alias | tr '\n' ';')
else
    function fuck; pip install --user thefuck; and exec fish; end
end

# for local changes
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
