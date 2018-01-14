function ltmux \
    --argument session \
    --description 'create or attach to a tmux session (default: `whoami`)'

    # check if session is define, or use the result of whoami
    set -q session[1]; or set session (whoami)

    if tmux has-session -t $session 2>/dev/null
        tmux -2 attach-session -t $session
    else
        tmux -2 new-session -s $session
    end
end
