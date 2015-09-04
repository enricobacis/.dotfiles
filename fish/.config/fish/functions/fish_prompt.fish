function fish_prompt
    set_color -o green
    echo -ns (whoami) '@' (hostname | cut -d. -f1) ' '
    set_color -o blue
    echo -ns (prompt_pwd) '> '
    set color normal
end
