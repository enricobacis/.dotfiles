#!/bin/bash

if [ -z ${___inner+x} ]
then
    export ___inner=1
    $TERMINAL -x "bash -c $0"
else
    file=$(fzf)
    if [[ ! -z ${file+x} ]]
    then
        nohup xdg-open "$file" >/dev/null 2>&1 &
        sleep 0.1
    fi
fi
