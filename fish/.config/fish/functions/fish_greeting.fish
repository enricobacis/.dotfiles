function fish_greeting
    if not test -d ~/.local/share/fisherman
        install_fisherman
    end
end

function install_fisherman
    echo "[Downloading fisherman ...]"
    curl -# -L get.fisherman.sh | fish
end
