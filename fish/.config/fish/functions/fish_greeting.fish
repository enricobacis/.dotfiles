function fish_greeting
    if not test -s ~/.config/fish/functions/fundle.fish
        install_fundle
    end
end

function install_fundle
    echo "[Downloading fundle ...]"
    mkdir -p ~/.config/fish/functions
    curl -#fL https://raw.githubusercontent.com/tuvistavie/fundle/master/functions/fundle.fish \
         > ~/.config/fish/functions/fundle.fish ; \
         and echo "echo '[Executing fundle install ...]'; fundle install" | fish ; \
         and echo "[Reloading fish ...]"; and exec fish
end
