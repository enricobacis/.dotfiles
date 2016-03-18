function fish_greeting
    if not test -d ~/.local/share/omf
        install_omf
    end
end

function install_omf
    echo "[Downloading Oh-My-Fish ...]"
    curl -# -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
end
