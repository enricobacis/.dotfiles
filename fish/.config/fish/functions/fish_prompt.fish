function fish_prompt
    if test "$SSH_CLIENT$SSH_TTY"; set_color -o yellow; else; set_color -o green; end
    echo -ns (whoami) '@' (hostname | cut -d. -f1) ' '
    set_color -o blue
    echo -ns (prompt_pwd) '> '
    set color normal
end
