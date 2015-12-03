function fish_prompt
    if test "$SSH_CLIENT$SSH_TTY"; set_color -o yellow; else; set_color -o green; end
    echo -n -s (whoami) '@' (hostname | cut -d. -f1) ' '
    set_color -o blue
    echo -n -s (prompt_pwd) '> '
    set color normal
end
