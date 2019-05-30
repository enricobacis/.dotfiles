# editors
set -gx EDITOR (type -q vim; and echo vim; or echo vi)
set -gx VISUAL $EDITOR
alias vi $EDITOR

# cups
set -gx CUPS_USER 'x'

# fzf
if type -q fzf
  if type -q rg; set -gx FZF_DEFAULT_COMMAND 'rg --files'
  else if type -q ag; set -gx FZF_DEFAULT_COMMAND 'ag --nocolor -g ""'
  end
end
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# terminal
set -gx TERMINAL sakura

# vagrant
set -gx VAGRANT_DEFAULT_PROVIDER virtualbox

# languages
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

# start X at login
if begin status --is-login; and uname | grep -qi 'linux'; end
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# fisherman
if not functions -q fisher; eval (curl -sfL https://git.io/fisher-install); end

# fisherman/done
set -g __done_min_cmd_duration 10000
set -g __done_min_cmd_duration 10000
set -g __done_exclude '(^git|^vim|^ssh|^i?python[23]?$)'


# bobthefish
set -g theme_show_exit_status yes
set -g theme_date_format "+%a %d %b %Y %T %Z"

# bobthefish specific for the system (PEOPLE MAY WANT TO CHANGE THIS)
set -g default_user enrico
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g fish_color_search_match --background=purple

# rust
if test -d $HOME/.cargo/bin
  set -gx PATH $PATH $HOME/.cargo/bin
end

# ruby gems
if type -q ruby
  set -l GEM_BIN_PATH (ruby -e 'print Gem.user_dir')/bin
  if test -d $GEM_BIN_PATH
    set -gx PATH $PATH $GEM_BIN_PATH
  end
end

# fish bins
if test -d $HOME/.config/fish/bin
  set -gx PATH $PATH $HOME/.config/fish/bin
end

# local bins
if test -d $HOME/.local/bin
  set -gx PATH $PATH $HOME/.local/bin
end

# for local changes
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
