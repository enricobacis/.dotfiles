# thefuck
if type -q thefuck
    eval (thefuck --alias | tr '\n' ';')
else
    function fuck; pip install --user thefuck; and exec fish; end
end
